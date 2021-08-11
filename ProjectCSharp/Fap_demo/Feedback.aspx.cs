using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = (User)Session["user"];
            if (u != null && u.role == 0)
            {
                LinkButton1.Text = u.code;
            }
            else
            {
                Response.Redirect("ErrorPage.aspx");
            }

            List<Term> listTerm = TermList.GetAllTerm(u.id);
            List<FeddBack> listfb = new List<FeddBack>();
            for (int i = 0; i < listTerm.Count; i++)
            {
                Term t = listTerm[i];
                if (i == TermList.GetAllTerm(u.id).Count - 1)
                {
                    listfb = FeedBackList.GetAllFeedbackById(u.id, t.id);
                    GridView1.DataSource = listfb;
                    GridView1.DataBind();
                    break;
                }

            }
            try
            {
                if (Request.QueryString["edit"] != null && !DAO.getFb(Convert.ToInt32(Request.QueryString["id"])).content.Equals(""))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    FeddBack fb1 = DAO.getFb(id);
                    txtClass.Text = fb1.classname;
                    txtSubject.Text = fb1.course;
                    txtTeacher.Text = fb1.teacher;

                    List<int> content = new List<int>();

                    Session["fid"] = id;
                    FeddBack fb = new FeddBack();

                    for (int i = 0; i < listfb.Count; i++)
                    {
                        fb = listfb[i];
                        if (fb.id == id)
                        {
                            string[] con = fb.content.Split(',');
                            foreach (string item in con)
                            {
                                content.Add(Convert.ToInt32(item));
                            }
                            break;
                        }
                    }

                    RadioButtonList1.Items.FindByValue(content[0].ToString()).Selected = true;
                    RadioButtonList2.Items.FindByValue(content[1].ToString()).Selected = true;
                    RadioButtonList3.Items.FindByValue(content[2].ToString()).Selected = true;
                    RadioButtonList4.Items.FindByValue(content[3].ToString()).Selected = true;
                    RadioButtonList5.Items.FindByValue(content[4].ToString()).Selected = true;
                    tbFeedback.Visible = true;
                    txtcon.Text = fb.contentdes;
                    if (Request.QueryString["edit"].Equals("1"))
                    {
                        Button1.Visible = true;
                    }

                }
                else
                {
                    if (Request.QueryString["edit"] != null)
                    {
                        int id = Convert.ToInt32(Request.QueryString["id"]);
                        FeddBack fb1 = DAO.getFb(id);
                        txtClass.Text = fb1.classname;
                        txtSubject.Text = fb1.course;
                        txtTeacher.Text = fb1.teacher;


                        Session["fid"] = id;
                        if (Request.QueryString["edit"].Equals("1") || Request.QueryString["edit"].Equals("0"))
                        {
                            tbFeedback.Visible = true;
                            Button1.Visible = true;
                        }
                    }

                }
            }
            catch
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue != "" && RadioButtonList2.SelectedValue != "" &&
                RadioButtonList3.SelectedValue != "" && RadioButtonList4.SelectedValue != "" && RadioButtonList5.SelectedValue != "")
            {
                int v1 = Convert.ToInt32(RadioButtonList1.SelectedValue);
                int v2 = Convert.ToInt32(RadioButtonList2.SelectedValue);
                int v3 = Convert.ToInt32(RadioButtonList3.SelectedValue);
                int v4 = Convert.ToInt32(RadioButtonList4.SelectedValue);
                int v5 = Convert.ToInt32(RadioButtonList5.SelectedValue);
                string content = v1 + "," + v2 + "," + v3 + "," + v4 + "," + v5;
                DAO.updateFeedback(Convert.ToInt32(Session["fid"]), content, txtcon.Text);
                lblresult.Text = "Send Feedback Successfull!";
                lblresult.Visible = true;

            }
            else
            {
                lblresult.Text = "Please check your option";
                lblresult.Visible = true;
            }
        }
    }
}