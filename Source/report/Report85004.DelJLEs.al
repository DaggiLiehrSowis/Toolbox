report 85004 DelJLEs
{
    ApplicationArea = All;
    Caption = 'DelJLEs';
    UsageCategory = Lists;
    ProcessingOnly = true;
    Permissions =
        tabledata "Job Ledger Entry" = rimd;
    dataset
    {
        dataitem(JobLedgerEntry; "Job Ledger Entry")
        {
        }
    }
    requestpage
    {

        actions
        {
            area(processing)
            {

            }
        }
    }
    trigger OnPostReport()
    var
        Anzahl: Integer;
        OK: Boolean;
    begin
        Anzahl := JobLedgerEntry.Count;
        If Anzahl > 0 then begin
            OK := Confirm(STRSUBSTNO('Möchten Sie %1 Datensätze löschen?', Anzahl), false);
            IF OK then
                JobLedgerEntry.DELETEALL;
        end;
    end;
}
