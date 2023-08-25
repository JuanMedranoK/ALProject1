pageextension 50931 "Item Card Picture Extension" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("Functions")
        {
            action(ImportItemPicture)
            {
                Caption = 'Import Item Picture';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    ImageManagement: Codeunit "Image Management";
                begin
                    ImageManagement.ImportItemPicture(Rec);
                end;
            }
        }
    }
}
