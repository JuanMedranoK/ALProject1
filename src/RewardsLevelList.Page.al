page 50923 "Rewards Level List"
{
    PageType = List;
    ContextSensitiveHelpPage = 'https://dextra.com.do';
    SourceTable = "Reward Level";
    SourceTableView = sorting("Minimum Reward Points") order(ascending);
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Rewards Level List';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Level; 'Level')
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the level of reward that the customer has at this point.';
                }

                field("Minimum Reward Points"; 'Minimum Reward Points')
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the number of points that customers must have to reach this level.';
                }
            }
        }
    }

    trigger OnOpenPage();
    begin

        if not CustomerRewardsExtMgt.IsCustomerRewardsActivated then
            Error(NotActivatedTxt);
    end;

    var
        NotActivatedTxt: Label 'Customer Rewards is not activated';

        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext Mgt";

}