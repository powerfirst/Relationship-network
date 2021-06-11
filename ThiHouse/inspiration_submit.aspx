<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inspiration_submit.aspx.cs" Inherits="inspiration_submit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="styleSheet"  href="StyleSheet.css" />
    <title></title>
<script type="text/javascript">
    function countNum()
    {
        var count=document.getElementById("TextBox2").value.length;
        document.getElementById("Label1").innerHTML = count + "/250";
        if (count > 250) {
            document.getElementById("Label1").style = "color:red;font-size:18px";
        }
        else {
            document.getElementById("Label1").style = "color:grey;font-size:18px;";
        }
    }
    function checkhint(){
        document.getElementById("judgeins").style = "visibility:hidden;";
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headStyle">
            <span class="headFont"> Inspiration</span>
            <!--项目编号-->
            <asp:Label ID="labelnum" runat="server" Text="#000011" ForeColor="Gray"></asp:Label> 
        </div>
        <br />
        <div style="display:flex;flex-direction:row;justify-content:flex-start;margin-left:5%;width:95%">
            <span style="font-size:24px">灵感名称：</span>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textboxStyle" Width="70%"></asp:TextBox>
        </div>
        <br />
        <div style="display:flex;flex-direction:row;justify-content:flex-start;margin-left:5%;width:95%">
            <span style="font-size:24px">灵感类型:</span>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textboxStyle"></asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Text="thisKeywords"></asp:Label>
        </div>
        <br />
        <div>
            <div style="display:flex;flex-direction:row;justify-content:flex-start;margin-left:5%;width:95%;margin-bottom:15px">
                <span style="font-size:24px">灵感描述：</span>
            </div>
            <div style="margin-left:5%">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="textboxStyle" Width="78%" Height="300px" TextMode="MultiLine" Font-Size="20px" MaxLength="260"  ></asp:TextBox>
            </div>
            <div style="display:flex;flex-direction:row;justify-content:flex-end;width:80%">
                <asp:Label ID="Label1" runat="server" Text="0/250" ForeColor="Gray" Font-Size="18px"></asp:Label>
            </div>
        </div>
        <br />
        <div style="width:95%;display:flex;flex-direction:row;">
            <span style="margin-left:5%;font-size:24px;">灵感来源：</span>
            <div style="display:flex;flex-direction:column;align-items:center;width:180px;">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="textboxStyle" Width="100px" Height="20px" Font-Size="16px" ></asp:TextBox>
                <span style="color:grey;font-size:10px;">灵感来源应填写参考的灵感号</span>
            </div>
            <div style="margin-left:2%;color:red">
                <asp:Label ID="judgeins" runat="server" Text="灵感号不存在!" ></asp:Label>
            </div>
        </div>
        <div style ="display:flex;width:95%;height:100px;flex-direction:row;justify-content:center;">
            <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="bt" Width="40%" Height="60%" Font-Size="Larger"/>
        </div>
    </form>
</body>
</html>
