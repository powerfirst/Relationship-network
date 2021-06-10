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
        <div class="headStyle" style="width:100%;padding-top:20px;">
            <!--此处为灵感名-->
            <asp:Label ID="label_title" runat="server" CssClass="headFont" Text="Myinspiration"></asp:Label> 
            <!--此处为上传者名-->
            <div style="display:flex;flex-direction:row;justify-content:space-between;margin-left:15%;margin-right:10%;margin-top:20px;">
                <asp:Label ID="publisher_name" runat="server" CssClass="hint" Text="Brandon"></asp:Label>
                <asp:Image ID="image1" runat="server" ImageUrl="img/star.png" CssClass="starsize"></asp:Image>
                <!--此处为平均星级，要求保留一位小数-->
                <asp:Label ID="avg_star" runat="server" CssClass="hint" Text="3.4"></asp:Label>
            </div>
        </div>
        <div class="detailUI">
            <div>
                <span>Description:</span>
                <!--根据session.user_id决定edit_des按钮是否显示-->
                <asp:Button ID="edit_des" runat="server" Text="编辑..." Visible="true"></asp:Button>
            </div>
            <div>
                <!--此处为项目描述-->
                <asp:Label ID="description" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="detailUI">
            <asp:Button ID="button1" runat="server" Text="用此灵感召集团队..."></asp:Button>
        </div>
        <div class="detailUI">
            <div>
                <span>Comments:</span>
                <asp:Button ID="showall" runat="server" Text="逐条查看" />
            </div>
            <!--此处绑定评论内容（只要内容，别的什么都不要）-->
            <asp:GridView ID="GridView1" runat="server" CssClass="gridviewStyle" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
            <div>
                <asp:Button ID="copyInspiration" runat="server" Text="Copy..." />
                <asp:Button ID="createProject" runat="server" Text="Start Project" />
            </div>
        </div>
    </form>
</body>
</html>
