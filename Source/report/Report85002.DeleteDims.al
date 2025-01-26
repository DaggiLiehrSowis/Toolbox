report 85002 DeleteDims
{
    ApplicationArea = All;
    Caption = 'DeleteDims';
    UsageCategory = Lists;
    ProcessingOnly = true;
    Permissions = tabledata "Cust. Ledger Entry" = R,
        tabledata DimHistory = R,
        tabledata "Dimension Set Entry" = RIMD;
    dataset
    {
        dataitem(DimHistory; DimHistory)
        {
            DataItemTableView = WHERE("Table No" = CONST(480));
            trigger OnPreDataItem()
            begin
                Clear(Counter);
                Clear(recCounter);
                recCounter := DimHistory.count;
            end;

            trigger OnAfterGetRecord()
            begin
                Counter := Counter + 1;
                WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                Window.Update(1, WindowText);
                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                DimSetEntry.Reset();
                DimSetEntry.SetRange("Dimension Set ID", DimHistory."Dimension Set ID");
                DimSetEntry.SetRange("Dimension Code", DimHistory."Dimension Code");
                DimSetEntry.SetRange("Dimension Value Code", DimHistory."Dimension Value");
                If DimSetEntry.FindSet() then
                    DimSetEntry.DeleteAll(false);
            end;
        }
    }
    var
        DimSetEntry: Record "Dimension Set Entry";
        DimHist: Record DimHistory;
        GLBudgEntry: Record "G/L Budget Entry";
        GLEntry: Record "G/L Entry";
        JobLedgEntry: Record "Job Ledger Entry";
        PurchCrMemoLn: Record "Purch. Cr. Memo Line";
        PurchInvLn: Record "Purch. Inv. Line";
        PurchLn: Record "Purchase Line";
        VendLedgEntry: Record "Vendor Ledger Entry";
        Window: Dialog;
        Counter: Integer;
        recCounter: Integer;
        Zeile: Integer;
        DlgText: Label 'Zeilen werden gelesen...\\#1##########\#2###########\#3###########';
        WindowText: Text;
}
