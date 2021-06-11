using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Globalization;

public partial class inspiration_submit : System.Web.UI.Page
{
    List<string> ans = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["upload_title"] != null) {//防止网络错误上传失败
                TextBox1.Text = Session["upload_title"].ToString();
                TextBox2.Text = Session["upload_context"].ToString();
                TextBox3.Text = Session["upload_source"].ToString();
                DropDownList1.SelectedIndex = Convert.ToInt32(Session["upload_type"].ToString());
            }
            TextBox2.Attributes.Add("onkeydown", "countNum();");
            TextBox2.Attributes.Add("onmouseover", "countNum();");
            TextBox3.Attributes.Add("onclick", "checkhint();");
            judgeins.Visible = false;
            //【任务1】从type中读入所有type类型，绑定至dropdownlist1

            //在以上位置加入代码
            //读取各字段
            MySqlConnection cn = new MySqlConnection();
            cn.ConnectionString = Session["cnString"].ToString();
            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = "select * from inspiration where inspirationID=@iID";
            cmd.Parameters.AddWithValue("@iID", Session["inspiration_id"].ToString());
            cmd.Connection = cn;
            cn.Open();
            MySqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            //将数据绑定至各控件

            //在以上位置加入代码
            cn.Close();
            rd.Close();
            //读取keyword
            cmd.CommandText = "select keyword from keyword where inspirationID=@iID";
            cn.Open();
            rd = cmd.ExecuteReader();
            if(rd.HasRows)
            {
                while (rd.Read())
                {
                    Label2.Text = Label2.Text + "  " + rd.GetString(0);
                }
            }
            else{
                Label2.Text = "暂无关键字！";
            }
            cn.Close();
            rd.Close() ;
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        judgeins.Visible = true;
        //【任务2】在数据库中新建一个事务update OR insert
        //【任务3】此处按钮被按下后执行事务

        //代码写在上方
        if (nlp(TextBox1.Text, TextBox2.Text) == 1)
        {
            //提取关键字，保存在ans这一列表中。
            //【任务4】删除所有该inspiration对应的关键字。
            //【任务5】新建一个procedure，有inspirationID与keyword两个输入参数，insert到keyword表中
            //【任务6】将ans列表中的所有元素insert利用上述procedure，insert到keyword表中

            //代码写在上方
            Session.Add("searchOrder", "SELECT inspiration.inspirationID,inspirationName AS 名称,typeName AS 类型, CONCAT(citeTimes,'次被引') AS 被引次数 , FORMAT(AVG(star),1),content FROM inspiration,type,evaluation WHERE inspiration.typeID = type.typeID AND inspiration.inspirationID = evaluation.inspirationID AND inspiration.inspirationID=@uid");
            Session.Add("searchPar", Session["inspiration_id"].ToString());
            Response.Redirect("inspiration_detail.aspx");
        }
        else {
            Response.Write("<script>alert('提交失败，请尝试重新提交！')</script>");
            Session.Add("upload_title", TextBox1.Text);
            Session.Add("upload_context", TextBox2.Text);
            Session.Add("upload_source", TextBox3.Text);
            Session.Add("upload_type", DropDownList1.SelectedIndex);
        }
    }

    public int nlp(string title,string content)
    {
        var API_KEY = "7CsKZgStSod4jGqavwMQpwVT";
        var SECRET_KEY = "dSpDOfZzaGgD0sGcTbsxGUSGjxem7vrU";
        var client = new Baidu.Aip.Nlp.Nlp(API_KEY, SECRET_KEY);
        client.Timeout = 60000;
        try
        {
            var result = client.Keyword(title, content);
            JArray ja = JArray.Parse(result["items"].ToString());
            for (int i = 0; i < ja.Count(); i++)
            {
                JObject o = JObject.Parse(ja[i].ToString());
                if (Convert.ToDecimal(o["score"].ToString()) * 100 > 90)
                {
                    ans.Add(o["tag"].ToString());
                }
            }
            return 1;
        }
        catch {
            return 0;
        }
    }
}