// page 50106 "ItemAPIGTK"
// {
//     PageType = API;
//     Caption = 'Item API GTK';
//     APIPublisher = 'GTKIPL';
//     APIGroup = 'GTKAPI';
//     APIVersion = 'v2.0';
//     EntityName = 'gtkitem';
//     EntitySetName = 'gtkitems';
//     SourceTable = "Item";
//     DelayedInsert = true;
//     ODataKeyFields = SystemId;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field(systemId; Rec.SystemId)
//                 {
//                     Caption = 'SystemId';
//                     Editable = false;
//                 }
//                 field(No; Rec."No.")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("No."));
//                     end;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo(Description));
//                     end;
//                 }
//                 field(BaseUnitOfMeasure; Rec."Base Unit of Measure")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Base Unit of Measure"));

//                         if not UnitOfMeasure.Get(BaseUnitOfMeasure) then begin
//                             UnitOfMeasure.Init();
//                             UnitOfMeasure.Code := "Base Unit of Measure";
//                             UnitOfMeasure.Description := "Base Unit of Measure";
//                             UnitOfMeasure.Insert();
//                         end;

//                         if not ItemUnitOfMeasure.Get("No.", "Base Unit of Measure") then begin
//                             ItemUnitOfMeasure.Init();
//                             ItemUnitOfMeasure."Item No." := "No.";
//                             ItemUnitOfMeasure."Unit of Measure Code" := "Base Unit of Measure";
//                             ItemUnitOfMeasure.Insert();
//                         end;
//                     end;
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo(Type));
//                     end;
//                 }
//                 field(InventoryPostingGroup; Rec."Inventory Posting Group")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Inventory Posting Group"));
//                     end;
//                 }
//                 field(CostingMethod; Rec."Costing Method")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Costing Method"));
//                     end;
//                 }
//                 field(Blocked; Rec.Blocked)
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo(Blocked));
//                     end;
//                 }
//                 field(GenProdPostingGroup; Rec."Gen. Prod. Posting Group")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Gen. Prod. Posting Group"));
//                     end;
//                 }
//                 field(VATProdPostingGroup; Rec."VAT Prod. Posting Group")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("VAT Prod. Posting Group"));
//                     end;
//                 }
//                 field(SalesUnitOfMeasure; Rec."Sales Unit of Measure")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Sales Unit of Measure"));
//                     end;
//                 }
//                 field(PurchUnitOfMeasure; Rec."Purch. Unit of Measure")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Purch. Unit of Measure"));
//                     end;
//                 }
//                 field(ItemTrackingCode; Rec."Item Tracking Code")
//                 {
//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Item Tracking Code"));
//                     end;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     var
//         TempFieldSet: Record "Field" temporary;
//         FirstEntryNo: Integer;
//         UnitOfMeasure: Record "Unit of Measure";
//         ItemUnitOfMeasure: Record "Item Unit of Measure";

//     local procedure RegisterFieldSet(FieldNo: Integer)
//     begin
//         if TempFieldSet.Get(Database::Item, FieldNo) then
//             exit;

//         TempFieldSet.Init();
//         TempFieldSet.TableNo := Database::Item;
//         TempFieldSet.Validate("No.", FieldNo);
//         TempFieldSet.Insert(true);

//         if FirstEntryNo = 0 then
//             FirstEntryNo := TempFieldSet."No.";
//     end;
// }