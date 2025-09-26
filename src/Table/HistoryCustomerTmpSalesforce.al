table 50101 "HCustomerTmp-Salesforce"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(10; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Customer Category"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(30; "blank1"; Text[300])
        {
            DataClassification = CustomerContent;
        }
        field(40; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50; "Address"; Text[150])
        {
            DataClassification = CustomerContent;
        }
        field(60; "City"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70; "County"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(80; "Post Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90; "Phone No."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(100; "blank2"; Text[300])
        {
            DataClassification = CustomerContent;
        }
        field(110; "Salesperson Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(120; "blank3"; Text[300])
        {
            DataClassification = CustomerContent;
        }
        field(130; "Payment Terms Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(140; "blank4"; Text[300])
        {
            DataClassification = CustomerContent;
        }
        field(150; "blank5"; Text[300])
        {
            DataClassification = CustomerContent;
        }
        field(160; "blank6"; Text[300])
        {
            DataClassification = CustomerContent;
        }
        field(170; "Vat Registration No."; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(180; "Customer Branch"; Text[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK1; "Entry No.")
        {
            Clustered = true;
        }
    }
}
