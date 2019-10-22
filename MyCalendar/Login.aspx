<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyCalendar.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
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
<body class="login-layout" style="background-color:lightpink">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="main-container">
                    <div class="main-content">
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="login-container">
                                    <div class="center">
                                    </div>

                                    <div class="space-6"></div>

                                    <div class="position-relative">
                                        <div id="login-box" class="login-box visible widget-box no-border">
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                    <h4 class="header blue lighter bigger">
                                                        <i class="ace-icon fa fa-coffee green"></i>
                                                        Please Enter Your Information
                                                    </h4>

                                                    <div class="space-6"></div>

                                                    <div>
                                                        <fieldset>
                                                            <asp:Label ID="Label1" runat="server" Text="Label">E-Mail</asp:Label>
                                                            <label class="block clearfix">
                                                                 
                                                                <span class="block input-icon input-icon-right">
                                                                   
                                                                    <asp:TextBox ID="txtLoginName" CssClass="form-control" runat="server" placeholder="E-Mail"></asp:TextBox>
                                                                    <i class="ace-icon fa fa-user"></i>
                                                                </span>
                                                            </label>

                                                            <asp:Label ID="Label2" runat="server" Text="Label">Password</asp:Label>
                                                            <label class="block clearfix">
                                                                <span class="block input-icon input-icon-right">
                                                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                                                                    <i class="ace-icon fa fa-lock"></i>
                                                                </span>
                                                            </label>

                                                            <div class="space"></div>

                                                            <div class="clearfix">
                                                                <label class="inline">
                                                                    <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="ace" />
                                                                    <span class="lbl">Remember Me</span>
                                                                </label>
                                                                <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="width-35 pull-right btn btn-sm btn-primary">
                                                            <i class="ace-icon fa fa-key"></i>
                                                            <span class="bigger-110">Login</span>
                                                                </asp:LinkButton>
                                                            </div>

                                                            <div class="space-4"></div>
                                                            <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                                <!-- /.widget-main -->

                                                <div class="toolbar clearfix">
                                                    <div>

                                                        <a href="/ForgotPass.aspx" class="forgot-password-link">
                                                            <i class="ace-icon fa fa-arrow-left"></i>
                                                            I forgot my password
                                                        </a>
                                                    </div>

                                                    <div>
                                                        <a href="/Register.aspx" class="user-signup-link">I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.widget-body -->
                                        </div>
                                        <!-- /.login-box -->

                                        

                                        
                                    </div>
                                    <!-- /.position-relative -->

                                    
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.main-content -->
                </div>
                <!-- /.main-container -->


            </ContentTemplate>
        </asp:UpdatePanel>

    </form>

    <!--[if !IE]> -->
    <script src="/assets/js/jquery-2.1.4.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
<script src="/assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script type="text/javascript">
        jQuery(function ($) {
            $(document).on('click', '.toolbar a[data-target]', function (e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible');//hide others
                $(target).addClass('visible');//show target
            });
        });
    </script>
</body>
</html>
