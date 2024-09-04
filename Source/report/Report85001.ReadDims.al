report 85001 ReadDims
{
    ApplicationArea = All;
    Caption = 'ReadDims';
    UsageCategory = Lists;
    ProcessingOnly = true;
    Permissions =
        tabledata DimCorrections = R,
        tabledata "Dimension Set Entry" = R,
        tabledata DimHistory = RIMD;
    dataset
    {
        dataitem(DimCorrections; DimCorrections)
        {
            trigger OnPreDataItem()
            begin
                Clear(Counter);
                Clear(recCounter);
                DimHist.reset;
                DimHist.DeleteAll();
            end;

            trigger OnAfterGetRecord()

            begin
                Window.Update(1, 'Dimensioion Set Entry - Tabelle 1 von 8');
                DimSetEntry.Reset();
                DimSetEntry.SetRange("Dimension Code", DimCorrections."Dimension Code");
                DimSetEntry.SetRange("Dimension Value Code", DimCorrections."Dimension Value");
                WindowText := StrSubstNo('%1 - Wert: %2', DimCorrections."Dimension Code", DimCorrections."Dimension Value");
                Window.Update(2, WindowText);
                Counter := 0;
                If DimSetEntry.findset then begin
                    recCounter := DimSetEntry.Count;
                    repeat
                        DimHist.Reset;
                        DimHist.SetRange("Dimension Set ID", DimSetEntry."Dimension Set ID");
                        If not DimHist.FindFirst then begin
                            Zeile := Zeile + 1;
                            Counter := Counter + 1;
                            DimHist.Init();
                            DimHist.EntryNo := Zeile;
                            DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                            DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                            DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                            DimHist."Table No" := 480;
                            DimHist.Insert;
                            Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                        end;
                    until DimSetEntry.next = 0;
                    Commit();
                end;
            end;

            trigger OnPostDataItem()
            begin
                DimHist.Reset();
                DimHist.SetRange("Table No", 480);
                If DimHist.findset then begin
                    Window.Update(1, 'Purchase Line - Tabelle 2 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        PurchLn.Reset();
                        PurchLn.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If PurchLn.Findset then begin
                            recCounter := recCounter * PurchLn.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 39;
                                DimHist."Document No" := PurchLn."Document No.";
                                DimHist."Line No" := PurchLn."Line No.";
                                DimHist.Insert;
                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until PurchLn.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

                DimHist.Reset();
                DimHist.SetRange("Table No", 480);
                If DimHist.findset then begin
                    Window.Update(1, 'Purchase Invoice Line - Tabelle 3 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        PurchInvLn.Reset();
                        PurchInvLn.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If PurchInvLn.Findset then begin
                            recCounter := recCounter * PurchInvLn.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 123;
                                DimHist."Document No" := PurchInvLn."Document No.";
                                DimHist."Line No" := PurchInvLn."Line No.";
                                DimHist.Insert;
                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until PurchInvLn.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

                DimHist.Reset();
                DimHist.SetRange("Table No", 480);
                If DimHist.findset then begin
                    Window.Update(1, 'Purchase CR.-Memo Line - Tabelle 4 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        PurchCrMemoLn.Reset();
                        PurchCrMemoLn.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If PurchCrMemoLn.Findset then begin
                            recCounter := recCounter * PurchCrMemoLn.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 125;
                                DimHist."Document No" := PurchCrMemoLn."Document No.";
                                DimHist."Line No" := PurchCrMemoLn."Line No.";
                                DimHist.Insert;
                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until PurchCrMemoLn.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

                DimHist.Reset();
                If DimHist.findset then begin
                    Window.Update(1, 'Vedor Ledger Entry - Tabelle 5 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        VendLedgEntry.Reset();
                        VendLedgEntry.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If VendLedgEntry.Findset then begin
                            recCounter := recCounter * VendLedgEntry.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 25;
                                DimHist."Document No" := VendLedgEntry."Document No.";
                                DimHist."Line No" := VendLedgEntry."Entry No.";
                                DimHist.Insert;

                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until VendLedgEntry.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

                DimHist.Reset();
                If DimHist.findset then begin
                    Window.Update(1, 'GL Entry - Tabelle 6 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        GLEntry.Reset();
                        GLEntry.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If GLEntry.Findset then begin
                            recCounter := recCounter * GLEntry.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 17;
                                DimHist."Document No" := GLEntry."Document No.";
                                DimHist."Line No" := GLEntry."Entry No.";
                                DimHist.Insert;

                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until GLEntry.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

                DimHist.Reset();
                If DimHist.findset then begin
                    Window.Update(1, 'Job Ledger Entry - Tabelle 7 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        JobLedgEntry.Reset();
                        JobLedgEntry.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If JobLedgEntry.Findset then begin
                            recCounter := recCounter * JobLedgEntry.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 169;
                                DimHist."Document No" := JobLedgEntry."Document No.";
                                DimHist."Line No" := JobLedgEntry."Entry No.";
                                DimHist.Insert;

                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until JobLedgEntry.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

                DimHist.Reset();
                If DimHist.findset then begin
                    Window.Update(1, 'Budget Ledger Entry - Tabelle 8 von 8');
                    Counter := 0;
                    recCounter := DimHist.Count;
                    repeat
                        WindowText := StrSubstNo('%1 - Wert: %2', DimHist."Dimension Code", DimHist."Dimension Value");
                        Window.Update(2, WindowText);
                        GLBudgEntry.Reset();
                        GLBudgEntry.SetRange("Dimension Set ID", DimHist."Dimension Set ID");
                        If GLBudgEntry.Findset then begin
                            recCounter := recCounter * GLBudgEntry.count;
                            repeat
                                Zeile := Zeile + 1;
                                Counter := Counter + 1;
                                DimHist.Init();
                                DimHist.EntryNo := Zeile;
                                DimHist."Dimension Set ID" := DimSetEntry."Dimension Set ID";
                                DimHist."Dimension Code" := DimSetEntry."Dimension Code";
                                DimHist."Dimension Value" := DimSetEntry."Dimension Value Code";
                                DimHist."Table No" := 96;
                                DimHist."Document No" := GLBudgEntry."Global Dimension 2 Code";
                                DimHist."Line No" := GLBudgEntry."Entry No.";
                                DimHist.Insert;

                                Window.UPDATE(3, STRSUBSTNO('%1 von %2', Counter, recCounter));
                            until GLBudgEntry.Next() = 0;
                        end;
                    until DimHist.Next() = 0;
                end;

            end;
        }
    }
    trigger OnPreReport()
    begin
        Window.Open(DlgText);
    end;

    trigger OnPostReport()
    begin
        Page.Run(Page::DimHistory);
    end;

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
