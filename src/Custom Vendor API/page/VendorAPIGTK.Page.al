page 50105 "Vendor  API GTK"
{
    PageType = API;
    Caption = 'Vendor API GTK';
    APIPublisher = 'GTKIPL';
    APIGroup = 'GTKAPI';
    APIVersion = 'v2.0';
    EntityName = 'gtkvendor';
    EntitySetName = 'gtkvendors';
    SourceTable = Vendor;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    Editable = false;

                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("No."));
                    end;
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Name));
                    end;
                }
                field(addressLine1; Rec.Address)
                {
                    Caption = 'Address Line 1';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Address));
                    end;
                }
                field(addressLine2; Rec."Address 2")
                {
                    Caption = 'Address Line 2';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Address 2"));
                    end;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(City));
                    end;
                }
                field(state; Rec.County)
                {
                    Caption = 'State';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(County));
                    end;
                }
                field(country; Rec."Country/Region Code")
                {
                    Caption = 'Country';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Country/Region Code"));
                    end;
                }
                field(postalCode; Rec."Post Code")
                {
                    Caption = 'Postal Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Post Code"));
                    end;
                }
                field(phoneNumber; Rec."Phone No.")
                {
                    Caption = 'Phone Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Phone No."));
                    end;
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'Email';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("E-Mail"));
                    end;
                }
                field(taxRegistrationNumber; Rec."VAT Registration No.")
                {
                    Caption = 'Tax Registration Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("VAT Registration No."));
                    end;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Currency Code"));
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
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Payment Method Code"));
                    end;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Blocked));
                    end;
                }
                field(vendorPostingGroup; Rec."Vendor Posting Group")
                {
                    Caption = 'Vendor Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Vendor Posting Group"));
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
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("VAT Bus. Posting Group"));
                    end;
                }
            }
        }
    }

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::Vendor, FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::Vendor;
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);

        if FirstEntryNo = 0 then
            FirstEntryNo := TempFieldSet."No.";
    end;

    var
        TempFieldSet: Record "Field" temporary;
        FirstEntryNo: Integer;
}