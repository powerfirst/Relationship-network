using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random ran = new Random();
        Button[] btn = new Button[10];
        for (int i = 0; i < 10; i++)
        {
            btn[i] = new Button();
            btn[i].ID = "button" + i.ToString();
            btn[i].Text = (i*10 + ran.Next(1,10)).ToString();
            PlaceHolder1.Controls.Add(btn[i]);
            btn[i].CssClass = "buttonStyle";
        }
    }
}