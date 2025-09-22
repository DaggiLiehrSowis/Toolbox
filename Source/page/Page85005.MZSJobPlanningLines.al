page 85005 "MZS Job Planning Lines"
{
    ApplicationArea = All;
    Caption = 'MZS Job Planning Lines';
    PageType = List;
    SourceTable = "Job Planning Line";
    UsageCategory = Lists;
    Permissions = tabledata "Job Planning Line" = rimd;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Job No.";
                Rec."Job No.")
                {
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Line Type"; Rec."Line Type")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
                field("Total Price"; Rec."Total Price")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("Total Cost"; Rec."Total Cost")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("Ledger Entry Type"; Rec."Ledger Entry Type")
                {
                }
            }
        }
    }
}
