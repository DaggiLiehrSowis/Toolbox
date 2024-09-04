/// <summary>
/// Codeunit "ToolBoxManagement" (ID 85000).
/// </summary>
codeunit 85000 ToolBoxManagement
{
    Permissions =
        tabledata "Sales Cr.Memo Header" = rimd,
        tabledata "Sales Invoice Header" = rimd,
        tabledata "Sales Invoice Line" = rimd,
        tabledata "VAT Entry" = rimd;

    trigger OnRun()
    begin
        VATE.reset;
        vate.SetRange("VAT Prod. Posting Group", 'RU2');
        if vate.FindSet() then
            Counter := vate.Count;
        repeat
            vate."EU Service" := true;
            vate.Modify();
        until vate.Next() = 0;
        Message('%1 Datensätze bearbeitet', Counter);
    end;

    var
        SalesInvLn: Record "Sales Invoice Line";
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        SalesInvHdr: Record "Sales Invoice Header";
        VATE: Record "VAT Entry";
        Counter: Integer;
}
