table 50100 "Customer Tmp - Sales force"
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
        field(50000; Select; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckData();
                if Rec.Select then
                    Rec."Select by" := UserId
                else
                    Rec."Select by" := '';
            end;
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

    procedure CheckData()
    var
        CustomerTB: Record Customer;
        ErrorTxt: Text[1024];
    begin
        Clear(ErrorTxt);
        Rec."Error" := false;
        Rec."Error Remark" := '';

        if Rec."Customer No." = '' then
            if ErrorTxt <> '' then
                ErrorTxt += ', Customer No. must have a value.'
            else
                ErrorTxt := 'Customer No. must have a value.';

        Clear(CustomerTB);
        if Rec."Customer No." <> '' then
            if CustomerTB.Get(Rec."Customer No.") then
                if ErrorTxt <> '' then
                    ErrorTxt += ', Customer already exists in the system.'
                else
                    ErrorTxt := 'Customer already exists in the system.';

        Rec."Error Remark" := ErrorTxt;

        if "Error Remark" <> '' then
            Rec."Error" := true
        else
            Rec."Error" := false;
    end;
}
