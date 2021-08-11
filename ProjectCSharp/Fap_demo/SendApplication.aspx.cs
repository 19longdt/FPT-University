using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fap_demo
{
    public partial class SendApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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

                ddType.DataSource = AppTypeList.getListAppTypeWithItemAll();
                ddType.DataTextField = "name";
                ddType.DataValueField = "id";
                ddType.DataBind();

                
                load();
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

        public void load()
        {
            
            User u = (User)Session["user"];
            lblmon.Text = u.balance.ToString() + " (VNĐ)";
            List<AppType> listapp = AppTypeList.getListAppTypeWithItemAll();
            double money = listapp[Convert.ToInt32(ddType.SelectedValue)].money;

            if(Convert.ToInt32(ddType.SelectedValue) != 0)
            {
                if (money <= u.balance)
                {
                    lblcheck.Text = "Phí để xử lý thủ tục này là: " + money + " (VND)";
                    lblcheck.Visible = true;
                    Button1.Visible = true;
                }
                else
                {
                    lblcheck.Text = "Phí để xử lý thủ tục này là: " + money + " (VND). Số dư tài khoản của bạn không đủ để thực hiện giao dịch.";
                    lblcheck.Visible = true;
                }
            }
            
        }

        protected void ddType_SelectedIndexChanged(object sender, EventArgs e)
        {
            load();
        }

        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".xlsx":
                    return true;
                case ".pdf":
                    return true;
                case ".docx":
                    return true;
                case ".doc":
                    return true;
                case ".xls":
                    return true;
                case ".zip":
                    return true;
                case ".jpg":
                    return true;
                case ".png":
                    return true;
                default:
                    return false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<AppType> listapp = AppTypeList.getListAppTypeWithItemAll();
            double money = listapp[Convert.ToInt32(ddType.SelectedValue)].money;
            User u = (User)Session["user"];

            if (FileUpload1.FileName.ToString().Equals(""))
            {
                DAO.insertRequest(new Registration(Convert.ToInt32(ddType.SelectedValue), Request.Form["txtpur"].ToString(), "", "", "", u.id));
                DAO.updatebalance(u.id, u.balance - money);
                send();
                return;
            }

            if (Page.IsValid && FileUpload1.HasFile && CheckFileType(FileUpload1.FileName))
            {                   
                string fileName =  DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                string filePath = MapPath("savefile/" + fileName);
                FileUpload1.SaveAs(filePath);

                DAO.insertRequest(new Registration(Convert.ToInt32(ddType.SelectedValue), Request.Form["txtpur"].ToString(), fileName, "", "", u.id));
                DAO.updatebalance(u.id, u.balance - money);

                send();
            }
            else 
            {
                lblresult.Text = "Please check your file attach!";
                lblresult.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void send()
        {
            Session["user"] = DAO.getUser((User)Session["Account"]);
            //lblmon.Text = "Account balance (Số dư tài khoản): " +  u.balance.ToString() + " (VNĐ)";
            lblresult.Text = "Send successfull!";
            lblresult.ForeColor = System.Drawing.Color.Green;
            ddType.SelectedIndex = 0;
            lblcheck.Text = "";
            txtpur.Value = "";
            load();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.ContentType = "Application";
            Response.AppendHeader("Content-Disposition", "attachment; filename=AppTemplate.zip");
            Response.TransmitFile(Server.MapPath(@"~/AppTemplate.zip"));
            Response.End();
        }
    }
}