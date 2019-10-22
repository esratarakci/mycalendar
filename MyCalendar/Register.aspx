<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" UnobtrusiveValidationMode="None" Inherits="MyCalendar.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Login</title>

    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/font-awesome/4.5.0/css/font-awesome.min.css" />


    <!-- ace styles -->
    <link rel="stylesheet" href="/assets/css/ace.min.css" />

    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/assets/css/ace-part2.min.css" />
		<![endif]-->
    <link rel="stylesheet" href="/assets/css/ace-rtl.min.css" />

    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="/assets/css/ace-ie.min.css" />
		<![endif]-->

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
		<script src="/assets/js/html5shiv.min.js"></script>
		<script src="/assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div class="main-content">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="login-container">
                        <div class="center">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <div id="signup-box" class="signup-box widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header green lighter bigger">
                                                    <i class="ace-icon fa fa-users blue"></i>
                                                    New User Registration
                                                </h4>

                                                <div class="space-6"></div>
                                                <p>Enter your details to begin: </p>

                                                <div>
                                                    <fieldset>
                                                        <label class="block clearfix">
                                                            <span class="block input-icon input-icon-right">
                                                                <asp:TextBox ID="Email" CssClass="form-control" autocomplete="off" runat="server" placeholder="Email"></asp:TextBox>
                                                                <i class="ace-icon fa fa-envelope"></i>
                                                            </span>
                                                        </label>

                                                        <label class="block clearfix">
                                                            <span class="block input-icon input-icon-right">
                                                                <asp:TextBox ID="Username" CssClass="form-control" autocomplete="off" placeholder="Username" runat="server"></asp:TextBox>
                                                                <i class="ace-icon fa fa-user"></i>
                                                            </span>
                                                        </label>

                                                        <label class="block clearfix">
                                                            <span class="block input-icon input-icon-right">
                                                                <asp:TextBox ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
                                                                <asp:RegularExpressionValidator Display = "Dynamic" autocomplete="off" ControlToValidate = "Password" ID="RegularExpressionValidator2" ValidationExpression = "^[a-zA-Z]\w{4,7}$" runat="server" ErrorMessage="first character must be a letter, it must contain at least 4 characters and no more than 8 characters."></asp:RegularExpressionValidator>
                                                                <i class="ace-icon fa fa-lock"></i>
                                                            </span>
                                                        </label>

                                                        <label class="block clearfix">
                                                            <span class="block input-icon input-icon-right">
                                                                <asp:TextBox ID="Password2" TextMode="Password" autocomplete="off" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
                                                                <i class="ace-icon fa fa-retweet"></i>
                                                            </span>

                                                        </label>
                                                        <div class="space-24"></div>
                                                        
                                                        <div class="clearfix">
                                                            <asp:LinkButton ID="LinkButton1" CssClass="width-30 pull-left btn btn-sm" runat="server">
                                                                     <i class="ace-icon fa fa-refresh"></i>
                                                                    <span class="bigger-110">Reset</span>
                                                            </asp:LinkButton>

                                                            <asp:LinkButton ID="RegisterBt" OnClick="RegisterBt_Click" CssClass="width-65 pull-right btn btn-sm btn-success" runat="server">
                                                                    <span class="bigger-110">Register</span>
                                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                            </asp:LinkButton>
                                                            <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
                                                            <asp:Literal ID="lblMessagePass" runat="server"></asp:Literal>
                                                            <asp:Literal ID="lblMessageSuccess" runat="server"></asp:Literal>

                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </div>

                                            <div class="toolbar center">
                                                <a href="/Login.aspx" data-target="#login-box" class="back-to-login-link">
                                                    <i class="ace-icon fa fa-arrow-left"></i>

                                                    Back to login
                                                </a>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
