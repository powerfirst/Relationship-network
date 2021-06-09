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
            string inspiration_id = HttpContext.Current.Request.Cookies["inspiration_id"].Value;
            int idtrans = 0;
            for (int i = 0; i < inspiration_id.Length; i++) { idtrans *= 10; idtrans += (inspiration_id[i] - '0'); }
            MySqlConnection cn = new MySqlConnection();
            cn.ConnectionString = Session["cnString"].ToString();
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT inspiration.inspirationID,inspirationName AS 名称,content,typeName AS 类型, CONCAT(citeTimes,'次被引') AS 被引次数 , FORMAT(AVG(star),1) FROM inspiration,type,evaluation WHERE inspiration.typeID = type.typeID AND inspiration.userID=@uid AND inspiration.inspirationID = evaluation.inspirationID GROUP BY inspiration.inspirationID", cn);
            da.SelectCommand.Parameters.AddWithValue("@uid", Session["userid"].ToString());
            cn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "my inspiration");
            cn.Close();
            Response.Write(ds.Tables["my inspiration"].Rows[idtrans - 1][0].ToString());//获取inspiration_id
            
        }
    }
}