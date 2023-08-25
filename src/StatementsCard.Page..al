page 50950 StatementsCard
{
    UsageCategory = Documents;
    ApplicationArea = All;
    Caption = 'Statements Card';
    PageType = Card;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;
                    Caption = 'Difficulty';
                    ToolTip = 'Select The Difficulty';
                    trigger OnValidate()
                    begin
                        GetSuggestion();
                    end;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Caption = 'Suggestion';
                    ToolTip = 'a suggestion';
                    Editable = false;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Caption = 'Level';
                    ToolTip = 'This is your Level';
                    Editable = false;

                }
            }
        }
    }

    var

        Level: Text[30];
        Suggestion: Text[80];
        Difficulty: Integer;

    local procedure GetSuggestion()
    begin
        Level := '';
        Suggestion := '';

        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-learning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend Instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study';
                end;

        end;
    end;
}




