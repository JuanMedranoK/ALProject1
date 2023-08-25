table 50902 RewardLevel
{
    TableType = Normal;
    Caption = 'Reward Level';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Level; Text[20])
        {
            Caption = 'Level';
            DataClassification = ToBeClassified;

        }

        field(2; "Minimun Reward Points"; Integer)
        {
            Caption = 'Minimun Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
            NotBlank = true;

            trigger OnValidate()
            var
                RewardLevel: Record "Reward Level";
                tempPoints: Integer;
            begin
                tempPoints := "Minimun Reward Points";
                RewardLevel.SetRange("Minimum Reward Points", tempPoints);
                if not RewardLevel.IsEmpty() then
                    Error('Minimum Reward Points must be unique');
            end;
        }
    }

    keys
    {
        key(PK; Level)
        {
            Clustered = true;
        }
        key("Minimun Reward Points"; "Minimun Reward Points") { }
    }

    trigger OnInsert()
    begin

        Validate("Minimun Reward Points");
    end;

    trigger OnModify()
    begin
        Validate("Minimun Reward Points");
    end;
}