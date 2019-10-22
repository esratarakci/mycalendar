<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMeeting.aspx.cs" Inherits="MyCalendar.Meetings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <title></title>
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
                <label for="formGroupExampleInput">Meeting Via</label><br />
                <asp:DropDownList ID="dplMeetingVia" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <br />
            <div class="form-group">
                <label for="formGroupExampleInput2">Meeting Done</label><br />
                <asp:DropDownList ID="dplMeetingDone" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">Customer</label><br />
                <asp:DropDownList ID="dplCustomer" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <br />
            <div class="form-group">
                <label for="formGroupExampleInput2">Date Start</label><br />
                <asp:TextBox ID="txtDateStart" autocomplete="off" CssClass="form-control datetime" TextMode="DateTime" runat="server"></asp:TextBox>

            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2">Duration(In Minutes)</label><br />
                <asp:TextBox ID="txtduration" autocomplete="off" CssClass="form-control"  runat="server"></asp:TextBox>


            </div>
            <br />
            <div class="form-group">
                <label for="formGroupExampleInput2">With whom</label><br />
                <asp:TextBox ID="txtWhom" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">Description</label><br />
                <asp:TextBox ID="txtDesc" autocomplete="off" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>

            <div style="text-align: center;">
                <asp:Button ID="AddMeet" CssClass="btn btn-primary" runat="server" Text="Add Meeting" OnClick="AddMeeting_Click" />
                <br />
                <br />
            </div>

        </div>
        <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
    </form>

    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>

    <script src="/Scripts/moment.min.js"></script>
    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
    <script>
        $(function () {

            $(".datetime").datetimepicker({
                locale: 'tr',
                sideBySide: true
            });
        });

    </script>

</body>

</html>



