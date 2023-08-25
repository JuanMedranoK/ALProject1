page 50924 ArmstrongCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Armstrong Card';
    Editable = true;

    layout
    {
        area(Content)
        {

        }
    }

    trigger OnOpenPage()
    var
        Counter1, Counter2, PowerNumber, Number, Result : Integer;
        CounterText: Text[5];
        ArmstrongNumbers, Newline : Text;
        Ch10, Ch13 : Char;
        ResultList: List of [Integer];
    begin
        Ch10 := 10;
        Ch13 := 13;
        Newline := Format(Ch10) + Format(Ch13);
        for Counter1 := 0 to 10000 do begin
            CounterText := Format(Counter1);
            Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));
            for Counter2 := 1 to StrLen(CounterText) do begin
                Evaluate(Number, CopyStr(CounterText, Counter2, 1));
                Result += Power(Number, PowerNumber);
            end;

            if Result = Counter1 then
                ResultList.Add(Result);
            Clear(Result);
        end;

        foreach Counter1 in ResultList do
            ArmstrongNumbers += Newline + Format(Counter1);

        Message(ArmstrongNumbers);
    end;
}

