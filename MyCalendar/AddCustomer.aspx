<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" UnobtrusiveValidationMode="None" Inherits="MyCalendar.AddCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


    <style>
        .label {
            color: steelblue;
            font-size: medium;
        }
    </style>
</head>
<body style="background-color: lightpink">

    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li class="active"><a href="/MainPage.aspx">My Calendar</a></li>
                        <li><a href="/Calendar.aspx">Calendar</a></li>
                        <li><a href="/ListMeeting.aspx">List Meetings</a></li>
                        <li><a href="/AddMeeting.aspx">Add Meetings</a></li>
                        <li><a href="/ListCustomer.aspx">List Customer</a></li>
                        <li><a href="/AddCustomer.aspx">Add Customer</a></li>


                    </ul>


                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome,<asp:Literal ID="lblUsername" runat="server"></asp:Literal><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/MyInfo.aspx"><i class="icon-envelope"></i>Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="/Logout.aspx"><i class="icon-off"></i>Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

         <div class="col-lg-4">
        <div class="form-group">
            <label for="formGroupExampleInput" class="label">Name*</label><br />
            <asp:TextBox CssClass="form-control" autocomplete="off" ID="NameTxt" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="form-group">
            <label for="formGroupExampleInput2">E-Mail</label><br />
            <asp:TextBox ID="MailTxt" CssClass="form-control" autocomplete="off" TextMode="Email" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="form-group">
            <label for="formGroupExampleInput2" class="label">Phone*</label><br />
            <asp:TextBox ID="PhoneTxt" CssClass="form-control" autocomplete="off" TextMode="Phone" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number" ControlToValidate="PhoneTxt" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ></asp:RegularExpressionValidator>
        </div>
        <br />
        <div class="form-group">
            <label for="formGroupExampleInput2">Address</label><br />
            <asp:TextBox ID="AddressTxt" CssClass="form-control" autocomplete="off" TextMode="MultiLine" runat="server"></asp:TextBox>
        </div>

        <div style="text-align: center;">
            <asp:Button ID="AddCust" CssClass="btn btn-primary" runat="server" Text="Add Customer" OnClick="AddCust_Click" />
            <br />
            <br />
        </div>
             </div>

    </form>

    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
</body>
</html>
