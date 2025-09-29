table 50102 "Sales H.Invtmp SalesForce"
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
        ErrorTxt: Text[1024];
        SalesHeaderTB: Record "Sales Header";
        CustomerTB: Record Customer;
        PaymentTermTB: Record "Payment Terms";
        SalesLineTempSalesForceTB: Record "Sales L.Invtmp SalesForce";
        SalespersonTB: Record "Salesperson/Purchaser";
    begin
        Clear(ErrorTxt);
        Rec."Error" := false;
        Rec."Error Remark" := '';

        Clear(SalesHeaderTB);
        if Rec."Document No." <> '' then
            if SalesHeaderTB.Get(Rec."Document No.") then
                if ErrorTxt <> '' then
                    ErrorTxt += ', Invoice No. does exist.'
                else
                    ErrorTxt := ' Invoice No. does exist.';

        if Rec."Posting Date" = 0D then
            if ErrorTxt <> '' then
                ErrorTxt += ', Posting Date must have a value.'
            else
                ErrorTxt := 'Posting Date must have a value.';

        Clear(SalespersonTB);
        if Rec."Salesperson Code" <> '' then
            if not SalespersonTB.Get(Rec."Salesperson Code") then
                if ErrorTxt <> '' then
                    ErrorTxt += ', Salesperson Code must have a value.'
                else
                    ErrorTxt := 'Salesperson Code must have a value.';

        Clear(CustomerTB);
        if Rec."Customer No." <> '' then
            if not CustomerTB.Get(Rec."Customer No.") then
                if ErrorTxt <> '' then
                    ErrorTxt += ', Customer No. does exist.'
                else
                    ErrorTxt := 'Customer No. does exist.';

        Clear(PaymentTermTB);
        if Rec."Payment Term" <> '' then
            if not PaymentTermTB.Get(Rec."Payment Term") then
                if ErrorTxt <> '' then
                    ErrorTxt += ', Payment Term does not exist.'
                else
                    ErrorTxt := ' Payment Term  does not exist.';

        if Rec."Due Date" = 0D then
            if ErrorTxt <> '' then
                ErrorTxt += ', Due Date must have a value.'
            else
                ErrorTxt := 'Due Date must have a value.';

        Clear(SalesLineTempSalesForceTB);
        SalesLineTempSalesForceTB.SetCurrentKey("Document No.", "Line No.");
        SalesLineTempSalesForceTB.SetRange("Document No.", Rec."Document No.");
        if SalesLineTempSalesForceTB.IsEmpty then
            if ErrorTxt <> '' then
                ErrorTxt += ', Sales Line Temp - Sales Force does not exist.'
            else
                ErrorTxt := 'Sales Line Temp - Sales Force does not exist.';

        Rec."Error Remark" := ErrorTxt;

        if "Error Remark" <> '' then
            Rec."Error" := true
        else
            Rec."Error" := false;

        CheckDataLine(Rec);
    end;

    procedure CheckDataLine(P_SalesHeaderTmpSalesTool: Record "Sales H.Invtmp SalesForce")
    var
        SalesLineTempSalesForceTB: Record "Sales L.Invtmp SalesForce";
        ItemTB: Record Item;
        UnitofMeasureTB: Record "Unit of Measure";
        LocationTB: Record Location;
        ErrorTxt: Text[1024];
        SaleHeaderTB: Record "Sales Header";
        CustomerTB: Record Customer;
    begin
        Clear(SalesLineTempSalesForceTB);
        SalesLineTempSalesForceTB.SetCurrentKey("Customer No.", "Line No.");
        SalesLineTempSalesForceTB.SetRange("Customer No.", P_SalesHeaderTmpSalesTool."Customer No.");
        if SalesLineTempSalesForceTB.FindSet(true) then
            repeat
                Clear(ErrorTxt);
                SalesLineTempSalesForceTB.Error := false;
                SalesLineTempSalesForceTB."Error Remark" := '';

                Clear(LocationTB);
                if SalesLineTempSalesForceTB."Location Code" <> '' then
                    if not LocationTB.Get(SalesLineTempSalesForceTB."Location Code") then
                        if ErrorTxt <> '' then
                            ErrorTxt += ', Location Code must have a value.'
                        else
                            ErrorTxt := 'Location Code must have a value.';

                Clear(ItemTB);
                if SalesLineTempSalesForceTB."Item No." <> '' then
                    if not ItemTB.Get(SalesLineTempSalesForceTB."Item No.") then
                        if ErrorTxt <> '' then
                            ErrorTxt += ', Item No. does exist.'
                        else
                            ErrorTxt := 'Item No. does exist.';

                if SalesLineTempSalesForceTB."Quantity" = 0 then
                    if ErrorTxt <> '' then
                        ErrorTxt += 'Location Code must have a value.'
                    else
                        ErrorTxt := 'Location Code must have a value.';

                Clear(UnitofMeasureTB);
                if SalesLineTempSalesForceTB."Unit of Measure" <> '' then
                    if not UnitofMeasureTB.Get(SalesLineTempSalesForceTB."Unit of Measure") then
                        if ErrorTxt <> '' then
                            ErrorTxt += ', Document No. does exist.'
                        else
                            ErrorTxt := 'Document No. does exist.';

                if SalesLineTempSalesForceTB."Unit Price" = 0 then
                    if ErrorTxt <> '' then
                        ErrorTxt += ', Unit Price must have a value.'
                    else
                        ErrorTxt := 'Unit Price must have a value.';

                SalesLineTempSalesForceTB."Error Remark" := ErrorTxt;

                if SalesLineTempSalesForceTB."Error Remark" <> '' then
                    SalesLineTempSalesForceTB."Error" := true
                else
                    SalesLineTempSalesForceTB."Error" := false;
                SalesLineTempSalesForceTB.Modify();

            until SalesLineTempSalesForceTB.Next() = 0;
    end;

}
