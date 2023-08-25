codeunit 50930 "Image Management"
{
    procedure ImportItemPicture(Item: Record Item)
    begin
        with Item do begin
            if Picture.Count() > 0 then
                if not Confirm(OverrideImageQst) then
                    exit;

            if File.UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, PicInStream) then begin
                Clear(Picture);
                Picture.ImportStream(PicInStream, FromFileName);
                Modify(true);
            end;
        end;
    end;

    var
        PicInStream: Instream;
        FromFileName: Text;
        OverrideImageQst: Label 'The existing picture will be replaced. Continue?';
}

