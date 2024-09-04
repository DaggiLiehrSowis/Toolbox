page 85007 "MZS User Personalization"
{
    ApplicationArea = All;
    Caption = 'MZS User Personalization';
    PageType = List;
    SourceTable = "User Personalization";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Company; Rec.Company)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Profile ID"; Rec."Profile ID")
                {
                }
                field(Role; Rec.Role)
                {
                }
            }
        }
    }
}
