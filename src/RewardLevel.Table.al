table 50901 "Reward Level"
{
    Caption = 'Reward Level';
    TableType = Normal;
    DataClassification = CustomerContent;
    Extensible = true;

    fields
    {
        field(1; Level; Text[20])
        {
            Caption = 'Level';
            DataClassification = CustomerContent;
        }

        field(2; "Minimum Reward Points"; Integer)
        {
            Caption = 'Minimum Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
            NotBlank = true;

            trigger OnValidate();
            var
                RewardLevel: Record "Reward Level";
                tempPoints: Integer;
            begin
                tempPoints := "Minimum Reward Points";
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
        key("Minimum Reward Points"; "Minimum Reward Points") { }
    }

    trigger OnInsert();
    begin
        Validate("Minimum Reward Points");
    end;

    trigger OnModify();
    begin
        Validate("Minimum Reward Points");
    end;

    procedure SelectColor()
    var
        Color: Option Green,Red,Yellow,Blue,White;
    begin
        Color := Color::Red;
        Message('The select color is: %1', Color);
    end;

    procedure OnSelect();
    begin
        Message('Congratulations');
    end;

}
codeunit 50900 ExplicitWith
{
    procedure ProcessCustomer(Name: Text)
    var
        Customer: Record Customer;
    begin
        with Customer do begin
            Name := UpperCase(Name);

            if IsDirty() then Insert();
        end;
    end;

    local procedure IsDirty(): Boolean;
    begin
        exit(true);
    end;

}

















