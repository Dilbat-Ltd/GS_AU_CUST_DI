namespace DanubeIsland.GSAUCUSTDI.BISalesList;

using Microsoft.Sales.Customer;
using Microsoft.Sales.History;

query 50401 "GSAU BI Sales Cr. Memo"
{
    Caption = 'GS BI Sales Cr. Memo';
    QueryType = Normal;
    OrderBy = descending(Document_No_);

    elements
    {

        dataitem(Sales_Cr_Memo_Header; "Sales Cr.Memo Header")
        {
            column(Document_No_; "No.")
            {
            }
            column(Order_No_; "Return Order No.")
            { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            { }
            column(Sell_to_Country_Region_Code; "Sell-to Country/Region Code")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Currency_Code; "Currency Code")
            { }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            { }
            column(Bill_to_Name; "Bill-to Name")
            { }
            column(Bill_to_Contact; "Bill-to Contact")
            { }
            column(Salesperson_Code; "Salesperson Code")
            { }
            column(Ship_to_Contact; "Ship-to Contact")
            { }
            dataitem(Sales_Cr_Memo_Line; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = Sales_Cr_Memo_Header."No.";
                SqlJoinType = InnerJoin;
                column(Line_No_; "Line No.")
                {
                }
                column("Type"; "Type")
                {
                }
                column(No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Description_2; "Description 2")
                { }
                column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
                { }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                { }
                column(Quantity; Quantity)
                {
                }
                Column(Unit_of_Measure_Code; "Unit of Measure Code")
                {
                }
                column(Amount; Amount)
                {
                }
                column(Line_Amount; "Line Amount")
                { }
                column(Line_Discount_Amount; "Line Discount Amount")
                { }
                column(Variant_Code; "Variant Code")
                { }
                column(Long_Description; "Long Description")
                { }
                column(End_User_Reference_ID; "End-User Reference ID")
                { }
                column(SystemCreatedAt; SystemCreatedAt)
                { }
                column(Dimension_Set_ID; "Dimension Set ID")
                { }

                dataitem(Customer; Customer)
                {
                    DataItemLink = "No." = Sales_Cr_Memo_Line."Sell-to Customer No.";
                    SqlJoinType = InnerJoin;

                    column(SourceSystemID; SourceSystemID)
                    { }
                }
            }
        }

    }



    trigger OnBeforeOpen()
    begin

    end;
}
