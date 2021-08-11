using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class ViewApplication : System.Web.UI.Page
    {
        string filename = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = (User)Session["user"];
            if (u != null && u.role == 0)
            {
                LinkButton1.Text = u.code;
                GridView1.DataSource = Regislist.getListRegistrationbysid(u.id);
                GridView1.DataBind();
                if (Request.QueryString["file"] != null)
                {
                    string file = Request.QueryString["file"].ToString();
                    Response.ContentType = "Application/mp4";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + file);
                    Response.TransmitFile(Server.MapPath(@"savefile/" + file));
                    Response.End();
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    if (row.Cells[4].ToString().Equals("Approved"))
                    {
                        row.Cells[4].ForeColor = System.Drawing.Color.Green;
                    }else if (row.Cells[4].ToString().Equals("Rejected"))
                    {
                        row.Cells[4].ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else
            {
                Response.Redirect("ErrorPage.aspx");
            }

            
        }
        protected void Home_Click(object sender, EventArgs e)
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
                    if (e.Row.Cells[4].Text == "Approved")
                    {
                        e.Row.Cells[4].ForeColor = System.Drawing.Color.Green;
                    }
                    else if (e.Row.Cells[4].Text == "Rejected")
                    {
                        e.Row.Cells[4].ForeColor = System.Drawing.Color.Red;
                    }
        }
    }
}