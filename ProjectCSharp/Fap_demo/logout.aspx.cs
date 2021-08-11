using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("User");
            Session.Remove("Account");
            Session.Remove("tid");
            Session.Remove("tid");
            Response.Redirect("Login.aspx");
        }
    }
}