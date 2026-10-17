namespace DanubeIsland.GSAUCUSTDI.BISalesList;

using Microsoft.Sales.Document;

table 50400 "GSAU BI Sales Document"
{
    Caption = 'GS AU and NZ BI Sales Document';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; RowNo; Integer)
        {
            Caption = 'Row No.';
        }
        field(3; "Document Type"; Enum "GSAU BI Document Type")
        {
            Caption = 'Document Type';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(7; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
        }
        field(20; "Type"; Enum "Sales Line Type")
        {
            Caption = 'Type';
        }
        field(30; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(40; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(44; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
        }
        field(45; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
        }
        field(50; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }
        field(60; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(70; Amount; Decimal)
        {
            Caption = 'Amount';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(80; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(85; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }

        field(90; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(100; "Variant Code"; Code[20])
        {
            Caption = 'Variant Code';
        }
        field(105; "Item Variant Description 2"; Text[50])
        {
            Caption = 'Item Variant Description 2';
        }
        field(110; "Long Description"; Text[250])
        {
            Caption = 'Long Description';
        }
        field(120; "Customer GSPOS No."; Text[150])
        {
            Caption = 'Customer GSPOS No.';
        }
        field(140; "Country/Region Code"; code[10])
        {
            Caption = 'Country/Region Code';
        }
        field(150; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
        }
        field(160; "Bill-to Name"; Text[100])
        {
            Caption = 'Bill-to Name';
        }
        field(161; "Bill-to Contact"; Text[100])
        {
            Caption = 'Bill-to Contact';
        }
        field(162; "Global Account No."; Code[20])
        {
            Caption = 'Global Account No.';
        }
        field(163; "Global Account Name"; Text[100])
        {
            Caption = 'Global Account Name';
        }
        field(164; "Local Account No."; Code[20])
        {
            Caption = 'Local Account No.';
        }
        field(165; "Local Account Name"; Text[100])
        {
            Caption = 'Local Account Name';
        }
        field(166; "NIS 2 Credit Account"; integer)
        {
            Caption = 'NIS 2 Credit Account';
        }
        field(167; "NIS 2 Debit Account"; integer)
        {
            Caption = 'NIS2 Debit Account';
        }
        field(168; "NIS Account Name"; Text[50])
        {
            Caption = 'NIS Account Name';
        }

        field(170; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
        }
        field(171; "Consol. Debit Acc."; Code[20])
        {
            Caption = 'Consol. Debit Acc.';
        }
        field(172; "Consol. Credit Acc."; Code[20])
        {
            Caption = 'Consol. Credit Acc.';
        }
        field(175; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
        }
        field(180; "Salesperson Name"; Text[100])
        {
            Caption = 'Salesperson Name';
        }
        field(181; "Salesperson Dim. Value Code"; Code[20])
        {
            Caption = 'Salesperson Dimension Value Code';
        }
        field(182; "Salesperson Dim. Value Name"; Text[50])
        {
            Caption = 'Salesperson Dimension Value Name';
        }
        field(185; "SourceSystemID"; Code[30])
        {
            Caption = 'SourceSystemID';
        }
        field(190; "End-User Reference ID"; Code[20])
        {
            Caption = 'End-User Reference ID';
        }
        field(200; SDSystemCreatedAt; DateTime)
        {
            Caption = 'DSSystemCreatedAt';
        }
        field(210; "Partner Sales Settlement"; Boolean)
        {
            Caption = 'Partner Sales Settlement';
        }
        field(220; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(230; Comment; Text[1024])
        {
            Caption = 'Comment';
        }

    }
    keys
    {
        key(PK; RowNo)
        {
            Clustered = true;
        }
    }
}
