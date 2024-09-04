/// <summary>
/// Report InsertJobLedgerEntry (ID 85003).
/// </summary>
report 85003 "InsertJobLedgerEntry"
{
    ApplicationArea = All;
    Caption = 'InsertJobLedgerEntry';
    UsageCategory = Lists;
    ProcessingOnly = true;
    Permissions =
        tabledata JLECorrections = rimd,
        tabledata "Job Ledger Entry" = rimd;

    dataset
    {
        dataitem(JLECorrections; JLECorrections)
        {
            trigger OnPreDataItem()
            begin
                Clear(Counter);
                Clear(recCounter);
            end;

            trigger OnAfterGetRecord()
            var
                JobLedgEntry: Record "Job Ledger Entry";
                Zeile: Integer;
            begin
                JobLedgEntry.reset;
                Zeile := JobLedgEntry.GetLastEntryNo();
                JobLedgEntry.init;
                JobLedgEntry.TransferFields(JLECorrections);
                JobLedgEntry."Entry No." := Zeile + 1;
                If JobLedgEntry.Insert then
                    Counter := Counter + 1;
                recCounter := recCounter + 1;

            end;

            trigger OnPostDataItem()
            begin
                Message('%1 von %2 Datensätzen konnten zugeordner werden.', Counter, recCounter);
            end;
        }
    }
    var
        Counter: Integer;
        recCounter: integer;
}
