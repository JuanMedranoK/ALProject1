pageextension 50923 "Azure Customer Card" extends "Customer Card"
{
    trigger OnOpenPage()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        Object: JsonObject;
        JsonText: Text;
        Url: Text;
    begin
        Url := '<your function app url>';
        Object.Add('name', Rec.Name);
        Object.WriteTo(JsonText);
        Content.WriteFrom(JsonText);
        if not Client.Post(Url, Content, ResponseMessage) then
            Error('The call to the web service failed.');
        if not ResponseMessage.IsSuccessStatusCode() then
            Error('The web service returned an error message:\\' +
                'Status code: %1\' +
                'Description: %2',
                ResponseMessage.HttpStatusCode(),
                ResponseMessage.ReasonPhrase());
        ResponseMessage.Content().ReadAs(JsonText);

        Message(JsonText);
    end;


}