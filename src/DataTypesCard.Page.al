page 50900 DataTypesCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Data Types Card';
    SourceTable = "Reward Level";
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Level; rec.Level)
                {
                    Editable = true;
                }

                field(RewardLevel; rec."Minimum Reward Points")
                {
                    Editable = true;
                }

                field("Date"; TableActivationCodeInformation."Date Activated")
                {
                    Editable = true;
                }

                field("Expiration Date"; TableActivationCodeInformation."Expiration Date")
                {

                    Editable = false;
                }

            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Image = NewSum;
                Caption = 'ActionName2';
                ToolTip = 'Click to run MyCodeunit';
                RunObject = codeunit MyCodeunit;
            }

        }

    }
    trigger OnOpenPage()
    begin
        Message('The value of %1 is %2', 'YesOrNo', YesOrNo);
        Message('The value of %1 is %2', 'Amount', Amount);
        Message('The value of %1 is %2', 'When Was It', "When Was It");
        Message('The value of %1 is %2', 'What Time', "What Time");
        Message('The value of %1 is %2', 'Description', Description);
        Message('The value of %1 is %2', 'Code Number', "Code Number");
        Message('The value of %1 is %2', 'Ch', Ch);
        Message('The value of %1 is %2', 'Color', Color);

    end;

    var
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red,Orange,Yellow,Green,Blue,Violet;

        TableActivationCodeInformation: Record "Activation Code Information";

}