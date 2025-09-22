pageextension 85000 MyCustomer extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(MyProgress; Rec.MyProgress)
            {
                ApplicationArea = All;
                Caption = 'My Progress';
                ToolTip = 'Shows the progress of the customer.';
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action(MyAction)
            {
                ApplicationArea = All;
                Caption = 'My Action';
                ToolTip = 'Performs my custom action.';
                Image = Info;
                trigger OnAction()
                begin
                    Message('My Action executed for %1', Rec.Name);
                end;
            }
        }
    }

}
