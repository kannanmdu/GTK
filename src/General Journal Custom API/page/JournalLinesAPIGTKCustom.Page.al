namespace GTK.GTK;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Bank.BankAccount;
using Microsoft.Integration.Graph;
using System.Reflection;


page 50104 "Journal Lines API GTK Custom"
{
    APIGroup = 'GTKAPI';
    APIPublisher = 'GTKIPL';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'journalLinesAPIGTK';
    EntityCaption = 'Journal Line';
    EntitySetCaption = 'Journal Lines';
    DelayedInsert = true;
    EntityName = 'journalLine';
    EntitySetName = 'journalLines';
    PageType = API;
    SourceTable = "Gen. Journal Line";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(SystemId));
                    end;
                }
                field(journalBatchId; Rec."Journal Batch Id") //API Page can accept only Journal Batch Id, Journal batch name cannot be used issue #2
                {
                    Caption = 'Journal Batch Id';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Journal Batch Id"));
                    end;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Journal Batch Name"));
                    end;
                }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Journal Batch Name"));
                    end;
                }
                field(lineNumber; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Journal Batch Name"));
                    end;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Document Type"));
                    end;
                }



                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Account Type"));
                    end;
                }
                field(accountNumber; Rec."Account No.")
                {
                    Caption = 'Account No.';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Account No."));
                    end;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bal. Account Type"));
                    end;

                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    trigger OnValidate()

                    begin
                        RegisterFieldSet(Rec.FieldNo(Amount));
                    end;
                }
                field(balAccountNumber; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Currency Code"));
                    end;
                }
                field(amountLCY; Rec."Amount (LCY)")
                {
                    Caption = 'Amount (LCY)';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Amount (LCY)"));
                    end;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Posting Date"));
                    end;
                }
                field(documentNumber; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Document No."));
                    end;
                }

                field(externalDocumentNumber; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("External Document No."));
                    end;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Description));
                    end;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shortcut Dimension 1 Code"));
                    end;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shortcut Dimension 2 Code"));
                    end;

                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Your Reference"));
                    end;
                }
                field(accountId; Rec."Account Id")
                {
                    Caption = 'Account Id';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Account Id"));
                    end;
                }

                field(balGenBusPostingGroup; Rec."Bal. Gen. Bus. Posting Group")
                {
                    Caption = 'Bal. Gen. Bus. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bal. Gen. Bus. Posting Group"));
                    end;
                }
                field(balGenPostingType; Rec."Bal. Gen. Posting Type")
                {
                    Caption = 'Bal. Gen. Posting Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bal. Gen. Posting Type"));
                    end;
                }
                field(balGenProdPostingGroup; Rec."Bal. Gen. Prod. Posting Group")
                {
                    Caption = 'Bal. Gen. Prod. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bal. Gen. Prod. Posting Group"));
                    end;
                }
                field(balVATBusPostingGroup; Rec."Bal. VAT Bus. Posting Group")
                {
                    Caption = 'Bal. VAT Bus. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bal. VAT Bus. Posting Group"));
                    end;
                }
                field(balVATProdPostingGroup; Rec."Bal. VAT Prod. Posting Group")
                {
                    Caption = 'Bal. VAT Prod. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bal. VAT Prod. Posting Group"));
                    end;
                }
                field(balanceAccountId; Rec."Balance Account Id")
                {
                    Caption = 'Balance Account Id';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Balance Account Id"));
                    end;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Comment));
                    end;
                }

                field(currencyFactor; Rec."Currency Factor")
                {
                    Caption = 'Currency Factor';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Currency Factor"));
                    end;
                }

                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Document Date"));
                    end;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Due Date"));
                    end;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Gen. Bus. Posting Group"));
                    end;
                }
                field(genPostingType; Rec."Gen. Posting Type")
                {
                    Caption = 'Gen. Posting Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Gen. Posting Type"));
                    end;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Gen. Prod. Posting Group"));
                    end;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Payment Method Code"));
                    end;
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Payment Terms Code"));
                    end;
                }

            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean

    begin
        if Rec."Line No." = 0 then
            Rec."Line No." := GetNextLineNo();
        exit(true);
    end;


    local procedure GetNextLineNo(): Integer
    var
        GenJournalLine: Record "Gen. Journal Line";
        LastLineNo: Integer;
        StartingLineNo: Integer;
        IncrementBy: Integer;
    begin
        StartingLineNo := 10000;
        IncrementBy := 100;

        GenJournalLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");

        if not GenJournalLine.FindLast() then
            exit(StartingLineNo);

        LastLineNo := GenJournalLine."Line No.";
        if LastLineNo < StartingLineNo then
            exit(StartingLineNo);

        exit(LastLineNo + IncrementBy);
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::"Gen. Journal Line", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::"Gen. Journal Line";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);

        if FirstEntryNo = 0 then
            FirstEntryNo := TempFieldSet."No.";
    end;

    var
        TempFieldSet: Record "Field" temporary;
        FirstEntryNo: Integer;

}
