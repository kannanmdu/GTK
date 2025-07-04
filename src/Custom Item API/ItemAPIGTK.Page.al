page 50106 "ItemAPIGTK"
{
    PageType = API;
    Caption = 'Item API GTK';
    APIPublisher = 'GTKIPL';
    APIGroup = 'GTKAPI';
    APIVersion = 'v2.0';
    EntityName = 'gtkitem';
    EntitySetName = 'gtkitems';
    SourceTable = "Item";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    Editable = false;
                }
                field(No; Rec."No.")
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("No."));
                    end;
                }
                field(Description; Rec.Description)
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Description));
                    end;
                }
                field(BaseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    trigger OnValidate()
                    var
                        UnitOfMeasure: Record "Unit of Measure";
                        ItemUnitOfMeasure: Record "Item Unit of Measure";
                    begin
                        if Rec."Base Unit of Measure" <> '' then begin
                            // Ensure Unit of Measure exists
                            if not UnitOfMeasure.Get(Rec."Base Unit of Measure") then begin
                                UnitOfMeasure.Init();
                                UnitOfMeasure.Validate(Code, Rec."Base Unit of Measure");
                                UnitOfMeasure.Insert(true);
                            end;

                            // Ensure Item Unit of Measure exists
                            if Rec."No." <> '' then begin
                                ItemUnitOfMeasure.SetRange("Item No.", Rec."No.");
                                ItemUnitOfMeasure.SetRange(Code, Rec."Base Unit of Measure");
                                if not ItemUnitOfMeasure.FindFirst() then begin
                                    ItemUnitOfMeasure.Init();
                                    ItemUnitOfMeasure.Validate("Item No.", Rec."No.");
                                    ItemUnitOfMeasure.Validate(Code, Rec."Base Unit of Measure");
                                    ItemUnitOfMeasure.Validate("Qty. per Unit of Measure", 1);
                                    ItemUnitOfMeasure.Insert(true);
                                end;
                            end;
                        end;
                        RegisterFieldSet(Rec.FieldNo("Base Unit of Measure"));
                    end;
                }
                field(Type; Rec.Type)
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Type));
                    end;
                }
                field(CostingMethod; Rec."Costing Method")
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Costing Method"));
                    end;
                }
                field(ItemTrackingCode; Rec."Item Tracking Code")
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Item Tracking Code"));
                    end;
                }

                field(InventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Inventory Posting Group"));
                    end;
                }

                field(Blocked; Rec.Blocked)
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Blocked));
                    end;
                }
                field(GenProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Gen. Prod. Posting Group"));
                    end;
                }
                field(VATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("VAT Prod. Posting Group"));
                    end;
                }
                field(SalesUnitOfMeasure; Rec."Sales Unit of Measure")
                {
                    trigger OnValidate()
                    var
                        UnitOfMeasure: Record "Unit of Measure";
                        ItemUnitOfMeasure: Record "Item Unit of Measure";
                    begin
                        if Rec."Sales Unit of Measure" <> '' then begin
                            // Ensure Unit of Measure exists
                            if not UnitOfMeasure.Get(Rec."Sales Unit of Measure") then begin
                                UnitOfMeasure.Init();
                                UnitOfMeasure.Validate(Code, Rec."Sales Unit of Measure");
                                UnitOfMeasure.Insert(true);
                            end;

                            // Ensure Item Unit of Measure exists
                            if Rec."No." <> '' then begin
                                ItemUnitOfMeasure.SetRange("Item No.", Rec."No.");
                                ItemUnitOfMeasure.SetRange(Code, Rec."Sales Unit of Measure");
                                if not ItemUnitOfMeasure.FindFirst() then begin
                                    ItemUnitOfMeasure.Init();
                                    ItemUnitOfMeasure.Validate("Item No.", Rec."No.");
                                    ItemUnitOfMeasure.Validate(Code, Rec."Sales Unit of Measure");
                                    ItemUnitOfMeasure.Validate("Qty. per Unit of Measure", 1);
                                    ItemUnitOfMeasure.Insert(true);
                                end;
                            end;
                        end;
                        RegisterFieldSet(Rec.FieldNo("Sales Unit of Measure"));
                    end;
                }
                field(PurchUnitOfMeasure; Rec."Purch. Unit of Measure")
                {
                    trigger OnValidate()
                    var
                        UnitOfMeasure: Record "Unit of Measure";
                        ItemUnitOfMeasure: Record "Item Unit of Measure";
                    begin
                        if Rec."Purch. Unit of Measure" <> '' then begin
                            // Ensure Unit of Measure exists
                            if not UnitOfMeasure.Get(Rec."Purch. Unit of Measure") then begin
                                UnitOfMeasure.Init();
                                UnitOfMeasure.Validate(Code, Rec."Purch. Unit of Measure");
                                UnitOfMeasure.Insert(true);
                            end;

                            // Ensure Item Unit of Measure exists
                            if Rec."No." <> '' then begin
                                ItemUnitOfMeasure.SetRange("Item No.", Rec."No.");
                                ItemUnitOfMeasure.SetRange(Code, Rec."Purch. Unit of Measure");
                                if not ItemUnitOfMeasure.FindFirst() then begin
                                    ItemUnitOfMeasure.Init();
                                    ItemUnitOfMeasure.Validate("Item No.", Rec."No.");
                                    ItemUnitOfMeasure.Validate(Code, Rec."Purch. Unit of Measure");
                                    ItemUnitOfMeasure.Validate("Qty. per Unit of Measure", 1);
                                    ItemUnitOfMeasure.Insert(true);
                                end;
                            end;
                        end;
                        RegisterFieldSet(Rec.FieldNo("Purch. Unit of Measure"));
                    end;
                }

            }
        }
    }

    actions
    {
    }

    var
        TempFieldSet: Record "Field" temporary;
        FirstEntryNo: Integer;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::Item, FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::Item;
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);

        if FirstEntryNo = 0 then
            FirstEntryNo := TempFieldSet."No.";
    end;
}