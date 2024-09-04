report 85005 MZSDeleteJobPlanningLines
{
    ApplicationArea = All;
    Caption = 'MZSDeleteJobPlanningLines';
    UsageCategory = Lists;
    ProcessingOnly = true;
    dataset
    {
        dataitem(JobPlanningLine; "Job Planning Line")
        {
            DataItemTableView = SORTING("Job No.") WHERE("Job No." = FILTER('ACP KUNDENEVENT 2024|AHI 2024|ANTIKMARKT 2024 NOV|BE THRIFTY OKT. 2024|BIYON KATTILATHU 24|DINO AUSSTELLUNG 24|FACKELTANZ 2024|FESTSPIELPROBEN 2024|FLYING STEPS 2024|FORUM BEFA 2024|GO 90-2000 2024|HAUS & WOHNEN 2024|HOLI FESTIVAL 2024|HUNDEAUSSTELLUNG2024|LAKE ROCK 2024|LORDS OF THE SOUND24|NICK P. 2024|NUKRANOX 2024|OPTION MA-FEST HOF24|PODIUMSDISKUSSION 24|RINGANA 2024|SALK WEIHNACHTSF 24|SISTER ACT 2024|VÖK 2024|WEIHN. M. GERRY 2024|WILDSTYLE & TAT 2024|WINTERTAUSCHBÖRSE 24|ZEUGEN JEHOVAS 2024'));
            trigger OnAfterGetRecord()
            begin
                Delete();
                DeletedCount := DeletedCount + 1;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        DeletedCount := 0;
    end;

    trigger OnPostReport()
    begin
        Message('Anzahl der gelöschten Datensätze: %1', DeletedCount);
    end;

    var
        DeletedCount: Integer;
}
