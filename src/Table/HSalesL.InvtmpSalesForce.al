table 50109 "HSales L.Invtmp SalesForce"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(10; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(30; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(40; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(60; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70; "Blank1"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(80; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(90; "Unit of Measure"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(100; "Quantity (Base)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(110; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(120; "Line Discount %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(130; "Line Discount Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(140; "Line Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(150; "Blank2"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Error"; Boolean)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50020; "Error Remark"; Text[1024])
        {
            DataClassification = CustomerContent;
            Editable = false;
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
