xmlport 50947 "CustomerXML"
{
    Caption = 'Export Customers(s) to XML';
    Format = Xml;
    Direction = Export;

    schema
    {
        textelement(Customers)
        {
            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.") { }
                fieldattribute(Language; Customer."Language Code") { }
                fieldelement(Name; Customer."Phone No.") { }
                textelement(Address)
                {
                    XmlName = 'Address';
                    fieldelement(StreetAndNr; Customer.Address) { }
                    fieldelement(Zipcode; Customer."Post Code") { }
                    fieldelement(City; Customer.City) { }
                }

            }
        }
    }
}

