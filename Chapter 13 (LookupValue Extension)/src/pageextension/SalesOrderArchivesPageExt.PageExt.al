pageextension 50046 "SalesOrderArchivesPageExt" extends "Sales Order Archives" //9349
{
    layout
    {
        addafter("No.")
        {
            field("Lookup Value Code"; Rec."Lookup Value Code")
            {
                ToolTip = 'Specifies the lookup value the transaction is done for.';
                ApplicationArea = All;
            }
        }
    }
}