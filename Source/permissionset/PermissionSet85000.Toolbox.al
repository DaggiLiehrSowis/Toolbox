/// <summary>
/// Unknown Toolbox (ID 85000).
/// </summary>
permissionset 85000 "Toolbox"
{
    Assignable = true;
    Caption = 'Toolbox', MaxLength = 30;
    Permissions =
        codeunit ToolBoxManagement = X,
        page MZSToolBox = X,
        report InsertJobLedgerEntry = X,
        table JLECorrections = X,
        tabledata JLECorrections = RMID,
        table DimCorrections = X,
        tabledata DimCorrections = RMID,
        table DimHistory = X,
        tabledata DimHistory = RMID,
        page DimHistory = X,
        report ReadDims = X,
        report DeleteDims = X,
        report DelJLEs = X;
}
