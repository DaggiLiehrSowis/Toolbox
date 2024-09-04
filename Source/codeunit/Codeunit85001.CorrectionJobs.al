codeunit 85001 "CorrectionJobs"
{
    procedure ClearJobFieldsInSalesLines()
    var
        SalesLine: Record "Sales Line";
    begin
        // Filtere die Verkaufszeilen, bei denen Job No. und Job Task No. nicht leer sind
        SalesLine.Reset();
        if SalesLine.FindSet() then begin
            repeat
                // Leere die Felder
                SalesLine."Job No." := '';
                SalesLine."Job Task No." := '';
                SalesLine.Modify();
            until SalesLine.Next() = 0;
        end;
    end;
}

