page 85004 "MZS Object Options"
{
    ApplicationArea = All;
    Caption = 'MZS Object Options';
    PageType = List;
    SourceTable = "Object Options";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Company Name"; Rec."Company Name")
                {
                }
                field("User Name"; Rec."User Name")
                {
                }
                field("Object Type"; Rec."Object Type")
                {
                }
                field("Object ID"; Rec."Object ID")
                {
                }
                field("Option Data"; Rec."Option Data")
                {
                }
                field("Parameter Name"; Rec."Parameter Name")
                {
                }
                field("Public Visible"; Rec."Public Visible")
                {
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                }
            }
        }
    }
}
