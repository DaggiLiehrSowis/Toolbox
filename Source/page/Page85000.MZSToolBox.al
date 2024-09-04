/// <summary>
/// Page "MZSToolBox" (ID 85000).
/// </summary>
page 85000 MZSToolBox
{
    ApplicationArea = All;
    Caption = 'MZSToolBox';
    PageType = List;
    SourceTable = "JLECorrections";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job No."; Rec."Job No.")
                {
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    Visible = false;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Direct Unit Cost (LCY)"; Rec."Direct Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                }
                field("Total Cost"; Rec."Total Cost")
                {
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    Visible = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                }
                field("Total Price"; Rec."Total Price")
                {
                    Visible = false;
                }
                field("Amt. to Post to G/L"; Rec."Amt. to Post to G/L")
                {
                    Visible = false;
                }
                field("Amt. Posted to G/L"; Rec."Amt. Posted to G/L")
                {
                    Visible = false;
                }
                field("Original Unit Cost"; Rec."Original Unit Cost")
                {
                    Visible = false;
                }
                field("Original Total Cost"; Rec."Original Total Cost")
                {
                    Visible = false;
                }
                field("User ID"; Rec."User ID")
                {
                    Visible = false;
                }
                field("Source Code"; Rec."Source Code")
                {
                    Visible = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Visible = false;
                }
                field("Ledger Entry Type"; Rec."Ledger Entry Type")
                {
                }
                field("Ledger Entry No."; Rec."Ledger Entry No.")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Visible = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Visible = true;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Visible = true;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    Visible = true;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    Visible = true;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    Visible = true;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    Visible = true;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    Visible = true;
                }
            }
        }
    }
    actions
    {
        // Add changes to page actions here
        area(Processing)
        {
            action(KORRJLE)
            {
                Caption = 'Import JLEs';
                ApplicationArea = All;
                Image = Delivery;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = report InsertJobLedgerEntry;
            }
            action(ClearJobFields)
            {
                Caption = 'Clear Job Fields';
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    CorrectionJobs: Codeunit 85001;
                begin
                    CorrectionJobs.ClearJobFieldsInSalesLines();
                end;
            }
        }
    }
}
