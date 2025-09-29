page 50103 "HSales H.Invtmp SalesForce"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "HSales H.Invtmp SalesForce";
    Caption = 'History Sales H.Inv tmp - Sales Force';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
            action("Open Sales Invoice Line")
            {
                ApplicationArea = all;
                Image = Line;
                RunObject = page "HSales L.Invtmp SalesForce";
                RunPageLink = "Document No." = field("Document No.");
            }
        }
        area(Promoted)
        {
            actionref("Open Sales Line_Home"; "Open Sales Invoice Line")
            {
            }
        }
    }
}
