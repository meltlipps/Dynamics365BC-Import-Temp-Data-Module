xmlport 50102 "XmlInsertSalesL.TmpSalesForce"
{
    Caption = 'Import Sales Invoice L. Temp - Sales force';
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
            tableelement("SalesL.InvtmpSalesForce"; "Sales L.Invtmp SalesForce")
            {
                fieldattribute("Item_No."; "SalesL.InvtmpSalesForce"."Item No.")
                {
                }
                fieldattribute("Location_Code."; "SalesL.InvtmpSalesForce"."Location Code")
                {
                }
                fieldattribute("Document_No."; "SalesL.InvtmpSalesForce"."Document No.")
                {
                }
                fieldattribute("Line_No."; "SalesL.InvtmpSalesForce"."Line No.")
                {
                }
                fieldattribute("Posting_Date"; "SalesL.InvtmpSalesForce"."Posting Date")
                {
                }
                fieldattribute("Customer_No."; "SalesL.InvtmpSalesForce"."Customer No.")
                {
                }
                fieldattribute("Blank1"; "SalesL.InvtmpSalesForce"."Blank1")
                {
                }
                fieldattribute("Quantity"; "SalesL.InvtmpSalesForce"."Quantity")
                {
                }
                fieldattribute("Unit_of_Measure"; "SalesL.InvtmpSalesForce"."Unit of Measure")
                {
                }
                fieldattribute("Quantity_Base."; "SalesL.InvtmpSalesForce"."Quantity (Base)")
                {
                }
                fieldattribute("Unit_Price."; "SalesL.InvtmpSalesForce"."Unit Price")
                {
                }
                fieldattribute("Line_Discount_Percent"; "SalesL.InvtmpSalesForce"."Line Discount %")
                {
                }
                fieldattribute("Line_Discount_Amount"; "SalesL.InvtmpSalesForce"."Line Discount Amount")
                {
                }
                fieldattribute("Line_Amount"; "SalesL.InvtmpSalesForce"."Line Amount")
                {
                }
                fieldattribute("Blank2"; "SalesL.InvtmpSalesForce".Blank2)
                {
                }
            }
        }
    }
}
