<%@ Page Language="C#" AutoEventWireup="true" CodeFile="group_manage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="styleSheet"  href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="headStyle" style="display:flex;flex-direction:column;justify-content:center;align-items:flex-start">
            <asp:Label ID="label_title" runat="server" CssClass="headFont" Text="Team Management"></asp:Label>
            <asp:Label ID="groud_id" runat="server" CssClass="teamNum" Text="NO.0123456"></asp:Label>
        </div>
        <h3>项目描述</h3>
        <div>
            <asp:Label ID="description" runat="server" CssClass="descriptionbox" Text="text"></asp:Label>
        </div>
        <asp:Label ID="urlsite" runat="server" Text="相关链接："></asp:Label>
        <asp:Label ID="mindcite" runat="server" Text="引用灵感："></asp:Label>
        <asp:Button ID="joinpro" runat="server" Text="加入项目"></asp:Button>
    </form>
</body>
</html>
