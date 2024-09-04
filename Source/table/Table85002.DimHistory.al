table 85002 DimHistory
{
    Caption = 'DimHistory';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "EntryNo"; Integer)
        {
        }
        field(2; "Dimension Set ID"; Integer)
        {
        }
        field(3; "Dimension Value"; Code[20])
        {
        }
        field(4; "Dimension Code"; Code[20])
        {
        }
        field(5; "Table No"; Integer)
        {
        }
        field(6; "Document No"; Code[20])
        {
        }
        field(7; "Line No"; Integer)
        {
        }

    }
    keys
    {
        key(PK; "EntryNo")
        {
            Clustered = true;
        }
    }
}
