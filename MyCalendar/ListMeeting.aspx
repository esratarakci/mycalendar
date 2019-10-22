<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListMeeting.aspx.cs" Inherits="MyCalendar.ListMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrapcss">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="/assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
  
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
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search customer names..." TextMode="Search"></asp:TextBox>
        <asp:Button ID="Search" runat="server" Text="Search" OnClick="Search_Click" />
        <asp:Repeater OnItemCommand="Repeater_ItemCommand" runat="server" ID="rpt_demo">
            <HeaderTemplate>
                <table class="table table-hover table-dark" style="border: medium; table-layout: fixed">
                    <tr>
                        <th>Status</th>
                        <th>Tool </th>
                        <th>Customer</th>
                        <th>Customer Phone</th>
                        <th>Date Start</th>
                        <th>Date End</th>
                        <th>Whom</th>
                        <th>Description</th>
                        <th>Delete</th>

                    </tr>
            </HeaderTemplate>
            <ItemTemplate>

                <tbody>
                    <tr>
                        <td>
                            <%# Eval ("MeetingDoneName") %>
                        </td>
                        <td>
                            <%# Eval ("MeetingViaName") %>
                        </td>
                        <td>
                            <%# Eval ("CustomerName") %>
                        </td>
                         <td>
                            <%# Eval ("CustomerPhone") %>
                        </td>
                        <td>
                            <%# Eval ("DateStart") %>
                        </td>
                        <td>
                            <%# Eval ("DateEnd") %>
                        </td>
                        <td>
                            <%# Eval ("Whom") %>
                        </td>
                        <td>
                            <%# Eval ("Description") %>
                        </td>

                        <td>
                            <asp:Button ID="lblDeleteMeeting" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("Id") %>' />
                        </td>

                    </tr>
                </tbody>

            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <br />
        <div style="text-align: center;">
            <asp:Button ID="AddNewMeet" class="btn btn-primary" runat="server" Text="Add New Meeting" OnClick="AddNewMeet_Click" />
            <br />
            <br />

        </div>
    </form>

    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    
</body>
</html>
