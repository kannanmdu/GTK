namespace GTK.GTK;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Bank.BankAccount;
using Microsoft.Integration.Graph;

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
                }
                field(journalBatchId; Rec."Journal Batch Id")
                {
                    Caption = 'Journal Batch Id';
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';


                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }

                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                }



                field(accountId; Rec."Account Id")
                {
                    Caption = 'Account Id';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountLCY; Rec."Amount (LCY)")
                {
                    Caption = 'Amount (LCY)';
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                }
                field(balGenBusPostingGroup; Rec."Bal. Gen. Bus. Posting Group")
                {
                    Caption = 'Bal. Gen. Bus. Posting Group';
                }
                field(balGenPostingType; Rec."Bal. Gen. Posting Type")
                {
                    Caption = 'Bal. Gen. Posting Type';
                }
                field(balGenProdPostingGroup; Rec."Bal. Gen. Prod. Posting Group")
                {
                    Caption = 'Bal. Gen. Prod. Posting Group';
                }
                field(balVATBusPostingGroup; Rec."Bal. VAT Bus. Posting Group")
                {
                    Caption = 'Bal. VAT Bus. Posting Group';
                }
                field(balVATProdPostingGroup; Rec."Bal. VAT Prod. Posting Group")
                {
                    Caption = 'Bal. VAT Prod. Posting Group';
                }
                field(balanceAccountId; Rec."Balance Account Id")
                {
                    Caption = 'Balance Account Id';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(currencyFactor; Rec."Currency Factor")
                {
                    Caption = 'Currency Factor';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }

                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(genPostingType; Rec."Gen. Posting Type")
                {
                    Caption = 'Gen. Posting Type';
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }

            }
        }
    }
    // Add this after the layout section and before the closing brace


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
}
