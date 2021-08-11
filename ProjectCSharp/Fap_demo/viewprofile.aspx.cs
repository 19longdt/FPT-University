using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class viewprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                User u = (User)Session["user"];
                if (u != null && u.role == 0)
                {
                    load(); 
                }
                else
                {
                    Response.Redirect("ErrorPage.aspx");
                }


            }
        }
        public void load()
        {
            User u = (User)Session["user"];

            //image.ImageUrl = "~/image/" + u.img;
            LinkButton1.Text = u.code;
            ddCity.DataTextField = "Cityname";
            ddCity.DataValueField = "id";
            ddCity.DataSource = DAO.getCity();
            ddCity.SelectedValue = u.address.ToString();
            ddCity.DataBind();

            txtfullname.Text = u.fullname;
            txtRoll.Text = u.code;
            txtdob.Text = u.dob;
            txtphone.Text = u.phone;
            txtMajor.Text = u.major;
            txtdob.Text = u.dob;
            if (u.gender == 1)
            {
                rbtn1.Selected = true;

            }
            else
            {
                rbtn2.Selected = true;
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

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            User u = (User)Session["user"];
            DAO.updateStudent(new User(u.id, txtfullname.Text, txtdob.Text,
                Convert.ToInt32(ddCity.SelectedValue),
                (rbtn1.Selected == true) ? 1 : 0, txtphone.Text));
            lblResult.Visible = true;
            Session["user"] = DAO.getUser((User)Session["Account"]);
        }

    }
}