namespace GTK.GTK;

using System.Reflection;

page 50102 "ALL Page Controls"

{
    ApplicationArea = All;
    Caption = 'ZY All Control Fields';
    PageType = List;
    SourceTable = "All Control Fields";
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Object Type"; Rec."Object Type")
                {
                    ToolTip = 'Specifies the value of the Object Type field.';
                }
                field("Object ID"; Rec."Object ID")
                {
                    ToolTip = 'Specifies the value of the Object ID field.';
                }
                field("Control ID"; Rec."Control ID")
                {
                    ToolTip = 'Specifies the value of the Control ID field.';
                }
                field("Control Name"; Rec."Control Name")
                {
                    ToolTip = 'Specifies the value of the Control Name field.';
                }
                field(Caption; Rec.Caption)
                {
                    Caption = 'Page Field Caption';
                    ToolTip = 'Specifies the value of the Caption field.';
                }
                field(FieldCaption; FieldCaption)
                {
                    Caption = 'Table Field Caption';
                }
                field("Data Type"; Rec."Data Type")
                {
                    ToolTip = 'Specifies the value of the Data Type field.';
                }
                field("Data Type Length"; Rec."Data Type Length")
                {
                    ToolTip = 'Specifies the value of the Data Type Length field.';
                }
                field("Option String"; Rec."Option String")
                {
                    ToolTip = 'Specifies the value of the Option String field.';
                }
                field("Option Caption"; Rec."Option Caption")
                {
                    ToolTip = 'Specifies the value of the Option Caption field.';
                }
                field("Related Table ID"; Rec."Related Table ID")
                {
                    ToolTip = 'Specifies the value of the Related Table ID field.';
                }
                field("Related Field ID"; Rec."Related Field ID")
                {
                    ToolTip = 'Specifies the value of the Related Field ID field.';
                }
                field("Source Expression"; Rec."Source Expression")
                {
                    ToolTip = 'Specifies the value of the Source Expression field.';
                }
            }
        }
    }
    var
        FieldCaption: Text[80];

    trigger OnAfterGetRecord()
    var
        FieldRec: Record Field;
    begin
        FieldCaption := '';
        if FieldRec.Get(Rec."Related Table ID", Rec."Related Field ID") then
            FieldCaption := FieldRec."Field Caption";
    end;
}