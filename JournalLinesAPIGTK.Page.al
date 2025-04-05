// namespace GTK.GTK;

// using Microsoft.Finance.GeneralLedger.Journal;
// using Microsoft.Finance.GeneralLedger.Setup;
// using Microsoft.Finance.GeneralLedger.Account;
// using Microsoft.Bank.BankAccount;
// using Microsoft.Integration.Graph;

// page 50102 "Journal Lines API GTK"
// {
//     APIGroup = 'GTKAPI';
//     APIPublisher = 'GTKIPL';
//     APIVersion = 'v2.0';
//     ApplicationArea = All;
//     Caption = 'journalLinesAPIGTK';
//     EntityCaption = 'Journal Line';
//     EntitySetCaption = 'Journal Lines';
//     DelayedInsert = true;
//     EntityName = 'journalLine';
//     EntitySetName = 'journalLines';
//     PageType = API;
//     SourceTable = "Gen. Journal Line";
//     ODataKeyFields = SystemId;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field(systemId; Rec.SystemId)
//                 {
//                     Caption = 'Id';
//                     Editable = false;
//                 }
//                 field(journalId; Rec."Journal Batch Id")
//                 {
//                     Caption = 'Journal Id';
//                 }
//                 field(journalDisplayName; GlobalJournalDisplayNameTxt)
//                 {
//                     Caption = 'Journal Display Name';

//                     trigger OnValidate()
//                     begin
//                         Error(CannotEditBatchNameErr);
//                     end;
//                 }
//                 field(accountNo; Rec."Account No.")
//                 {
//                     Caption = 'Account No.';
//                     trigger OnValidate()
//                     begin
//                         case Rec."Account Type" of
//                             Rec."Account Type"::"G/L Account":
//                                 UpdateAccountIdForGLAccount();
//                             Rec."Account Type"::"Bank Account":
//                                 UpdateAccountIdForBankAccount();
//                         end;
//                     end;
//                 }
//                 field(accountType; Rec."Account Type")
//                 {
//                     Caption = 'Account Type';
//                 }
//                 field(accountId; Rec."Account Id")
//                 {
//                     Caption = 'Account Id';

//                     trigger OnValidate()
//                     begin
//                         if Rec."Account Id" = BlankGUID then begin
//                             Rec."Account No." := '';
//                             exit;
//                         end;
//                         if Rec."Account Type" = Rec."Account Type"::"G/L Account" then begin
//                             if not GLAccount.GetBySystemId(Rec."Account Id") then
//                                 Error(AccountIdDoesNotMatchAnAccountErr);
//                             Rec."Account No." := GLAccount."No.";
//                         end;
//                         if Rec."Account Type" = Rec."Account Type"::"Bank Account" then
//                             if BankAccount.GetBySystemId(Rec."Account Id") then
//                                 Rec."Account No." := BankAccount."No."
//                             else
//                                 Error(AccountIdDoesNotMatchAnAccountErr);
//                     end;
//                 }
//                 field(amount; Rec.Amount)
//                 {
//                     Caption = 'Amount';
//                 }
//                 field(amountLCY; Rec."Amount (LCY)")
//                 {
//                     Caption = 'Amount (LCY)';
//                 }
//                 field(appliesToDocNo; Rec."Applies-to Doc. No.")
//                 {
//                     Caption = 'Applies-to Doc. No.';
//                 }
//                 field(appliesToDocType; Rec."Applies-to Doc. Type")
//                 {
//                     Caption = 'Applies-to Doc. Type';
//                 }
//                 field(appliesToExtDocNo; Rec."Applies-to Ext. Doc. No.")
//                 {
//                     Caption = 'Applies-to Ext. Doc. No.';
//                 }
//                 field(appliesToID; Rec."Applies-to ID")
//                 {
//                     Caption = 'Applies-to ID';
//                 }
//                 field(balAccountNo; Rec."Bal. Account No.")
//                 {
//                     Caption = 'Bal. Account No.';
//                 }
//                 field(balAccountType; Rec."Bal. Account Type")
//                 {
//                     Caption = 'Bal. Account Type';
//                 }
//                 field(balancingAccountId; Rec."Balance Account Id")
//                 {
//                     Caption = 'Balancing Account Id';

//                     trigger OnValidate()
//                     begin
//                         if Rec."Balance Account Id" = BlankGUID then begin
//                             Rec."Bal. Account No." := '';
//                             exit;
//                         end;
//                         case Rec."Bal. Account Type" of
//                             Rec."Bal. Account Type"::"G/L Account":
//                                 begin
//                                     if not GLAccount.GetBySystemId(Rec."Balance Account Id") then
//                                         Error(BalAccountIdDoesNotMatchAnAccountErr);
//                                     Rec."Bal. Account No." := GLAccount."No.";
//                                 end;
//                             Rec."Bal. Account Type"::"Bank Account":
//                                 begin
//                                     if not BankAccount.GetBySystemId(Rec."Balance Account Id") then
//                                         Error(BalAccountIdDoesNotMatchAnAccountErr);
//                                     Rec."Bal. Account No." := BankAccount."No.";
//                                 end;
//                         end;
//                     end;
//                 }
//                 field(comment; Rec.Comment)
//                 {
//                     Caption = 'Comment';
//                 }
//                 field(currencyCode; Rec."Currency Code")
//                 {
//                     Caption = 'Currency Code';
//                 }
//                 field(documentType; Rec."Document Type")
//                 {
//                     Caption = 'Document Type';
//                 }
//                 field(description; Rec.Description)
//                 {
//                     Caption = 'Description';
//                 }
//                 field(currencyFactor; Rec."Currency Factor")
//                 {
//                     Caption = 'Currency Factor';
//                 }
//                 field(externalDocumentNo; Rec."External Document No.")
//                 {
//                     Caption = 'External Document No.';
//                 }
//                 field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
//                 {
//                     Caption = 'Gen. Bus. Posting Group';
//                 }
//                 field(genPostingType; Rec."Gen. Posting Type")
//                 {
//                     Caption = 'Gen. Posting Type';
//                 }
//                 field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
//                 {
//                     Caption = 'Gen. Prod. Posting Group';
//                 }
//                 field(lineNo; Rec."Line No.")
//                 {
//                     Caption = 'Line No.';
//                 }
//                 field(postingDate; Rec."Posting Date")
//                 {
//                     Caption = 'Posting Date';
//                 }
//                 field(documentDate; Rec."Document Date")
//                 {
//                     Caption = 'Document Date';
//                 }
//                 field(documentNo; Rec."Document No.")
//                 {
//                     Caption = 'Document No.';
//                 }
//                 field(sourceCode; Rec."Source Code")
//                 {
//                     Caption = 'Source Code';
//                 }
//                 field(yourReference; Rec."Your Reference")
//                 {
//                     Caption = 'Your Reference';
//                 }
//                 field(lastModifiedDateTime; Rec.SystemModifiedAt)
//                 {
//                     Caption = 'Last Modified Date';
//                     Editable = false;
//                 }
//                 part(attachments; Microsoft.API.V2."APIV2 - Attachments")
//                 {
//                     Caption = 'Attachments';
//                     EntityName = 'attachment';
//                     EntitySetName = 'attachments';
//                     SubPageLink = "Document Id" = field(SystemId), "Document Type" = const(Journal);
//                 }
//                 part(dimensionSetLines; Microsoft.API.V2."APIV2 - Dimension Set Lines")
//                 {
//                     Caption = 'Dimension Set Lines';
//                     EntityName = 'dimensionSetLine';
//                     EntitySetName = 'dimensionSetLines';
//                     SubPageLink = "Parent Id" = field(SystemId), "Parent Type" = const("Journal Line");
//                 }
//             }
//         }
//     }
//     trigger OnAfterGetCurrRecord()
//     begin
//         if not FiltersChecked then begin
//             CheckFilters();
//             FiltersChecked := true;
//         end;
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         SetCalculatedFields();
//     end;

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     var
//         GenJournalBatch: Record "Gen. Journal Batch";
//         TempGenJournalLine: Record "Gen. Journal Line" temporary;
//     begin
//         if IsNullGuid(Rec."Journal Batch Id") then
//             CheckFilters();

//         TempGenJournalLine.Reset();
//         TempGenJournalLine.Copy(Rec);

//         Clear(Rec);
//         if IsNullGuid(TempGenJournalLine."Journal Batch Id") then
//             GenJournalBatch.GetBySystemId(TempGenJournalLine.GetFilter("Journal Batch Id"))
//         else
//             GenJournalBatch.GetBySystemId(TempGenJournalLine."Journal Batch Id");

//         GraphMgtJournalLines.SetJournalLineTemplateAndBatchV2(Rec, GenJournalBatch);
//         LibraryAPIGeneralJournal.InitializeLine(
//           Rec, TempGenJournalLine."Line No.", TempGenJournalLine."Document No.", TempGenJournalLine."External Document No.");

//         GraphMgtJournalLines.SetJournalLineValues(Rec, TempGenJournalLine);

//         SetCalculatedFields();
//     end;

//     trigger OnModifyRecord(): Boolean
//     var
//         GenJournalLine: Record "Gen. Journal Line";
//     begin
//         GenJournalLine.GetBySystemId(Rec.SystemId);

//         if Rec."Journal Batch Id" <> GenJournalLine."Journal Batch Id" then
//             Error(CannotEditBatchIdErr);

//         if Rec."Line No." = GenJournalLine."Line No." then
//             Rec.Modify(true)
//         else begin
//             GenJournalLine.TransferFields(Rec, false);
//             GenJournalLine.Rename(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Line No.");
//             Rec.TransferFields(GenJournalLine, true);
//         end;

//         SetCalculatedFields();

//         exit(false);
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         ClearCalculatedFields();

//         Rec."Document Type" := Rec."Document Type"::" ";
//         Rec."Account Type" := Rec."Account Type"::"G/L Account";
//     end;

//     trigger OnOpenPage()
//     begin
//         // Rec.SetRange("Document Type", Rec."Document Type"::" ");
//         // Rec.SetRange("Account Type", Rec."Account Type"::"G/L Account", Rec."Account Type"::"Bank Account");
//     end;

//     var
//         GLAccount: Record "G/L Account";
//         BankAccount: Record "Bank Account";
//         GraphMgtJournalLines: Codeunit "Graph Mgt - Journal Lines";
//         LibraryAPIGeneralJournal: Codeunit "Library API - General Journal";
//         FiltersNotSpecifiedErr: Label 'You must specify a journal batch ID or a journal ID to get a journal line.';
//         CannotEditBatchNameErr: Label 'The Journal Batch Display Name isn''t editable.';
//         CannotEditBatchIdErr: Label 'The Journal Batch Id isn''t editable.';
//         AccountValuesDontMatchErr: Label 'The account values do not match to a specific Account.';
//         AccountIdDoesNotMatchAnAccountErr: Label 'The "accountId" does not match to an Account.', Comment = 'accountId is a field name and should not be translated.';
//         BalAccountIdDoesNotMatchAnAccountErr: Label 'The "balancingAccountId" does not match to an Account.', Comment = 'balancingAccountId is a field name and should not be translated.';
//         AccountNumberDoesNotMatchAnAccountErr: Label 'The "accountNumber" does not match to an Account.', Comment = 'accountNumber is a field name and should not be translated.';
//         GlobalJournalDisplayNameTxt: Code[10];
//         TaxCode: Code[20];
//         FiltersChecked: Boolean;
//         BlankGUID: Guid;

//     local procedure SetCalculatedFields()
//     var
//         GeneralLedgerSetup: Record "General Ledger Setup";
//     begin
//         GlobalJournalDisplayNameTxt := Rec."Journal Batch Name";
//         if GeneralLedgerSetup.UseVat() then
//             TaxCode := Rec."VAT Prod. Posting Group"
//         else
//             TaxCode := Rec."Tax Group Code";
//     end;

//     local procedure ClearCalculatedFields()
//     begin
//         Clear(GlobalJournalDisplayNameTxt);
//         Clear(TaxCode);
//     end;

//     local procedure CheckFilters()
//     begin
//         if (Rec.GetFilter("Journal Batch Id") = '') and
//            (Rec.GetFilter(SystemId) = '')
//         then
//             Error(FiltersNotSpecifiedErr);
//     end;

//     local procedure UpdateAccountIdForGLAccount();
//     begin
//         if GLAccount."No." <> '' then begin
//             if GLAccount."No." <> Rec."Account No." then
//                 Error(AccountValuesDontMatchErr);
//             exit;
//         end;

//         if Rec."Account No." = '' then begin
//             Rec."Account Id" := BlankGUID;
//             exit;
//         end;

//         if not GLAccount.Get(Rec."Account No.") then
//             Error(AccountNumberDoesNotMatchAnAccountErr);

//         Rec."Account Id" := GLAccount.SystemId;
//     end;

//     local procedure UpdateAccountIdForBankAccount();
//     begin
//         if BankAccount."No." <> '' then begin
//             if BankAccount."No." <> Rec."Account No." then
//                 Error(AccountValuesDontMatchErr);
//             exit;
//         end;

//         if Rec."Account No." = '' then begin
//             Rec."Account Id" := BlankGUID;
//             exit;
//         end;

//         if not BankAccount.Get(Rec."Account No.") then
//             Error(AccountNumberDoesNotMatchAnAccountErr);

//         Rec."Account Id" := BankAccount.SystemId;
//     end;
// }
