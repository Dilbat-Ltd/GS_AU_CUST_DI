namespace DanubeIsland.GSAUCUSTDI.BISalesList;

enum 50400 "GSAU BI Document Type"
{
    Extensible = true;

    value(0; Invoice)
    {
        Caption = 'Invoice';
    }
    value(1; "Credit Memo")
    {
        Caption = 'Credit Memo';
    }
}
