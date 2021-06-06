<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inspiration.aspx.cs" Inherits="_Default" %>

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
            <span class="headFont"> Inspiration</span>
        </div>
        <div class="inspirationUI">
            <div class="inspirationContent" style="width:70%">
                <asp:gridview ID="inspirationview" runat="server"></asp:gridview>
            </div>
            <div class="inspirationContent" style="width:30%">
                <span style="font-size:22px;font-family:'Microsoft YaHei UI';margin-bottom:20px">Recommended Keywords</span>
                <div style="display:flex;flex-direction:row;flex-wrap:wrap;justify-content:space-around">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
