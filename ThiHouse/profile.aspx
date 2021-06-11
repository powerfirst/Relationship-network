<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="styleSheet"  href="StyleSheet.css" />
    <title></title>
    <script type="text/javascript">
      function rectClick(event) {
        //获取相对于当前所指向对象的位置坐标
          Z = event.pageY-255;
          document.cookie = "inspiration_num=" + (parseInt(Z / 100) + 1);
      }
    </script>
</head>
<body>
    
    <form id="form1" runat="server" >
        <div class="headStyle">
            <span class="headFont"> Profile</span>
        </div>
        <div class="profilePlace1" style="position:absolute;top:120px;">
            <div class="profilePlace2" style="width:40%">
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
            <div style="width:60%;">
                <div class="profilePlace2" style="width:100%;position:absolute;top:75px;" >
                    <span style="font-weight:bold;font-size:28px;font-family:'Times New Roman', Times, serif">My inspiration:</span><br />
                    <asp:GridView ID="gridview1"  runat="server" GridLines="Horizontal" ShowHeader="false" CssClass="gridviewStyle" RowStyle-Height="100px" OnRowDataBound="gridview1_RowDataBound" >
                    </asp:GridView><br />
                    
                    <span style="font-weight:bold;font-size:28px;font-family:'Times New Roman', Times, serif">My project:</span><br />
                    <asp:GridView ID="gridview2" runat="server" GridLines="Horizontal" ShowHeader="false" CssClass="gridviewStyle" RowStyle-Height="100px" OnRowDataBound="gridview2_RowDataBound"></asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
