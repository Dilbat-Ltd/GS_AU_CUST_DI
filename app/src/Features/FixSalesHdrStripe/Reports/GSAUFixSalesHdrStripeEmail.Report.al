namespace DanubeIsland.GSAUCUSTDI.FixSalesHdrStripe;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

report 50402 "GSAU Fix SalesHdr Stripe Email"
{
    ApplicationArea = All;
    Caption = 'GS AU and NZ Fix Sales Invoice Sell-to E-mail and Stripe Customer';
    ProcessingOnly = true;
    UsageCategory = Administration;
    UseRequestPage = false;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Invoice), "Sell-to E-Mail" = const(''));

            trigger OnAfterGetRecord()
            begin
                if TryFixSalesHeader(SalesHeader) then
                    FixedCount += 1
                else begin
                    SkippedCount += 1;
                    ErrorDetails += StrSubstNo(ErrorLineTxt, SalesHeader."No.", GetLastErrorText());
                end;
            end;
        }
    }

    trigger OnPostReport()
    begin
        Message(ResultMsg, FixedCount, SkippedCount, ErrorDetails);
    end;

    var
        FixedCount: Integer;
        SkippedCount: Integer;
        ErrorDetails: Text;
        ResultMsg: Label 'Sales invoice fix finished.\Fixed: %1\Skipped: %2%3', Comment = '%1 = fixed count, %2 = skipped count, %3 = error details';
        ErrorLineTxt: Label '\- Invoice %1: %2', Comment = '%1 = document no., %2 = error message';

    [TryFunction]
    local procedure TryFixSalesHeader(var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if SalesHeader."Sell-to Customer No." = '' then
            Error('Sell-to Customer No. is missing.');

        if not Customer.Get(SalesHeader."Sell-to Customer No.") then
            Error('Customer %1 does not exist.', SalesHeader."Sell-to Customer No.");

        SalesHeader."Sell-to E-Mail" := Customer."E-Mail";
        SalesHeader."TTR Stripe Customer" := Customer."TTR Stripe Customer";
        SalesHeader.Modify(true);
    end;
}
