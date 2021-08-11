<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Fap_demo.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1108px;
            border: 1px dotted orange;
        }

        #content {
            display: flex;
            flex-direction: row;
        }

        #content1, #content2, #content2 {
            margin-right: auto;
        }

        #tittle {
            margin-top: -10px;
        }
        #ti{
            margin-top: -10px;
        }
        #tit{
            margin-top: -10px;
        }
        .auto-style2 {
            width: 87px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <asp:LinkButton ID="Home1" runat="server" OnClick="Home1_Click" Text="FPT University Academic Portal" BackColor="#FF6600" BorderColor="#999966" BorderStyle="Double" ForeColor="White" Font-Size="Larger"></asp:LinkButton>
        <br />
        <br />

            <asp:LinkButton ID="LinkButton1" Visible="false" runat="server" OnClick="LinkButton1_Click" BackColor="#009933" ForeColor="White"></asp:LinkButton>
            |
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" BackColor="#009933" ForeColor="White">LogOut</asp:LinkButton>
        <br />
        <br />
        <div class="auto-style1" id="con1" visible="false" runat="server">
            <div id="ti">
                <asp:Label runat="server" ID="Label1" BackColor="#999999" Font-Size="Large" ForeColor="White">>> Request Management <<</asp:Label>

            </div>
            <h3>Request(Yêu cầu)</h3>
                    <a href="SolveRequest.aspx" style="text-decoration: none; color: #008000;">Solve Request (Giải quyết yêu cầu)</a>
            <asp:Label ID="Label4" Visible="false" runat="server" ForeColor="Red" Text=" (*)"></asp:Label>
                    <br />
                    <br />
        </div>
        <br /><br />
        <div class="auto-style1" id="con2" visible="false" runat="server">
            <div id="tit">
                <asp:Label runat="server" ID="Label3" BackColor="#999999" Font-Size="Large" ForeColor="White">>> Class Management <<</asp:Label>

            </div>
            <h3>Class(Lớp)</h3>
                    <a href="ExportClass.aspx" style="text-decoration: none; color: #008000;">Export List Student (Xuất danh sách sinh viên)</a>
                    <br />
                    <br />
        </div>
        <br /><br />


        <div class="auto-style1" id="con" visible="false" runat="server">
            <div id="tittle">
                <asp:Label runat="server" ID="Label2" BackColor="#999999" Font-Size="Large" ForeColor="White">>> Academic Information <<</asp:Label>

            </div>
            <br />
            <br />
            <div id="content">
                <div id="content1">
                    <h3>Reports(Báo cáo)</h3>
                    <a href="markreport.aspx" style="text-decoration: none; color: #008000;">Mark Report (Báo cáo điểm)</a>
                    <br />
                    <br />
                </div>
                <div id="content2">
                    <h3>Feedback(Ý kiến)</h3>
                    <a href="Feedback.aspx" style="text-decoration: none; color: #008000;">Feedback about teaching (Ý kiến về việc giảng dạy)</a>
                    <br />
                </div>
                <div id="content3">
                    <h3>Registration/Application(Thủ tục/đơn từ)</h3>
                    <a href="SendApplication.aspx" style="text-decoration: none; color: #008000;">Send Application (Gửi đơn) </a>
                    <br />
                    <a href="ViewApplication.aspx" style="text-decoration: none; color: #008000;">View Application (Xem đơn)</a>
                    <br />
                </div>
            </div>
        </div>
        <br /><br />
        <p style="text-align: center">
            <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>: Email: <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
        Điện thoại: <span class="style1"
            style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(024)7308.13.13 </span>
            <br />
            © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>&nbsp;|&nbsp;
        <a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>&nbsp;|&nbsp; <a href="http://library.fpt.edu.vn" target="_blank">library</a>&nbsp;|&nbsp; <a href="http://library.books24x7.com" target="_blank">books24x7</a>
            <span id="ctl00_lblHelpdesk"></span>
        </p>
    </form>
</body>
</html>
