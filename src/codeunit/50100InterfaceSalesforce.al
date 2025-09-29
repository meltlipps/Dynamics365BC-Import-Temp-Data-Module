codeunit 50100 "Interface Sales Force"
{
    procedure CreateCustomerMasterData()
    var
        HistoryCustomerTempSalesForceTB: Record "HCustomerTmp-Salesforce";
        CustomerTempSalesForceTB: Record "Customer Tmp - Sales force";
        CustomerTB: Record Customer;
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        SaleType: Text;
    begin
        Clear(CustomerTempSalesForceTB);
        CustomerTempSalesForceTB.SetCurrentKey("Entry No.");
        CustomerTempSalesForceTB.SetRange(Select, true);
        CustomerTempSalesForceTB.SetRange("Select by", UserId);
        if CustomerTempSalesForceTB.FindSet() then
            repeat
                CustomerTempSalesForceTB.CheckData();
                if not CustomerTempSalesForceTB.Error then begin
                    Clear(CustomerTB);
                    CustomerTB.Init();
                    CustomerTB."No." := CustomerTempSalesForceTB."Customer No.";
                    CustomerTB.Insert(true);
                    CustomerTB.Name := CustomerTempSalesForceTB.Name;
                    CustomerTB."Address" := CustomerTempSalesForceTB.Address;
                    CustomerTB.City := CustomerTempSalesForceTB.City;
                    CustomerTB."Post Code" := CustomerTempSalesForceTB."Post Code";
                    CustomerTB.County := CustomerTempSalesForceTB.County;
                    CustomerTB.Validate("Phone No.", CustomerTempSalesForceTB."Phone No.");

                    Clear(SaleType);
                    if SalespersonPurchaser.Get(CustomerTempSalesForceTB."Salesperson Code") then begin
                        if SalespersonPurchaser."Sale Type" = SalespersonPurchaser."Sale Type"::" " then begin
                            SaleType := ' ';
                            CustomerTB.Validate("Gen. Bus. Posting Group", SaleType);
                            CustomerTB.Validate("Customer Posting Group", SaleType);
                        end;
                        if SalespersonPurchaser."Sale Type" = SalespersonPurchaser."Sale Type"::"Pre-Order" then begin
                            SaleType := 'PREORDER';
                            CustomerTB.Validate("Gen. Bus. Posting Group", SaleType);
                            CustomerTB.Validate("Customer Posting Group", SaleType);
                        end;
                        if SalespersonPurchaser."Sale Type" = SalespersonPurchaser."Sale Type"::"Sales" then begin
                            SaleType := 'SALES';
                            CustomerTB.Validate("Gen. Bus. Posting Group", SaleType);
                            CustomerTB.Validate("Customer Posting Group", SaleType);
                        end;
                    end;
                    CustomerTB.Validate("Customer Category", CustomerTempSalesForceTB."Customer Category");
                    CustomerTB.Validate("Salesperson Code", CustomerTempSalesForceTB."Salesperson Code");
                    CustomerTB.Validate("Payment Terms Code", CustomerTempSalesForceTB."Payment Terms Code");
                    if CustomerTempSalesForceTB."Vat Registration No." = '' then
                        CustomerTB."VAT Registration No." := '.'
                    else
                        CustomerTB."VAT Registration No." := CustomerTempSalesForceTB."Vat Registration No.";
                    CustomerTB.Validate("Customer Branch No.", CustomerTempSalesForceTB."Customer Branch");
                    CustomerTB.Validate("WHT Business Posting Group", 'CORPORATE');
                    CustomerTB.Validate("VAT Bus. Posting Group", 'HO');

                    CustomerTB.Modify(true);

                    Clear(HistoryCustomerTempSalesForceTB);
                    HistoryCustomerTempSalesForceTB.Init();
                    HistoryCustomerTempSalesForceTB.TransferFields(CustomerTempSalesForceTB);
                    HistoryCustomerTempSalesForceTB.Insert(true);

                    CustomerTempSalesForceTB.Delete(true);
                end else
                    CustomerTempSalesForceTB.Modify();
            until CustomerTempSalesForceTB.Next() = 0;
    end;

    procedure GetPaymentTermCode(P_PaymentTermCode: Text[10]): Code[10]
    var
        PaymentTermCode: Code[10];
    begin
        case P_PaymentTermCode of
            '', '00', '0':
                PaymentTermCode := '0D';
            else
                PaymentTermCode := Format(P_PaymentTermCode) + 'D';
        end;
        exit(PaymentTermCode);
    end;
}
