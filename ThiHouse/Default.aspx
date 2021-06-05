<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="styleSheet"  href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server" class="indexBackground" style="background-image:url(img/backgroundimg.jpg);background-size:contain">
        <div class="backgroundImg" style="background-image:url(img/为灵感赋能.png)"></div>
        <div class="loginBox">
            <div class="eachRow">
                <asp:label ID="label1" runat="server" CssClass="hint">用户名：</asp:label>
                <asp:textbox ID="buttonAccount" runat="server" CssClass="inputBox"  ></asp:textbox>
            </div>
            <div class="eachRow">
                <asp:label ID="label2" runat="server" CssClass="hint">密码：</asp:label>&nbsp;&nbsp;&nbsp;
                <asp:textbox ID="buttonPassword" runat="server" CssClass="inputBox"></asp:textbox>
            </div>
            <br />
            <br />
            <div class="eachRow" style="justify-content:space-around;width:60%">
                <asp:button ID="login" runat="server" CssClass="loginButton"  Text="登录"></asp:button>
                <asp:button ID="logup" runat="server" CssClass="loginButton"  Text="注册"></asp:button>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
