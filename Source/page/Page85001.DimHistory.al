page 85001 DimHistory
{
    ApplicationArea = All;
    Caption = 'DimHistory';
    PageType = List;
    SourceTable = DimHistory;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(EntryNo; Rec.EntryNo)
                {
                }
                field("Table No"; Rec."Table No")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Dimension Code"; Rec."Dimension Code")
                {
                }
                field("Dimension Value"; Rec."Dimension Value")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field("Line No"; Rec."Line No")
                {
                }

            }
        }
    }
    actions
    {
        // Add changes to page actions here
        area(Processing)
        {
            action(DeleteDIMS)
            {
                Caption = 'Delete DIMS';
                ApplicationArea = All;
                Image = DeleteExpiredComponents;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = report DeleteDims;
            }
        }
    }
}
