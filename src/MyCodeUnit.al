codeunit 50905 MyCodeunit
{
    Access = Public;
    Subtype = Normal;

    trigger OnRun()
    var
        myInteger: Integer;
        myResult: Integer;
    begin
        myInteger := 23;
        myResult := MyFunction(myInteger);

        Message('myInteger: %1', myInteger);  // Displays 23
        Message('myResult: %1', myResult);    // Displays 17
    end;

    procedure MyFunction(var ParamA: Integer): Integer
    begin
        paramA := 17;
        Exit(paramA);
    end;

    procedure Post(DocumentNo: Code[20]; LineNo: Integer)
    var
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
    begin
        if (SalesLine.Get(SalesLine."Document Type"::Order, DocumentNo, LineNo)) then begin
            SalesHeader.Get(SalesHeader."Document Type"::Order, DocumentNo);

            OnBeforePostSalesLine(SalesLine, SalesHeader);
            DoPost(SalesLine);
            OnAfterPostSalesLine(SalesLine);
        end;
    end;

    local procedure DoPost(var SalesLine: Record "Sales Line")
    begin
        // The posting code happens here.
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforePostSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterPostSalesLine(var SalesLine: Record "Sales Line")
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'OnBeforePostSalesLine', '', true, true)]
    local procedure BeforePostSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostCustomerEntry', '', false, false)]
    local procedure OnAfterPostCustomerEntry(var GenJnlLine: Record "Gen. Journal Line"; var SalesHeader: Record "Sales Header"; var TotalSalesLine: Record "Sales Line"; var TotalSalesLineLCY: Record "Sales Line"; CommitIsSuppressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line");
    begin
    end;

}
