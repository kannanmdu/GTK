namespace GTK.GTK;

using Microsoft.Sales.Document;

tableextension 50101 "Sales Line GTK" extends "Sales Line"
{
    fields
    {
        modify("Allow Invoice Disc.")
        {
            trigger OnAfterValidate()
            begin
                "Allow Invoice Discount GTK" := "Allow Invoice Disc.";
            end;
        }
        field(50100; "Allow Invoice Discount GTK"; Boolean)
        {
            Caption = 'Allow Invoice Discount GTK';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Allow Invoice Discount GTK", "Allow Invoice Disc.");
            end;
        }
    }
}
