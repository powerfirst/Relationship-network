using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MySqlConnection cn = new MySqlConnection();
            cn.ConnectionString = Session["cnString"].ToString();
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT inspiration.inspirationID,inspirationName AS 名称,typeName AS 类型, CONCAT(citeTimes,'次被引') AS 被引次数 , CONCAT('★',FORMAT(AVG(star),1)) FROM inspiration,type,evaluation WHERE inspiration.typeID = type.typeID AND inspiration.userID=@uid AND inspiration.inspirationID = evaluation.inspirationID GROUP BY inspiration.inspirationID", cn);
            da.SelectCommand.Parameters.AddWithValue("@uid", Session["userid"].ToString());
            cn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "my inspiration");
            cn.Close();
            gridview1.DataSource = ds.Tables["my inspiration"];
            gridview1.DataBind();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT SUM(star),FORMAT(AVG(star),1),COUNT(star) FROM evaluation WHERE evaluation.inspirationID IN (SELECT inspirationID FROM inspiration WHERE inspiration.userID = @uid); ";
            cmd.Parameters.AddWithValue("@uid", Session["userid"].ToString());
            Session.Add("searchPar", Session["userid"].ToString());//传递查询所用变量
            //传递查询所用命令
            Session.Add("searchOrder", "SELECT inspiration.inspirationID,inspirationName AS 名称,typeName AS 类型, CONCAT(citeTimes,'次被引') AS 被引次数 , FORMAT(AVG(star),1),content FROM inspiration,type,evaluation WHERE inspiration.typeID = type.typeID AND inspiration.userID=@uid AND inspiration.inspirationID = evaluation.inspirationID GROUP BY inspiration.inspirationID");
            cn.Open();
            MySqlDataReader rd = cmd.ExecuteReader();
            try
            {
                rd.Read();
                averagestar.Text = rd.GetString(1);
                totalstar.Text = rd.GetString(0);
            }
            catch {
                averagestar.Text = "0";
                totalstar.Text = "0";
                projecttotal.Text = "0";
            }
            cn.Close();
            cmd.CommandText = "SELECT COUNT(partnerID),userName FROM partner,user WHERE partner.userID=@uid and user.userID=@uid;";
            rd.Close();
            cn.Open();
            MySqlDataReader rd2 = cmd.ExecuteReader();
            if (rd2.HasRows)
            {
                rd2.Read();
                teamcount.Text = rd2.GetString(0);
                username.Text = rd2.GetString(1);
            }
            else
            {
                teamcount.Text = "0";
                username.Text = "tourist";
            }
            cn.Close();
            rd2.Close();
        }
    }

    protected void gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='lightgray';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor;");
            e.Row.Attributes.Add("onclick", "this.style.backgroundColor='gray';rectClick(event);window.location.href='inspiration_detail.aspx';");
        }

    }

    protected void gridview2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='lightgray';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor;");
            e.Row.Attributes.Add("onclick", "this.style.backgroundColor='gray';");
        }
    }

}