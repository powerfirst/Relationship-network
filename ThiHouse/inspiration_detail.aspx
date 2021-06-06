<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inspiration_detail.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" rel="styleSheet"  href="StyleSheet.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headStyle">
            <asp:Label ID="label_title" runat="server" CssClass="headFont" Text=""></asp:Label>
        </div>
        <div class="detailUI">
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
        <div class="detailUI">
            <asp:Button ID="button1" runat="server" Text="用此灵感召集团队..."></asp:Button>
        </div>
    </form>
</body>
</html>
