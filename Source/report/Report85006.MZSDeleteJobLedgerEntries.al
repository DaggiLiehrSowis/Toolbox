report 85006 "MZS Delete Job Ledger Entries"
{
    ApplicationArea = All;
    Caption = 'MZS Delete Job Ledger Entries';
    UsageCategory = Lists;
    ProcessingOnly = true;
    Permissions = tabledata "Job Ledger Entry" = rimd;

    dataset
    {
        dataitem(JobLedgerEntry; "Job Ledger Entry")
        {
            RequestFilterFields = "Job No.", "Job Task No.", "Entry Type", "No.", Description;

            trigger OnPreDataItem()
            var
                UserConfirmation: Boolean;
            begin
                // Zählen der gefilterten Datensätze
                FilteredCount := Count;

                // Abfrage, ob die Datensätze wirklich gelöscht werden sollen
                UserConfirmation := Confirm(StrSubstNo('Es wurden %1 Datensätze gefunden. Möchten Sie diese wirklich löschen?', FilteredCount));

                if not UserConfirmation then
                    Error('Der Löschvorgang wurde abgebrochen.');

                DeletedCount := 0; // Zurücksetzen des Zählers für die gelöschten Datensätze
            end;

            trigger OnAfterGetRecord()
            begin
                // Löschen der gefilterten Datensätze
                Delete(true);
                DeletedCount += 1;
            end;
        }
    }

    var
        DeletedCount: Integer;
        FilteredCount: Integer;

    trigger OnPostReport()
    begin
        Message('Anzahl der gelöschten Datensätze: %1', DeletedCount);
    end;
}
