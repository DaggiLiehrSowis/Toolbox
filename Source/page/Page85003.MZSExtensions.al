page 85003 "MZS Extensions"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "NAV App Installed App";
    SourceTableView = sorting(Publisher) where(Publisher = filter('<>Microsoft'));
    Caption = 'MZS Extensions';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("App ID"; Rec."App ID")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Publisher"; Rec.Publisher)
                {
                    ApplicationArea = All;
                }
                field("Version"; GetVersionDisplayString(Rec))
                {
                    ApplicationArea = All;
                }
                field("Published As"; Rec."Published As")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(View)
            {
                Caption = 'View';
                Image = View;
                ShortcutKey = 'Return';
                RunObject = page "Extension Settings";
                RunPageLink = "App ID" = field("App ID");
                Scope = Repeater;
            }

            action("ExportDependencies")
            {
                Caption = 'Export Dependencies';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Zones;
                trigger OnAction()
                var
                    NonMicrosoftExtensions: Record "NAV App Installed App";
                    TempBlob: Codeunit "Temp Blob";
                    VersionText: Text;
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: Text;
                    CRLF: Text[2];
                    ToFile: Text;
                    FirstItem: Boolean;
                    ExportAll: Boolean;

                begin
                    CRLF[1] := 13;
                    CRLF[2] := 10;
                    FirstItem := true;
                    ExportAll := Confirm('Alle Erweiterungen exportieren? (Nein = nur <> Microsoft)', false);
                    if not ExportAll then
                        NonMicrosoftExtensions.SetFilter(Publisher, '<>%1', 'Microsoft');

                    TempBlob.CreateOutStream(OutStr);
                    OutStr.WriteText('    "dependencies": [' + CRLF);

                    if NonMicrosoftExtensions.FindSet() then
                        repeat
                            if not FirstItem then
                                OutStr.WriteText(',' + CRLF)
                            else
                                FirstItem := false;

                            VersionText := STRSUBSTNO('%1.0.0.0', FORMAT(NonMicrosoftExtensions."Version Major" - 3));
                            OutStr.WriteText('        {' + CRLF);
                            OutStr.WriteText('            "id": "' + LowerCase(RemoveCurlyBraces(NonMicrosoftExtensions."App ID")) + '",' + CRLF);
                            OutStr.WriteText('            "name": "' + NonMicrosoftExtensions.Name + '",' + CRLF);
                            OutStr.WriteText('            "publisher": "' + NonMicrosoftExtensions.Publisher + '",' + CRLF);
                            OutStr.WriteText('            "version": "' + VersionText + '"' + CRLF);
                            OutStr.WriteText('        }');
                        until NonMicrosoftExtensions.Next() = 0;

                    OutStr.WriteText(CRLF + '    ]' + CRLF);

                    TempBlob.CreateInStream(InStr);
                    FileName := 'dependencies.txt';
                    ToFile := FileName;
                    DownloadFromStream(InStr, '', '', FileName, ToFile);
                end;
            }
            action("Export2List")
            {
                Caption = 'Export 2 List';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Column;
                trigger OnAction()
                var
                    NonMicrosoftExtensions: Record "NAV App Installed App";
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: Text;
                    CRLF: Text[2];
                    ToFile: Text;
                    FirstItem: Boolean;
                    ExportAll: Boolean;
                begin
                    CRLF[1] := 13;
                    CRLF[2] := 10;
                    FirstItem := true;

                    ExportAll := Confirm('Alle Erweiterungen exportieren? (Nein = nur <> Microsoft)', false);
                    if not ExportAll then
                        NonMicrosoftExtensions.SetFilter(Publisher, '<>%1', 'Microsoft');

                    TempBlob.CreateOutStream(OutStr);
                    OutStr.WriteText('App ID;Name;Publisher;Version' + CRLF);

                    if NonMicrosoftExtensions.FindSet() then
                        repeat
                            if not FirstItem then
                                OutStr.WriteText(CRLF)
                            else
                                FirstItem := false;

                            OutStr.WriteText(
                                Format(NonMicrosoftExtensions."App ID") + ';' +
                                NonMicrosoftExtensions.Name + ';' +
                                NonMicrosoftExtensions.Publisher + ';' +
                                Format(NonMicrosoftExtensions."Version Major"));
                        until NonMicrosoftExtensions.Next() = 0;

                    TempBlob.CreateInStream(InStr);
                    FileName := 'ExtensionList.csv';
                    ToFile := FileName;
                    DownloadFromStream(InStr, '', '', FileName, ToFile);
                end;
            }
        }
    }
    local procedure GetVersionDisplayString(PublishedApplication: Record "NAV App Installed App"): Text
    var
        NoBuildVersionStringTxt: Label '%1.%2';
        NoRevisionVersionStringTxt: Label '%1.%2.%3';
        FullVersionStringTxt: Label '%1.%2.%3.%4';
    begin
        if PublishedApplication."Version Build" <= -1 then
            exit(StrSubstNo(NoBuildVersionStringTxt, PublishedApplication."Version Major", PublishedApplication."Version Minor"));

        if PublishedApplication."Version Revision" <= -1 then
            exit(StrSubstNo(NoRevisionVersionStringTxt, PublishedApplication."Version Major", PublishedApplication."Version Minor", PublishedApplication."Version Build"));

        exit(StrSubstNo(FullVersionStringTxt, PublishedApplication."Version Major",
            PublishedApplication."Version Minor", PublishedApplication."Version Build", PublishedApplication."Version Revision"));
    end;

    local procedure RemoveCurlyBraces(Value: Guid): Text
    begin
        exit(DelChr(Format(Value), '=', '{}'));
    end;
}
