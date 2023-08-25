tableextension 50910 Customer extends Customer
{
    fields
    {
        field(10001; RewardPoints; Integer)
        {
            Caption = 'Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;


        }
        field(10002; MinimunPoints; Decimal)
        {
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;


        }

    }
    var
        Array1: array[1000] of BigText;
        CustomerNames: List of [Text];
        CountriesDictionary: Dictionary of [Code[20], List of [Text]];
        errors: Record "Error Message" temporary;
        error: ErrorInfo;
        i: Record Integer;

}
table 50936 MyTable
{
    DataClassification = ToBeClassified;
    Caption = 'MyTable';
    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }


}

