<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyInfo.aspx.cs" Inherits="MyCalendar.MyInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <title></title>
</head>

<body style="background-color:lightpink">

    <div class="container">
        <div class="row">
            <div class="col-md-3 ">
                <div class="list-group" >
                    <a href="/MainPage.aspx" class="list-group-item list-group-item-action active">Dashboard</a>
                  
                </div>
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h4>Your Profile</h4>
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <form runat="server">
                                    <div class="form-group row">
                                        <label for="username" class="col-4 col-form-label"> Username</label>
                                        <div class="col-8">
                                            <asp:Literal ID="lblUsernameTxt" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="username" class="col-4 col-form-label"> New Username</label>
                                        <div class="col-8">
                                            <asp:TextBox ID="NewUsernameTxt" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="username" class="col-4 col-form-label"> E-Mail</label>
                                        <div class="col-8">
                                            <asp:Literal ID="lblEMailTxt" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="username" class="col-4 col-form-label">New E-mail</label>
                                        <div class="col-8">
                                            <asp:TextBox ID="NewEMailTxt" TextMode="Email" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="username" class="col-4 col-form-label">Password</label>
                                        <div class="col-8">
                                            <a href="PasswordChange.aspx">To change password</a>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="offset-4 col-8">
                                            <asp:Button CssClass="btn btn-outline-primary" ID="UpdateProfile" runat="server" Text="Update My Profile" OnClick="UpdateProfile_Click" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
