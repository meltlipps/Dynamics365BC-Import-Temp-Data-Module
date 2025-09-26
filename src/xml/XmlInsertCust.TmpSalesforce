xmlport 50100 "XmlInsertCust.TmpSalesforce"
{
    Caption = 'Import Customer Temp - Sales force';
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
            tableelement("Customer Tmp - Sales force"; "Customer Tmp - Sales force")
            {
                SourceTableView = sorting("Entry No.");
                XmlName = 'CustTempSalesforce';
                fieldelement("Customer_No."; "Customer Tmp - Sales force"."Customer No.")
                {
                }
                fieldelement("Customer_Category"; "Customer Tmp - Sales force"."Customer Category")
                {
                }
                fieldelement("blank1"; "Customer Tmp - Sales force".blank1)
                {
                }
                fieldelement("Name"; "Customer Tmp - Sales force".Name)
                {
                }
                fieldelement("Address"; "Customer Tmp - Sales force".Address)
                {
                }
                fieldelement("City"; "Customer Tmp - Sales force".City)
                {
                }
                fieldelement("County"; "Customer Tmp - Sales force".County)
                {
                }
                fieldelement("Post_Code"; "Customer Tmp - Sales force"."Post Code")
                {
                }
                fieldelement("Phone_No."; "Customer Tmp - Sales force"."Phone No.")
                {
                }
                fieldelement("Blank2"; "Customer Tmp - Sales force".blank2)
                {
                }
                fieldelement("Salesperson_Code"; "Customer Tmp - Sales force"."Salesperson Code")
                {
                }
                fieldelement("blank3"; "Customer Tmp - Sales force".blank3)
                {
                }
                fieldelement("Payment_Terms_Code"; "Customer Tmp - Sales force"."Payment Terms Code")
                {
                    trigger OnAfterAssignField()
                    begin
                        if "Customer Tmp - Sales force"."Payment Terms Code" <> '' then
                            "Customer Tmp - Sales force"."Payment Terms Code" := Format("Customer Tmp - Sales force"."Payment Terms Code") + 'D';
                    end;
                }
                fieldelement("Blank4"; "Customer Tmp - Sales force".blank4)
                {
                }
                fieldelement("Blank5"; "Customer Tmp - Sales force".blank5)
                {
                }
                fieldelement("Blank6"; "Customer Tmp - Sales force".blank6)
                {
                }
                fieldelement("Vat_Registration_No."; "Customer Tmp - Sales force"."Vat Registration No.")
                {
                }
                fieldelement("Customer_Branch"; "Customer Tmp - Sales force"."Customer Branch")
                {
                }
            }
        }
    }
}
