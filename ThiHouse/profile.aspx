<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="_Default" %>

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
            <span class="headFont"> Profile</span>
        </div>
        <div class="profilePlace1">
            <div class="profilePlace2">
                <asp:Image ID="Image1" runat="server" ImageUrl="img/backgroundimg.jpg" CssClass="profileIcon"/>
                <div class="profilePlace3">
                    <span style="font-weight:bold">UserName:</span>
                    <asp:Label ID="username" runat="server" Text="Brandon"></asp:Label>
                </div>
                <div class="profilePlace3">
                    <span style="font-weight:bold">Stars:</span>
                    <asp:Label ID="averagestar" runat="server" Text="3.7"></asp:Label>
                    <span>/</span>
                    <asp:Label ID="totalstar" runat="server" Text="120"></asp:Label>
                </div>
                <div class="profilePlace3">
                    <span style="font-weight:bold">Total:</span>
                    <asp:Label ID="projecttotal" runat="server" Text="12"></asp:Label>
                </div>
                <div class="profilePlace3">
                    <span style="font-weight:bold">Teams:</span>
                    <asp:Label ID="teamcount" runat="server" Text="12"></asp:Label>
                </div>
            </div>
            <div style="width:60%">
                <div class="profilePlace2">
                    <span style="font-weight:bold">My group:</span><br />
                    <asp:GridView ID="gridview1" runat="server"></asp:GridView>
                    <span style="font-weight:bold">My project:</span><br />
                    <asp:GridView ID="gridview2" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
