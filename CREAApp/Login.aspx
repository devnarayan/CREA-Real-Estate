<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CREAApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br />
        <br />
        <h2>Login CREA</h2>
        <br />
        User Name:
        <br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br /><br />
        Password:
        <br />
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </div>
    </form>
</body>
</html>
