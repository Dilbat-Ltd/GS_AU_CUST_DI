namespace DanubeIsland.GSAUCUSTDI.CustomerRenumbering;

using Microsoft.Finance.Dimension;
using Microsoft.Sales.Customer;
using System.IO;
using System.Utilities;

report 50401 "GSAU Fix Customer Renumbering"
{
    ApplicationArea = All;
    Caption = 'GS AU and NZ Fix Customer Renumbering';
    ProcessingOnly = true;
    UsageCategory = Administration;
    UseRequestPage = false;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            MaxIteration = 1;

            trigger OnAfterGetRecord()
            begin
                ImportAndProcessFile();
            end;
        }
    }

    var
        CustomerDimensionCodeTok: Label 'CUSTOMER', Locked = true;
        CustomerTemplateCodeTok: Label 'DOM_DIR', Locked = true;
        SelectExcelFileTxt: Label 'Select the customer renumbering Excel file';
        ExcelFileFilterTxt: Label 'Excel Files (*.xlsx)|*.xlsx', Locked = true;
        EmptySheetErr: Label 'The selected Excel sheet does not contain any data.';
        ResultMsg: Label 'Customer renumbering finished.\Processed: %1\Failed: %2%3', Comment = '%1 = success count, %2 = error count, %3 = error details';
        ErrorLineTxt: Label '\- Row %1 (%2 -> %3): %4', Comment = '%1 = row no., %2 = old no., %3 = new no., %4 = error message';

    local procedure ImportAndProcessFile()
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        BlobInStream: InStream;
        BlobOutStream: OutStream;
        FileName: Text;
        SheetName: Text[250];
        OldCustNo: Code[20];
        NewCustNo: Code[20];
        DimValueDescription: Text[50];
        RowNo: Integer;
        LastRowNo: Integer;
        SuccessCount: Integer;
        ErrorCount: Integer;
        ErrorText: Text;
        ErrorDetails: Text;
    begin
        if not UploadIntoStream(SelectExcelFileTxt, '', ExcelFileFilterTxt, FileName, FileInStream) then
            exit;

        // Buffered so the file content can be read twice (sheet lookup + sheet read)
        TempBlob.CreateOutStream(BlobOutStream);
        CopyStream(BlobOutStream, FileInStream);

        TempBlob.CreateInStream(BlobInStream);
        SheetName := TempExcelBuffer.SelectSheetsNameStream(BlobInStream);
        if SheetName = '' then
            exit;

        TempBlob.CreateInStream(BlobInStream);
        TempExcelBuffer.OpenBookStream(BlobInStream, SheetName);
        TempExcelBuffer.ReadSheet();

        TempExcelBuffer.Reset();
        if not TempExcelBuffer.FindLast() then
            Error(EmptySheetErr);
        LastRowNo := TempExcelBuffer."Row No.";

        for RowNo := 2 to LastRowNo do begin
            OldCustNo := CopyStr(GetCellValueAsText(TempExcelBuffer, RowNo, 1), 1, MaxStrLen(OldCustNo));
            NewCustNo := CopyStr(GetCellValueAsText(TempExcelBuffer, RowNo, 2), 1, MaxStrLen(NewCustNo));
            DimValueDescription := CopyStr(GetCellValueAsText(TempExcelBuffer, RowNo, 3), 1, MaxStrLen(DimValueDescription));

            if (OldCustNo = '') and (NewCustNo = '') then
                continue;

            if TryProcessCustomerRow(OldCustNo, NewCustNo, DimValueDescription) then
                SuccessCount += 1
            else begin
                ErrorCount += 1;
                ErrorText := GetLastErrorText();
                ErrorDetails += StrSubstNo(ErrorLineTxt, RowNo, OldCustNo, NewCustNo, ErrorText);
            end;
        end;

        Message(ResultMsg, SuccessCount, ErrorCount, ErrorDetails);
    end;

    local procedure GetCellValueAsText(var TempExcelBuffer: Record "Excel Buffer" temporary; RowNo: Integer; ColumnNo: Integer): Text
    begin
        if TempExcelBuffer.Get(RowNo, ColumnNo) then
            exit(TempExcelBuffer."Cell Value as Text");
        exit('');
    end;

    [TryFunction]
    local procedure TryProcessCustomerRow(OldCustNo: Code[20]; NewCustNo: Code[20]; DimValueDescription: Text[50])
    begin
        ProcessCustomerRow(OldCustNo, NewCustNo, DimValueDescription);
    end;

    local procedure ProcessCustomerRow(OldCustNo: Code[20]; NewCustNo: Code[20]; DimValueDescription: Text[50])
    var
        Customer: Record Customer;
    begin
        if OldCustNo = '' then
            Error('The current customer No. is missing.');
        if NewCustNo = '' then
            Error('The new customer No. is missing.');

        if not Customer.Get(OldCustNo) then
            Error('Customer %1 does not exist.', OldCustNo);

        // Rename() does not run the field OnValidate trigger, so the customization blocking manual No. changes is bypassed
        if OldCustNo <> NewCustNo then
            Customer.Rename(NewCustNo);

        CreateOrUpdateCustomerDimensionValue(NewCustNo, DimValueDescription);
        CopyCustomerTemplateDefaultDimensions(NewCustNo, CustomerTemplateCodeTok);
        SetCustomerSelfDefaultDimension(NewCustNo);
    end;

    local procedure CreateOrUpdateCustomerDimensionValue(CustNo: Code[20]; Description: Text[50])
    var
        Dimension: Record Dimension;
        DimensionValue: Record "Dimension Value";
    begin
        if not Dimension.Get(CustomerDimensionCodeTok) then
            Error('Dimension %1 does not exist.', CustomerDimensionCodeTok);

        if DimensionValue.Get(CustomerDimensionCodeTok, CustNo) then begin
            if Description <> '' then begin
                DimensionValue.Validate(Name, Description);
                DimensionValue.Modify(true);
            end;
        end else begin
            DimensionValue.Init();
            DimensionValue.Validate("Dimension Code", CustomerDimensionCodeTok);
            DimensionValue.Validate(Code, CustNo);
            if Description <> '' then
                DimensionValue.Validate(Name, Description);
            DimensionValue.Insert(true);
        end;
    end;

    local procedure CopyCustomerTemplateDefaultDimensions(CustNo: Code[20]; TemplateCode: Code[20])
    var
        CustomerTempl: Record "Customer Templ.";
        SourceDefaultDimension: Record "Default Dimension";
        DestDefaultDimension: Record "Default Dimension";
        IsNew: Boolean;
    begin
        if not CustomerTempl.Get(TemplateCode) then
            Error('Customer template %1 does not exist.', TemplateCode);

        SourceDefaultDimension.SetRange("Table ID", Database::"Customer Templ.");
        SourceDefaultDimension.SetRange("No.", TemplateCode);
        if SourceDefaultDimension.FindSet() then
            repeat
                IsNew := not DestDefaultDimension.Get(Database::Customer, CustNo, SourceDefaultDimension."Dimension Code");
                if IsNew then begin
                    DestDefaultDimension.Init();
                    DestDefaultDimension.Validate("Table ID", Database::Customer);
                    DestDefaultDimension.Validate("No.", CustNo);
                    DestDefaultDimension.Validate("Dimension Code", SourceDefaultDimension."Dimension Code");
                end;

                DestDefaultDimension.Validate("Dimension Value Code", SourceDefaultDimension."Dimension Value Code");
                DestDefaultDimension.Validate("Value Posting", SourceDefaultDimension."Value Posting");
                if (DestDefaultDimension."Value Posting" = DestDefaultDimension."Value Posting"::"Code Mandatory") and
                   (SourceDefaultDimension."Allowed Values Filter" <> '')
                then
                    DestDefaultDimension.Validate("Allowed Values Filter", SourceDefaultDimension."Allowed Values Filter")
                else
                    DestDefaultDimension."Allowed Values Filter" := '';

                if IsNew then
                    DestDefaultDimension.Insert(true)
                else
                    DestDefaultDimension.Modify(true);
            until SourceDefaultDimension.Next() = 0;
    end;

    local procedure SetCustomerSelfDefaultDimension(CustNo: Code[20])
    var
        DefaultDimension: Record "Default Dimension";
    begin
        if not DefaultDimension.Get(Database::Customer, CustNo, CustomerDimensionCodeTok) then begin
            DefaultDimension.Init();
            DefaultDimension.Validate("Table ID", Database::Customer);
            DefaultDimension.Validate("No.", CustNo);
            DefaultDimension.Validate("Dimension Code", CustomerDimensionCodeTok);
            DefaultDimension.Validate("Dimension Value Code", CustNo);
            DefaultDimension.Validate("Value Posting", DefaultDimension."Value Posting"::"Code Mandatory");
            DefaultDimension.Insert(true);
        end else begin
            DefaultDimension.Validate("Dimension Value Code", CustNo);
            DefaultDimension.Validate("Value Posting", DefaultDimension."Value Posting"::"Code Mandatory");
            DefaultDimension.Modify(true);
        end;
    end;
}
