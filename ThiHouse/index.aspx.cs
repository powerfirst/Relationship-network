using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ConnectionStringSettings Settings;
        Settings = ConfigurationManager.ConnectionStrings["ThiHouse"];
        if (Settings != null) {
            Session.Add("cnString", Settings.ConnectionString);
            textAccount.Focus();
        }
    }

    protected void login_Click(object sender, EventArgs e)
    {
        MySqlConnection cn = new MySqlConnection();
        cn.ConnectionString = Session["cnString"].ToString();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "Select * from user where userID=@urid";
        cmd.Parameters.AddWithValue("@urid", textAccount.Text);
        cn.Open();
        MySqlDataReader rd = cmd.ExecuteReader();
        rd.Read();
        if (rd.HasRows && textPassword.Text == (string)rd["password"])
        {
            Session.Add("userid", textAccount.Text);
            Session.Add("userpass", textPassword.Text);
            Response.Redirect("profile.aspx");
        }
        else
        {
            Response.Write("<script>alert('用户名或密码错误！')</script>");
            textPassword.Text = "";
        }
        rd.Close();
        cn.Close();
    }

    protected void logup_Click(object sender, EventArgs e)
    {

    }
}