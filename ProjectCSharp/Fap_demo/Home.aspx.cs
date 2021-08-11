using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = (User)Session["user"];
            if (u != null)
            {
                if(u.role == 2)
                {
                    con1.Visible = true;
                    if(DAO.getCountRequest() > 0)
                    {
                        Label4.Visible = true;
                    }
                }
                else if (u.role == 1)
                {
                    con2.Visible = true;
                }
                else if (u.role == 0)
                {
                    form1.Visible = true;
                    LinkButton1.Visible = true;
                    LinkButton1.Text = u.code;
                    con.Visible = true;
                }
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Fpt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void Home1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewprofile.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
        }
    }
}