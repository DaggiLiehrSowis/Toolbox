page 85006 "MZS Page Data Personalization"
{
    ApplicationArea = All;
    Caption = 'MZS Page Data Personalization';
    PageType = List;
    SourceTable = "Page Data Personalization";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                }
                field("Object Type"; Rec."Object Type")
                {
                }
                field("Object ID"; Rec."Object ID")
                {
                }
                field(ValueName; Rec.ValueName)
                {
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                }
                field("Date"; Rec."Date")
                {
                }
            }
        }
    }
}
