table 85001 DimCorrections
{
    Caption = 'DimCorrections';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Dimension Value"; Code[20])
        {
        }
        field(2; "Dimension Code"; Code[20])
        {
        }            

    }
    keys
    {
        key(PK; "Dimension Code", "Dimension Value")
        {
            Clustered = true;
        }
    }
}
