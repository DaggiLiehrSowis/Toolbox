page 85002 DimCorrections
{
    ApplicationArea = All;
    Caption = 'DimCorrections';
    PageType = List;
    SourceTable = DimCorrections;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Dimension Code"; Rec."Dimension Code")
                {
                }
                field("Dimension Value"; Rec."Dimension Value")
                {
                }
            }
        }
    }
}
