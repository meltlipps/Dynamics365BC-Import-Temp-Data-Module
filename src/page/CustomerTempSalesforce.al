page 50100 "Customer Temp - Sales force"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Tmp - Sales force";
    Caption = 'Customer Temp - Sales force';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = All;
                }
                field("Select by"; Rec."Select by")
                {
                    ApplicationArea = All;
                }
                field("Error"; Rec.Error)
                {
                    ApplicationArea = All;
                }
                field("Error Remark"; Rec."Error Remark")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Customer Category"; Rec."Customer Category")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Category';
                }
                field("blank1"; Rec.blank1)
                {
                    ApplicationArea = All;
                    Caption = 'blank1';
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    Caption = 'Address';
                }
                field("City"; Rec."City")
                {
                    ApplicationArea = All;
                    Caption = 'City';
                }
                field("County"; Rec."County")
                {
                    ApplicationArea = All;
                    Caption = 'County';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Post Code';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No.';
                }
                field("blank2"; Rec."blank2")
                {
                    ApplicationArea = All;
                    Caption = 'blank2';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Salesperson Code';
                }
                field("blank3"; Rec."blank3")
                {
                    ApplicationArea = All;
                    Caption = 'blank3';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Terms Code';
                }
                field("blank4"; Rec."blank4")
                {
                    ApplicationArea = All;
                    Caption = 'blank4';
                }
                field("blank5"; Rec."blank5")
                {
                    ApplicationArea = All;
                    Caption = 'blank5';
                }
                field("blank6"; Rec."blank6")
                {
                    ApplicationArea = All;
                    Caption = 'blank6';
                }
                field("Vat Registration No."; Rec."Vat Registration No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vat Registration No.';
                }
                field("Customer Branch"; Rec."Customer Branch")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Branch';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Select All")
            {
                ApplicationArea = all;
                Image = Line;
                trigger OnAction()
                var
                    CustomerTempSalesForceTB: Record "Customer Tmp - Sales force";
                begin
                    Clear(CustomerTempSalesForceTB);
                    CustomerTempSalesForceTB.CopyFilters(Rec);
                    CustomerTempSalesForceTB.SetRange("Select by", '');
                    if CustomerTempSalesForceTB.FindSet() then
                        repeat
                            CustomerTempSalesForceTB.Validate(Select, true);
                            CustomerTempSalesForceTB.Modify();
                        until CustomerTempSalesForceTB.Next() = 0;
                end;
            }
            action("Un-Select All")
            {
                ApplicationArea = all;
                Image = Restore;
                trigger OnAction()
                var
                    CustomerTempSalesForceTB: Record "Customer Tmp - Sales force";
                begin
                    Clear(CustomerTempSalesForceTB);
                    CustomerTempSalesForceTB.CopyFilters(Rec);
                    CustomerTempSalesForceTB.SetRange("Select by", UserId);
                    if CustomerTempSalesForceTB.FindSet() then
                        repeat
                            CustomerTempSalesForceTB.Validate(Select, false);
                            CustomerTempSalesForceTB.Modify();
                        until CustomerTempSalesForceTB.Next() = 0;
                end;
            }
            action("Import Customer")
            {
                ApplicationArea = all;
                Image = CreateDocuments;
                RunObject = xmlport "XmlInsertCust.TmpSalesforce";
                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
            action("Create Customer")
            {
                ApplicationArea = all;
                Image = CreateDocuments;
                trigger OnAction()
                var
                    InterfaceSalesforceMgt: Codeunit "Interface Sales Force";
                begin
                    Clear(InterfaceSalesforceMgt);
                    InterfaceSalesforceMgt.CreateCustomerMasterData();
                end;
            }
        }
        area(Promoted)
        {
            actionref("Select All_Home"; "Select All")
            {
            }
            actionref("Un-Select All_Home"; "Un-Select All")
            {
            }
            actionref("Create Customer_Home"; "Create Customer")
            {
            }
        }
    }
}
