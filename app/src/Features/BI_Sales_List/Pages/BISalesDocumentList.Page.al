namespace DanubeIsland.GSAUCUSTDI.BISalesList;

using Microsoft.CRM.Team;
using Microsoft.Finance.Dimension;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Inventory.Item;
using Microsoft.Sales.Document;
using Microsoft.Sales.Setup;

page 50400 "GSAU BI Sales Document List"
{
    ApplicationArea = All;
    Caption = 'GS AU and NZ BI Sales Document List';
    PageType = List;
    SourceTable = "GSAU BI Sales Document";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(RowNo; Rec.RowNo)
                {
                    ToolTip = 'Specifies the value of the Row No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Item Variant Description 2"; Rec."Item Variant Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field on the Item Variant linked to the line.';
                }
                field("Long Description"; Rec."Long Description")
                {
                    ToolTip = 'Specifies the value of the Long Description field.';
                }
                field("Customer GSPOS No."; Rec."Customer GSPOS No.")
                {
                    ToolTip = 'Specifies the value of the Customer GSPOS No. field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ToolTip = 'Specifies the value of the Bill-to Name field.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ToolTip = 'Specifies the value of the Bill-to Contact field.';
                }
                field("Global Account No."; Rec."Global Account No.")
                {
                    ToolTip = 'Specifies the value of the Global Account No. field.';
                }
                field("Global Account Name"; Rec."Global Account Name")
                {
                    ToolTip = 'Specifies the value of the Global Account Name field.';
                }
                field("Local Account No."; Rec."Local Account No.")
                {
                    ToolTip = 'Specifies the value of the Local Account No. field.';
                }
                field("Local Account Name"; Rec."Local Account Name")
                {
                    ToolTip = 'Specifies the value of the Local Account Name field.';
                }
                field("NIS 2 Credit Account"; Rec."NIS 2 Credit Account")
                {
                    ToolTip = 'Specifies the value of the NIS 2 Credit Account field.';
                }
                field("NIS 2 Debit Account"; Rec."NIS 2 Debit Account")
                {
                    ToolTip = 'Specifies the value of the NIS 2 Debit Account field.';
                }
                field("NIS Account Name"; Rec."NIS Account Name")
                {
                    ToolTip = 'Specifies the value of the NIS Account Name field.';
                }
                field("Consol. Debit Acc."; Rec."Consol. Debit Acc.")
                {
                    ToolTip = 'Specifies the value of the Consol. Debit Acc. field.';
                }
                field("Consol. Credit Acc."; Rec."Consol. Credit Acc.")
                {
                    ToolTip = 'Specifies the value of the Consol. Credit Acc. field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Salesperson Code field.';
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ToolTip = 'Specifies the value of the Salesperson Name field.';
                }
                field("Salesperson Dim. Value Code"; Rec."Salesperson Dim. Value Code")
                {
                    ToolTip = 'Specifies the value of the dimension that is set up as the Salesperson Dimension Code in the Sales & Receivables Setup.';
                }
                field("Salesperson Dim. Value Name"; Rec."Salesperson Dim. Value Name")
                {
                    ToolTip = 'Specifies the name of the dimension value that is set up as the Salesperson Dimension Code in the Sales & Receivables Setup.';
                }
                field(SourceSystemID; Rec.SourceSystemID)
                {
                    ToolTip = 'Specifies the value of the SourceSystemID field.';
                }
                field("End-User Reference ID"; Rec."End-User Reference ID")
                {
                    ToolTip = 'Specifies the value of the End-User Reference ID field.';
                }
                field(SDSystemCreatedAt; Rec.SDSystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    Caption = 'System Created At';
                }
                field("Partner Sales Settlement"; Rec."Partner Sales Settlement")
                {
                    ToolTip = 'Specifies the value of the Partner Sales Settlement field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.DeleteAll();
        RowCounter := 0;
        GetSalespersonDimensionCode();
        LoadInvoiceData();
        LoadCreditMemoData();
    end;

    local procedure GetSalespersonDimensionCode()
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesReceivablesSetup.Get() then
            SalespersonDimensionCode := SalesReceivablesSetup."Salesperson Dimension Code";
    end;

    local procedure LoadInvoiceData()
    var
        SalesInvoice: Query "GSAU BI Sales Invoice";
    begin
        if not SalesInvoice.Open() then
            exit;

        while SalesInvoice.Read() do
            PopulateRecordFromInvoice(SalesInvoice);
        SalesInvoice.Close();
    end;

    local procedure LoadCreditMemoData()
    var
        SalesCrMemo: Query "GSAU BI Sales Cr. Memo";
    begin
        if not SalesCrMemo.Open() then
            exit;

        while SalesCrMemo.Read() do
            PopulateRecordFromCreditMemo(SalesCrMemo);
        SalesCrMemo.Close();
    end;

    local procedure PopulateRecordFromInvoice(var SalesInvoice: Query "GSAU BI Sales Invoice")
    var
        Salesperson: Record "Salesperson/Purchaser";
    begin
        Rec.Init();
        RowCounter += 1;
        Rec.RowNo := RowCounter;
        Rec."Document Type" := Enum::"GSAU BI Document Type"::Invoice;
        Rec."Document No." := SalesInvoice.Document_No_;
        Rec."Line No." := SalesInvoice.Line_No_;
        Rec."Order No." := SalesInvoice.Order_No_;
        Rec."Sell-to Customer No." := SalesInvoice.Sell_to_Customer_No_;
        Rec.Type := SalesInvoice.Type;
        Rec."No." := SalesInvoice.No_;
        Rec.Description := SalesInvoice.Description;
        Rec."Description 2" := SalesInvoice.Description_2;
        Rec."Gen. Bus. Posting Group" := SalesInvoice.Gen__Bus__Posting_Group;
        Rec."Gen. Prod. Posting Group" := SalesInvoice.Gen__Prod__Posting_Group;
        GetGLAccountInformation(SalesInvoice.Gen__Bus__Posting_Group, SalesInvoice.Gen__Prod__Posting_Group, SalesInvoice.Type, SalesInvoice.No_);
        Rec.Quantity := SalesInvoice.Quantity;
        Rec.Amount := SalesInvoice.Amount;
        Rec."Line Amount" := SalesInvoice.Line_Amount;
        Rec."Line Discount Amount" := SalesInvoice.Line_Discount_Amount;
        Rec."Posting Date" := SalesInvoice.Posting_Date;
        Rec."Variant Code" := SalesInvoice.Variant_Code;
        SetItemVariantDescription2(SalesInvoice.Type, SalesInvoice.No_, SalesInvoice.Variant_Code);
        Rec."Long Description" := SalesInvoice.Long_Description;
        Rec."Customer GSPOS No." := SalesInvoice.SourceSystemID;
        Rec."Country/Region Code" := SalesInvoice.Sell_to_Country_Region_Code;
        Rec."Bill-to Customer No." := SalesInvoice.Bill_to_Customer_No_;
        Rec."Bill-to Name" := SalesInvoice.Bill_to_Name;
        Rec."Bill-to Contact" := SalesInvoice.Bill_to_Contact;
        Rec."Currency Code" := SalesInvoice.Currency_Code;
        Rec."Salesperson Code" := SalesInvoice.Salesperson_Code;
        SetSalespersonName(Salesperson, SalesInvoice.Salesperson_Code);
        SetSalespersonDimensionValue(SalesInvoice.Dimension_Set_ID);
        Rec.SourceSystemID := SalesInvoice.SourceSystemID;
        Rec."End-User Reference ID" := SalesInvoice.End_User_Reference_ID;
        Rec.SDSystemCreatedAt := SalesInvoice.SystemCreatedAt;
        Rec."Partner Sales Settlement" := SalesInvoice.Partner_Settlement_Invoice;
        Rec."External Document No." := SalesInvoice.External_Document_No_;
        Rec.Comment := SalesInvoice.Comment;
        Rec.Insert();
    end;

    local procedure PopulateRecordFromCreditMemo(var SalesCrMemo: Query "GSAU BI Sales Cr. Memo")
    var
        Salesperson: Record "Salesperson/Purchaser";
    begin
        Rec.Init();
        RowCounter += 1;
        Rec.RowNo := RowCounter;
        Rec."Document Type" := Enum::"GSAU BI Document Type"::"Credit Memo";
        Rec."Document No." := SalesCrMemo.Document_No_;
        Rec."Line No." := SalesCrMemo.Line_No_;
        Rec."Order No." := SalesCrMemo.Order_No_;
        Rec."Sell-to Customer No." := SalesCrMemo.Sell_to_Customer_No_;
        Rec.Type := SalesCrMemo.Type;
        Rec."No." := SalesCrMemo.No_;
        Rec.Description := SalesCrMemo.Description;
        Rec."Description 2" := SalesCrMemo.Description_2;
        Rec."Gen. Bus. Posting Group" := SalesCrMemo.Gen__Bus__Posting_Group;
        Rec."Gen. Prod. Posting Group" := SalesCrMemo.Gen__Prod__Posting_Group;
        GetGLAccountInformation(SalesCrMemo.Gen__Bus__Posting_Group, SalesCrMemo.Gen__Prod__Posting_Group, SalesCrMemo.Type, SalesCrMemo.No_);
        Rec.Quantity := -SalesCrMemo.Quantity;
        Rec.Amount := -SalesCrMemo.Amount;
        Rec."Line Amount" := -SalesCrMemo.Line_Amount;
        Rec."Line Discount Amount" := -SalesCrMemo.Line_Discount_Amount;
        Rec."Posting Date" := SalesCrMemo.Posting_Date;
        Rec."Variant Code" := SalesCrMemo.Variant_Code;
        SetItemVariantDescription2(SalesCrMemo.Type, SalesCrMemo.No_, SalesCrMemo.Variant_Code);
        Rec."Long Description" := SalesCrMemo.Long_Description;
        Rec."Customer GSPOS No." := SalesCrMemo.SourceSystemID;
        Rec."Country/Region Code" := SalesCrMemo.Sell_to_Country_Region_Code;
        Rec."Bill-to Customer No." := SalesCrMemo.Bill_to_Customer_No_;
        Rec."Bill-to Name" := SalesCrMemo.Bill_to_Name;
        Rec."Bill-to Contact" := SalesCrMemo.Bill_to_Contact;
        Rec."Currency Code" := SalesCrMemo.Currency_Code;
        Rec."Salesperson Code" := SalesCrMemo.Salesperson_Code;
        SetSalespersonName(Salesperson, SalesCrMemo.Salesperson_Code);
        SetSalespersonDimensionValue(SalesCrMemo.Dimension_Set_ID);
        Rec.SourceSystemID := SalesCrMemo.SourceSystemID;
        Rec."End-User Reference ID" := SalesCrMemo.End_User_Reference_ID;
        Rec.SDSystemCreatedAt := SalesCrMemo.SystemCreatedAt;
        Rec."Partner Sales Settlement" := SalesCrMemo.Partner_Settlement_Invoice;
        Rec."External Document No." := SalesCrMemo.External_Document_No_;
        Rec.Comment := SalesCrMemo.Comment;
        Rec.Insert();
    end;

    local procedure SetSalespersonName(var Salesperson: Record "Salesperson/Purchaser"; SalespersonCode: Code[20])
    begin
        if SalespersonCode = '' then
            exit;

        Salesperson.Reset();
        if Salesperson.Get(SalespersonCode) then
            Rec."Salesperson Name" := Salesperson.Name;
    end;

    local procedure SetSalespersonDimensionValue(DimensionSetID: Integer)
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        DimensionValue: Record "Dimension Value";
    begin
        if SalespersonDimensionCode = '' then
            exit;

        DimensionSetEntry.SetRange("Dimension Set ID", DimensionSetID);
        DimensionSetEntry.SetRange("Dimension Code", SalespersonDimensionCode);
        if DimensionSetEntry.FindFirst() then begin
            Rec."Salesperson Dim. Value Code" := DimensionSetEntry."Dimension Value Code";
            if DimensionValue.Get(SalespersonDimensionCode, DimensionSetEntry."Dimension Value Code") then
                Rec."Salesperson Dim. Value Name" := DimensionValue.Name;
        end;
    end;

    local procedure SetItemVariantDescription2(LineType: Enum "Sales Line Type"; No: Code[20]; VariantCode: Code[20])
    var
        ItemVariant: Record "Item Variant";
    begin
        if (LineType <> LineType::Item) or (VariantCode = '') then
            exit;

        if ItemVariant.Get(No, VariantCode) then
            Rec."Item Variant Description 2" := ItemVariant."Description 2";
    end;

    local procedure GetGLAccountInformation(GenBusPostingGroup: Code[20]; GenProdPostingGroup: Code[20]; Type: enum "Sales Line Type"; No: CODE[20])
    var
        GeneralPostingSetup: Record "General Posting Setup";
        GLAccount: Record "G/L Account";
    begin
        If Type = Type::Item then begin
            GeneralPostingSetup.Reset();
            GeneralPostingSetup.SetRange("Gen. Bus. Posting Group", GenBusPostingGroup);
            GeneralPostingSetup.SetRange("Gen. Prod. Posting Group", GenProdPostingGroup);
            if GeneralPostingSetup.FindFirst() then begin
                if GLAccount.Get(GeneralPostingSetup."Sales Account") then;
                Rec."Global Account No." := GLAccount."No.";
                Rec."Global Account Name" := GLAccount.Name;
                Rec."Local Account No." := GLAccount."Local Account No.";
                Rec."Local Account Name" := GLAccount."Local Account Name";
                Rec."NIS 2 Credit Account" := GLAccount."NIS 2 Credit Account";
                Rec."NIS 2 Debit Account" := GLAccount."NIS 2 Debit Account";
                Rec."NIS Account Name" := GLAccount."NIS Account Name";
                Rec."Consol. Debit Acc." := GLAccount."Consol. Debit Acc.";
                Rec."Consol. Credit Acc." := GLAccount."Consol. Credit Acc.";
            end;
        end else begin
            if GLAccount.Get(No) then;
            Rec."Global Account No." := GLAccount."No.";
            Rec."Global Account Name" := GLAccount.Name;
            Rec."Local Account No." := GLAccount."Local Account No.";
            Rec."Local Account Name" := GLAccount."Local Account Name";
            Rec."NIS 2 Credit Account" := GLAccount."NIS 2 Credit Account";
            Rec."NIS 2 Debit Account" := GLAccount."NIS 2 Debit Account";
            Rec."NIS Account Name" := GLAccount."NIS Account Name";
            Rec."Consol. Debit Acc." := GLAccount."Consol. Debit Acc.";
            Rec."Consol. Credit Acc." := GLAccount."Consol. Credit Acc.";
        end;
    end;

    var
        RowCounter: Integer;
        SalespersonDimensionCode: Code[20];
}
