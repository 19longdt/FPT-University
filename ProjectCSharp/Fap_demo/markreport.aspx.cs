using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Fap_demo
{
    public partial class markreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = (User)Session["user"];
            if(u == null || u.role != 0)
            {
                Response.Redirect("ErrorPage.aspx");
                return;
            }
            LinkButton1.Text = u.code;
            Label2.Text = "Grade report for " + u.fullname + " (" + u.code + ")";

            GridView1.DataSource = TermList.GetAllTerm(u.id);
            GridView1.DataBind();

            List<Term> list = TermList.GetAllTerm(u.id);
            for (int i = 0; i < list.Count; i++)
            {
                Term t = list[i];
                if (i == TermList.GetAllTerm(u.id).Count - 1)
                {
                    GridView2.DataSource = CourseList.GetAllCourse(t.id, u.id);
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    break;
                }
                
            }

            if (Request.QueryString["tid"] != null)
            {
                string t = Request.QueryString["tid"];
                Session["tid"] = t;
            }

            if (Session["tid"] != null)
            {
                int id = Convert.ToInt32(Session["tid"]);
                GridView2.DataSource = CourseList.GetAllCourse(id, u.id);
                GridView2.DataBind();
                GridView2.Visible = true;
            }
            //if (Request.QueryString["tid"] != null)
            //{
            //    int id = Convert.ToInt32(Request.QueryString["tid"]);
            //    GridView2.DataSource = CourseList.GetAllCourse(id, u.id);
            //    GridView2.DataBind();
            //    GridView2.Visible = true;
            //}

            string c = Request.QueryString["cid"];
            string cate = Request.QueryString["cateid"];
            if (c != null)
            {
                try
                {
                    if (Convert.ToInt32(cate) == 1)
                    {
                        tx1.Text = "Lab1";
                        tx2.Text = "Lab2";
                        tx3.Text = "PE";
                    }
                    else if (Convert.ToInt32(cate) == 2)
                    {
                        tx1.Text = "Small Test 1";
                        tx2.Text = "Small Test 2";
                        tx3.Text = "Mid-term test";
                    }

                    int cid = Convert.ToInt32(c);
                    MarkReport mr = DAO.getMarkReport(cid, u.code);
                    Status.Text = "STUDYING";
                    Status.ForeColor = System.Drawing.Color.Green;
                    if (mr != null)
                    {
                        int[] mark = mr.mark;
                        va1.Text = mark[0].ToString();
                        va2.Text = mark[1].ToString();
                        va3.Text = mark[2].ToString();
                        va4.Text = mark[3].ToString();
                        if (mr.status == 0)
                        {
                            Status.Text = "STUDYING";
                            Status.ForeColor = System.Drawing.Color.Green;
                        }
                        else if (mr.status == 1)
                        {
                            Status.Text = "PASSED";
                            Status.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            Status.Text = "NOT PASS";
                            Status.ForeColor = System.Drawing.Color.Red;
                        }
                        //txtStatus.Text = (mr.status == 1) ? "PASSED" : "NOT PASS";
                        double re = Math.Round(((mark[0] + mark[1] + mark[2]) * 0.2 + mark[3] * 0.4), 1);
                        Result.Text = re.ToString();
                    }

                    tableMark.Visible = true;
                    tableResult.Visible = true;
                    Label3.Visible = true;
                }
                catch
                {
                    Response.Redirect("ErrorPage.aspx");
                }
                
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
    }
}