codeunit 50011 "InterfaceSalesInvTmpSalesForce"
{
    procedure CreateSalesInvoiceData()
    var
        SalesInvoiceHeaderTmpTB: Record "Sales H.Invtmp SalesForce";
        HistorySalesInvoiceHeaderTmpTB: Record "HSales H.Invtmp SalesForce";
        SalesInvoiceLineTmpTB: Record "Sales L.Invtmp SalesForce";
        HistorySalesInvoiceLineTmpTB: Record "HSales L.Invtmp SalesForce";
        SalesHeaderTB: Record "Sales Header";
        SalesLineTB: Record "Sales Line";
        CustomerTB: Record Customer;
        LineNo: Integer;
        OldDoc: Code[20];
        LineError: Boolean;
        CheckSalesInvoiceHeaderTmpTB: Record "Sales H.Invtmp SalesForce";
    begin

        Clear(SalesInvoiceHeaderTmpTB);
        SalesInvoiceHeaderTmpTB.SetCurrentKey("Document No.");
        SalesInvoiceHeaderTmpTB.SetRange(Select, true);
        SalesInvoiceHeaderTmpTB.SetRange("Select by", UserId);
        SalesInvoiceHeaderTmpTB.SetRange(Error, false);

        if SalesInvoiceHeaderTmpTB.FindSet() then
            repeat
                SalesInvoiceHeaderTmpTB.CheckData();

                Clear(SalesHeaderTB);
                SalesHeaderTB.Init();

                SalesHeaderTB."Document Type" := SalesHeaderTB."Document Type"::Invoice;
                SalesHeaderTB."No." := SalesInvoiceHeaderTmpTB."Document No.";
                SalesHeaderTB."Posting No." := SalesInvoiceHeaderTmpTB."Document No.";
                SalesHeaderTB.Insert(true);

                SalesHeaderTB.Validate("Posting Date", SalesInvoiceHeaderTmpTB."Posting Date");
                SalesHeaderTB.Validate("Document Date", SalesInvoiceHeaderTmpTB."Posting Date");
                SalesHeaderTB.Validate("Salesperson Code", SalesInvoiceHeaderTmpTB."Salesperson Code");
                SalesHeaderTB.Validate("Sell-to Customer No.", SalesInvoiceHeaderTmpTB."Customer No.");
                SalesHeaderTB.Validate("Payment Terms Code", SalesInvoiceHeaderTmpTB."Payment Term");
                SalesHeaderTB.Validate("Due Date", SalesInvoiceHeaderTmpTB."Due Date");

                if SalesInvoiceHeaderTmpTB."VAT Type" <> '2' then
                    SalesHeaderTB.Validate("Prices Including VAT", true)
                else
                    SalesHeaderTB.Validate("Prices Including VAT", false);

                SalesHeaderTB.Modify(true);

                Clear(LineNo);
                Clear(SalesInvoiceLineTmpTB);
                SalesInvoiceLineTmpTB.SetRange("Document No.", SalesInvoiceHeaderTmpTB."Document No.");
                if SalesInvoiceLineTmpTB.FindSet() then
                    repeat
                        LineNo += 10000;
                        CheckAndCreateUOM(SalesInvoiceLineTmpTB."Unit of Measure");
                        CheckAndCreateItemUOM(SalesInvoiceLineTmpTB."Item No.", SalesInvoiceLineTmpTB."Unit of Measure", SalesInvoiceLineTmpTB."Quantity (Base)");
                        Clear(SalesLineTB);
                        SalesLineTB.Init();
                        SalesLineTB."Document Type" := SalesHeaderTB."Document Type";
                        SalesLineTB."Document No." := SalesHeaderTB."No.";
                        SalesLineTB."Line No." := LineNo;
                        SalesLineTB.Insert(true);

                        SalesLineTB.Validate(Type, SalesLineTB.Type::Item);
                        SalesLineTB.Validate("No.", SalesInvoiceLineTmpTB."Item No.");
                        SalesLineTB.Validate("Location Code", SalesInvoiceLineTmpTB."Location Code");
                        SalesLineTB.Validate(Quantity, SalesInvoiceLineTmpTB.Quantity);
                        SalesLineTB.Validate("Unit of Measure Code", SalesInvoiceLineTmpTB."Unit of Measure");
                        SalesLineTB.Validate("Unit Price", SalesInvoiceLineTmpTB."Unit Price");
                        SalesLineTB.Validate("Line Discount Amount", SalesInvoiceLineTmpTB."Line Discount Amount");
                        SalesLineTB.Validate("Line Amount", SalesInvoiceLineTmpTB."Line Amount");
                        SalesLineTB.Modify(true);

                        Clear(HistorySalesInvoiceLineTmpTB);
                        HistorySalesInvoiceLineTmpTB.Init();
                        HistorySalesInvoiceLineTmpTB.TransferFields(SalesInvoiceLineTmpTB);
                        HistorySalesInvoiceLineTmpTB.Insert(true);
                        SalesInvoiceLineTmpTB.Delete();
                    until SalesInvoiceLineTmpTB.Next() = 0;

                Clear(HistorySalesInvoiceHeaderTmpTB);
                HistorySalesInvoiceHeaderTmpTB.Init();
                HistorySalesInvoiceHeaderTmpTB.TransferFields(SalesInvoiceHeaderTmpTB);
                HistorySalesInvoiceHeaderTmpTB.Insert(true);
                SalesInvoiceHeaderTmpTB.Delete();
            until SalesInvoiceHeaderTmpTB.Next() = 0;
    end;

    procedure GetPaymentTermCode(P_PaymentTermCode: Text[10]): Code[10]
    var
        PaymentTermCode: Code[10];
    begin
        case P_PaymentTermCode of
            '0':
                PaymentTermCode := '';
            '', '00':
                PaymentTermCode := '0D';
            else
                PaymentTermCode := Format(P_PaymentTermCode) + 'D';
        end;
        exit(PaymentTermCode);
    end;

    procedure CheckAndCreateUOM(P_UOMCode: Code[10])
    var
        UnitofMeasureTB: Record "Unit of Measure";
    begin
        if P_UOMCode = '' then
            exit;

        Clear(UnitofMeasureTB);
        if not UnitofMeasureTB.Get(P_UOMCode) then begin
            Clear(UnitofMeasureTB);
            UnitofMeasureTB.Init();
            UnitofMeasureTB.Validate(Code, P_UOMCode);
            UnitofMeasureTB.Insert(true);
        end;
    end;

    procedure CheckAndCreateItemUOM(P_ItemNo: Code[20]; P_UOMCode: Code[10]; P_QtyBase: Decimal)
    var
        ItemUnitofMeasureTB: Record "Item Unit of Measure";
    begin
        if (P_ItemNo = '') OR (P_UOMCode = '') OR (P_QtyBase = 0) then
            exit;

        Clear(ItemUnitofMeasureTB);
        if not ItemUnitofMeasureTB.Get(P_ItemNo, P_UOMCode) then begin
            Clear(ItemUnitofMeasureTB);
            ItemUnitofMeasureTB.Init();
            ItemUnitofMeasureTB.Validate("Item No.", P_ItemNo);
            ItemUnitofMeasureTB.Validate(Code, P_UOMCode);
            ItemUnitofMeasureTB.Validate("Qty. per Unit of Measure", P_QtyBase);
            ItemUnitofMeasureTB.Insert(true);
        end;
    end;
}
