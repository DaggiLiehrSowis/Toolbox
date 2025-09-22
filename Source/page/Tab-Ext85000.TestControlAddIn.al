tableextension 85000 TestControlAddIn extends Customer
{
    fields
    {
        field(85000; MyProgress; Integer)
        {
            Caption = 'MyProgress';
            DataClassification = CustomerContent;
        }
    }
}
