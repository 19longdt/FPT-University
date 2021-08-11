using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class ExportClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                User u = (User)Session["user"];
                if (u != null && u.role == 1)
                {
                    load();
                    if (Request.QueryString["id"] != null)
                    {
                        try
                        {
                            int cid = Convert.ToInt32(Request.QueryString["id"]);
                            int[] sid = DAO.getIDStudentbyCid(cid);
                            List<User> list = new List<User>();
                            foreach (int item in sid)
                            {
                                User u1 = DAO.getStudentById(item);
                                list.Add(u1);
                            }
                            GridView2.DataSource = list;
                            GridView2.DataBind();
                            Button1.Visible = true;
                        }
                        catch
                        {
                            Response.Redirect("ErrorPage.aspx");
                        }
                    }
                }
                else
                {
                    Response.Redirect("ErrorPage.aspx");
                }
                
            }
        }

        private void load()
        {
            User u = (User)Session["user"];
            GridView1.DataSource = DAO.getClassbyTid(u.id);
            GridView1.DataBind();


        }
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("#");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", "attachment; filename=ListStudent.xls");
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView2.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

    }
}