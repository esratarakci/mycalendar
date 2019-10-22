<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" UnobtrusiveValidationMode="None" Inherits="MyCalendar.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title></title>
</head>
<body style=" text-align:center; background-color:lightpink">
    <form id="form1" runat="server">
     <div class="col-lg-4">
           
            <div class="form-group">
                <label for="formGroupExampleInput2">New Password</label><br />
                <asp:TextBox ID="NewPassTxt" CssClass="form-control" autocomplete="off" TextMode="Password" runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator Display = "Dynamic" autocomplete="off" ControlToValidate = "NewPassTxt" ID="RegularExpressionValidator2" ValidationExpression = "^[a-zA-Z]\w{4,7}$" runat="server" ErrorMessage="first character must be a letter, it must contain at least 4 characters and no more than 8 characters."></asp:RegularExpressionValidator>
            </div>
            <br />
            <div class="form-group">
                <label for="formGroupExampleInput2">Confirm Password</label><br />
                <asp:TextBox ID="ConfirmPassTxt" CssClass="form-control" autocomplete="off" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <br />

            <div style="text-align: center;">
                <asp:Button ID="UpdatePass" CssClass="btn btn-primary" runat="server" Text="Reset Password" OnClick="UpdatePass_Click" />
                <br />
                <br />
            </div>
        </div>
    </form>

</body>
</html>
