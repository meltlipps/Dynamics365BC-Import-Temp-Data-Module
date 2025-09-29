table 50103 "HSales H.Invtmp SalesForce"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(10; "Document Status"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(30; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(40; "VAT Type"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50; "Salesperson Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70; "Salesperson Post Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(80; "Payment Term"; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(90; "Due Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(100; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(110; "Line Discount %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(120; "Invoice Discount Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(130; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(140; "Cash Discount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(150; "VAT Product Posting Group"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(160; "VAT Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(170; "Amount Including VAT"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50000; Select; Boolean)
        {
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin

            //     if Rec.Select then
            //         Rec."Select by" := UserId
            //     else
            //         Rec."Select by" := '';
            // end;
        }
        field(50001; "Select by"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
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
