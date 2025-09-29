xmlport 50101 "XmlInsertSalesH.TmpSalesForce"
{
    Caption = 'Import Sales Invoice H. Temp - Sales force';
    Direction = Import;
    Format = VariableText;
    FieldSeparator = '|';
    UseRequestPage = false;
    TextEncoding = UTF8;
    RecordSeparator = '<LF>';

    schema
    {
        textelement(Root)
        {
            tableelement("SalesH.InvtmpSalesForce"; "Sales H.Invtmp SalesForce")
            {
                fieldattribute("Document_Status"; "SalesH.InvtmpSalesForce"."Document Status")
                {
                }
                fieldattribute("Document_No."; "SalesH.InvtmpSalesForce"."Document No.")
                {
                }
                fieldattribute("Posting_Date"; "SalesH.InvtmpSalesForce"."Posting Date")
                {
                }
                fieldattribute("VAT_Type"; "SalesH.InvtmpSalesForce"."VAT Type")
                {
                }
                fieldattribute("Salesperson_Code"; "SalesH.InvtmpSalesForce"."Salesperson Code")
                {
                }
                fieldattribute("Customer_No."; "SalesH.InvtmpSalesForce"."Customer No.")
                {
                }
                fieldattribute("Salesperson_Post_Code"; "SalesH.InvtmpSalesForce"."Salesperson Post Code")
                {
                }
                fieldattribute("Payment_Term"; "SalesH.InvtmpSalesForce"."Payment Term")
                {
                    trigger OnAfterAssignField()
                    begin
                        if "SalesH.InvtmpSalesForce"."Payment Term" <> '' then
                            "SalesH.InvtmpSalesForce"."Payment Term" := Format("SalesH.InvtmpSalesForce"."Payment Term") + 'D';
                    end;
                }
                fieldattribute("Due_Date"; "SalesH.InvtmpSalesForce"."Due Date")
                {
                }
                fieldattribute("Quantity"; "SalesH.InvtmpSalesForce".Quantity)
                {
                }
                fieldattribute("Line_Discount_Percent"; "SalesH.InvtmpSalesForce"."Line Discount %")
                {
                }
                fieldattribute("Invoice_Discount_Amount"; "SalesH.InvtmpSalesForce"."Invoice Discount Amount")
                {
                }
                fieldattribute("Amount"; "SalesH.InvtmpSalesForce"."Amount")
                {
                }
                fieldattribute("Cash_Discount"; "SalesH.InvtmpSalesForce"."Cash Discount")
                {
                }
                fieldattribute("VAT_Product_Posting_Group"; "SalesH.InvtmpSalesForce"."VAT Product Posting Group")
                {
                }
                fieldattribute("VAT_Amount"; "SalesH.InvtmpSalesForce"."VAT Amount")
                {
                }
                fieldattribute("Amount_including_VAT"; "SalesH.InvtmpSalesForce"."Amount Including VAT")
                {
                }
            }
        }
    }
}
