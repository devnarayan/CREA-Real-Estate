<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebPage.aspx.cs" Inherits="CREAApp.WebPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br />
        <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" Text="Logout" /><br /><br />
        <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Search" /><br /><br />
    </div>
    </form>
</body>
</html>
