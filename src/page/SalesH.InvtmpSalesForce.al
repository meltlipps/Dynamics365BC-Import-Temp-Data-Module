page 50106 "Sales H.Invtmp SalesForce"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales H.Invtmp SalesForce";
    Caption = 'Sales H.Inv tmp - Sales Force';

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
                field(Error; Rec.Error)
                {
                    ApplicationArea = All;
                }
                field("Error Remark"; Rec."Error Remark")
                {
                    ApplicationArea = All;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    Caption = 'Document Status';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date';
                }
                field("VAT Type"; Rec."VAT Type")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Type';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Salesperson Code';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Salesperson Post Code"; Rec."Salesperson Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Salesperson Post Code';
                }
                field("Payment Term"; Rec."Payment Term")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Term';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Caption = 'Due Date';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount %';
                }
                field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Invoice Discount Amount';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                }
                field("Cash Discount"; Rec."Cash Discount")
                {
                    ApplicationArea = All;
                    Caption = 'Cash Discount';
                }
                field("VAT Product Posting Group"; Rec."VAT Product Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Product Posting Group';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Amount';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    Caption = 'Amount Including VAT';
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
                    SalesHeaderInvTempSalesForceTB: Record "Sales H.Invtmp SalesForce";
                begin
                    Clear(SalesHeaderInvTempSalesForceTB);
                    SalesHeaderInvTempSalesForceTB.CopyFilters(Rec);
                    SalesHeaderInvTempSalesForceTB.SetRange("Select by", '');
                    if SalesHeaderInvTempSalesForceTB.FindSet() then
                        repeat
                            SalesHeaderInvTempSalesForceTB.Validate(Select, true);
                            SalesHeaderInvTempSalesForceTB.Modify();
                        until SalesHeaderInvTempSalesForceTB.Next() = 0;
                end;
            }
            action("Un-Select All")
            {
                ApplicationArea = all;
                Image = Restore;
                trigger OnAction()
                var
                    SalesHeaderInvTempSalesForceTB: Record "Sales H.Invtmp SalesForce";
                begin
                    Clear(SalesHeaderInvTempSalesForceTB);
                    SalesHeaderInvTempSalesForceTB.CopyFilters(Rec);
                    SalesHeaderInvTempSalesForceTB.SetRange("Select by", UserId);
                    if SalesHeaderInvTempSalesForceTB.FindSet() then
                        repeat
                            SalesHeaderInvTempSalesForceTB.Validate(Select, false);
                            SalesHeaderInvTempSalesForceTB.Modify();
                        until SalesHeaderInvTempSalesForceTB.Next() = 0;
                end;
            }
            action("Import Sales Invoice Header")
            {
                ApplicationArea = all;
                Image = CreateDocuments;
                RunObject = xmlport "XmlInsertSalesH.TmpSalesForce";

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
            action("Import Sales Invoice Line")
            {
                ApplicationArea = all;
                Image = CreateDocuments;
                RunObject = xmlport "XmlInsertSalesL.TmpSalesForce";

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
            action("Open Sales Invoice Line")
            {
                ApplicationArea = all;
                Image = Line;
                RunObject = page "Sales L.Invtmp SalesForce";
                RunPageLink = "Document No." = field("Document No.");
            }
            action("Create Sales Invoice")
            {
                ApplicationArea = all;
                Image = CreateDocuments;
                trigger OnAction()
                var
                    InterfaceSalesforceMgt: Codeunit "InterfaceSalesInvTmpSalesForce";
                begin
                    Clear(InterfaceSalesforceMgt);
                    InterfaceSalesforceMgt.CreateSalesInvoiceData();
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
            actionref("Create Sales_Invoice_Home"; "Create Sales Invoice")
            {
            }
            actionref("Import Sales Header_Home"; "Import Sales Invoice Header")
            {
            }
            actionref("Import Sales Line_Home"; "Import Sales Invoice Line")
            {
            }
            actionref("Open Sales Line_Home"; "Open Sales Invoice Line")
            {
            }
        }
    }
}
