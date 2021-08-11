using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User u = DAO.getUser(new User(TextBox1.Text, TextBox2.Text));
            if(u != null)
            {
                string txt = formcap.ToString();
                //bool isHuman = formcap.Validate(txtCaptcha.Text);
                if (formcap.Validate(txtCaptcha.Text))
                {
                    Session["User"] = u;
                    Session["Account"] = new User(TextBox1.Text, TextBox2.Text);
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblResult.Text = "Captcha error";
                    lblResult.Visible = true;
                }
            }
            else
            {
                lblResult.Text = "Invalid account! Try again!!";
                lblResult.Visible = true;
            }
        }
    }
}