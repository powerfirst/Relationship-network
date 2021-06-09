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
    
    int tot_cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MySqlConnection cn = new MySqlConnection();
            cn.ConnectionString= "server=localhost;user id=root;password=hiver020802;database=thihouse";
            MySqlDataAdapter da = new MySqlDataAdapter("SELECT * FROM keyword",cn);
            cn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "keyword");
            cn.Close();
            Random ran = new Random();
            Button[] btn = new Button[10];
            tot_cmd = ds.Tables["keyword"].Rows.Count;
            tot_cmd = Math.Min(tot_cmd, 10);
            for (int i = 0; i < tot_cmd; i++)
            {
                btn[i] = new Button();
                btn[i].ID = "button" + i.ToString();
                int picknum =(int)( i * Math.Floor(tot_cmd/10.0)+ ran.Next(0,(int)Math.Floor(tot_cmd/10.0)));
                btn[i].Text = ds.Tables["keyword"].Rows[picknum][0].ToString();
                PlaceHolder1.Controls.Add(btn[i]);
                btn[i].CssClass = "bt";
            }
        }
    }
}