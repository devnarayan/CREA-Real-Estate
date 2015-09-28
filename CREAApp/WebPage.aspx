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
        
        <asp:Button runat="server" ID="btnObAgent" OnClick="btnObAgent_Click" Text="AgentObject" /><br /><br />
        <asp:Button runat="server" ID="btnObjProperty" OnClick="btnObjProperty_Click" Text="PropertyObject" /><br /><br />
        <asp:Button runat="server" ID="btnObjOffice" OnClick="btnObjOffice_Click" Text="OfficeObject" /><br /><br />

       
    </div>
    </form>
</body>
</html>
