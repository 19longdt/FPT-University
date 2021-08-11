using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class SolveRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                

                User u = (User)Session["user"];
                if (u != null && u.role == 2)
                {
                    if (Request.QueryString["file"] != null && !Request.QueryString["file"].Equals(""))
                    {
                        string file = Request.QueryString["file"].ToString();
                        Response.ContentType = "Application/mp4";
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + file);
                        try
                        {
                            Response.TransmitFile(Server.MapPath(@"savefile/" + file));
                        }
                        catch
                        {
                            Response.Redirect("ErrorPage.aspx");
                        }
                        Response.End();
                    }

                    ddType.DataSource = AppTypeList.getListAppTypeWithItemAllbystatus();
                    ddType.DataValueField = "id";
                    ddType.DataTextField = "name";
                    ddType.DataBind();
                    load();

                }
                else
                {
                    Response.Redirect("ErrorPage.aspx");
                }

            }
        }

        private void load()
        {

            int count = DAO.getCountRequest();
            label.Text = "Number of Request must Solve: ";
            Label2.Text = count.ToString();

            if (Convert.ToInt32(ddType.SelectedValue) == 0)
            {
                int id = Convert.ToInt32(ddType.SelectedValue);
                GridView1.DataSource = Regislist.getRequestbyStatusAndIDType(id, 0);
                GridView1.DataBind();
            }
            else
            {
                int id = Convert.ToInt32(ddType.SelectedValue);
                GridView1.DataSource = Regislist.getRequestbyStatusAndIDType(id, 1);
                GridView1.DataBind();
            }



        }
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
        }

        protected void ddType_SelectedIndexChanged(object sender, EventArgs e)
        {
            load();
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //TextBox tx = new TextBox();  //here i m adding a control.
            //tx.ID = "txtCheck";
            //tx.Attributes.Add("runat", "server");
            //tx.Text = DateTime.Now.ToString();
            //int i = e.Row.Cells.Count;
            //i = i - 1;

            //TextBox tx1 = new TextBox();  //here i m adding a control.
            //tx1.ID = "txtNote";
            //tx1.Attributes.Add("runat", "server");
            //tx1.Text = "Nhà trường đồng ý";
            //int i1 = e.Row.Cells.Count;
            //i1 = i1 - 1;

            //DropDownList dd = new DropDownList();
            //dd.ID = "ddStatus";
            //dd.Attributes.Add("runat", "server");
            ////Dictionary<int, string> listStatus = new Dictionary<int, string>();
            ////listStatus.Add(1, "Reject");
            ////listStatus.Add(2, "Approved");
            ////dd.DataSource = listStatus;
            //dd.Items.Insert(0, new ListItem("Reject"));
            //dd.Items.Insert(1, new ListItem("Approved"));
            //int i2 = e.Row.Cells.Count;
            //i2 = i2 - 1;

            //Button btnSubmit = new Button();
            //btnSubmit.ID = "btnSubmit";
            //btnSubmit.Attributes.Add("runat", "server");
            //btnSubmit.Text = "Submit";
            //int i3 = e.Row.Cells.Count;
            //i3 = i3 - 1;

            //foreach (GridViewRow item in GridView1.Rows)
            //{
            //    item.Cells[i].Controls.Add(tx);
            //    item.Cells[i1].Controls.Add(tx1);
            //    item.Cells[i2].Controls.Add(dd);
            //    item.Cells[i3].Controls.Add(btnSubmit);
            //}
            //GridView1.Columns[3].HeaderText = "Solve Request";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
           // Button btn1 = (Button)form1.FindControl("Button1");
            string id = btn.CommandArgument.ToString();
            //TextBox tb = (TextBox)GridView1.FindControl("TextBox1");

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    TextBox textBox = row.FindControl("TextBox1") as TextBox;
                    RadioButtonList rbtn = (RadioButtonList)row.FindControl("RadioButtonList1");

                    DAO.updateRegistation(new Registration(Convert.ToInt32(id), DateTime.Now.ToString(), textBox.Text, Convert.ToInt32(rbtn.SelectedValue)));
                    ddType.DataSource = AppTypeList.getListAppTypeWithItemAllbystatus();
                    load();
                    return;
                }
            }



        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
    }
}