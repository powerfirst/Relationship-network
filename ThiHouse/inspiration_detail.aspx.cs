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
    int tot_comments;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int idtrans = 0;
            //复现查询，传参获得uid
            try
            {
                string inspiration_id = HttpContext.Current.Request.Cookies["inspiration_num"].Value;
                for (int i = 0; i < inspiration_id.Length; i++) { idtrans *= 10; idtrans += (inspiration_id[i] - '0'); }
            }
            catch {
                idtrans = 1;
            }
            MySqlConnection cn = new MySqlConnection();
            cn.ConnectionString = Session["cnString"].ToString();
            MySqlDataAdapter da = new MySqlDataAdapter(Session["searchOrder"].ToString(), cn);
            da.SelectCommand.Parameters.AddWithValue("@uid",Session["searchPar"].ToString()); 
            cn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "my inspiration");
            cn.Close();
            //赋值avg_star,description,inspiration_name
            avg_star.Text = ds.Tables["my inspiration"].Rows[idtrans - 1][4].ToString();
            description.Text = ds.Tables["my inspiration"].Rows[idtrans - 1][5].ToString();
            label_title.Text= ds.Tables["my inspiration"].Rows[idtrans - 1][1].ToString();
            Session.Add("inspiration_id", ds.Tables["my inspiration"].Rows[idtrans - 1][0].ToString());
            //查询publishername
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select userName from user where userID=@uid"; //uid在此处为查询的detail的uploader
            cmd.Parameters.AddWithValue("@uid", Session["searchPar"].ToString());
            cn.Open();
            MySqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            publisher_name.Text = rd.GetString(0);
            cn.Close();
            //设定edit可见
            if (Session["searchPar"].ToString() == Session["userID"].ToString()) edit_des.Visible = true;
            //查询评论
            cn.Open();
            MySqlDataAdapter da2 = new MySqlDataAdapter("select evaluationNote from evaluation where inspirationID=@iID",cn);
            da2.SelectCommand.Parameters.AddWithValue("@iID", ds.Tables["my inspiration"].Rows[idtrans - 1][0].ToString());
            da2.Fill(ds,"evaluation_note");
            GridView1.DataSource = ds.Tables["evaluation_note"];
            GridView1.DataBind();
            cn.Close();
            if (ds.Tables["evaluation_note"].Rows.Count==0) {
                Label1.Visible = true;
            }
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[0].Text.Length > 15) {
            e.Row.Cells[0].Text = (e.Row.Cells[0].Text).Substring(0, 15) +"...";
        }
    }

    protected void edit_des_Click(object sender, EventArgs e)
    {
        Response.Redirect("inspiration_submit.aspx");
    }
}