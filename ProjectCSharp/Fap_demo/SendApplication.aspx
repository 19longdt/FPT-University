<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendApplication.aspx.cs" Inherits="Fap_demo.SendApplication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 929px;
        }
        #bala{
            text-align: center;
        }
        .auto-style2 {
            width: 457px;
            height: 128px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="home" runat="server" OnClick="Home_Click" Text="FPT University Academic Portal" BackColor="#FF6600" BorderColor="#999966" BorderStyle="Double" ForeColor="White" Font-Size="Larger"></asp:LinkButton>
        <br />
        <br />
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" BackColor="#009933" ForeColor="White"></asp:LinkButton>
            |
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" BackColor="#009933" ForeColor="White">LogOut</asp:LinkButton>
        </div>
        <br />
        <div>
            <h2>Send an application to Academic Administration dept (Gửi đơn cho Phòng quản lý đào tạo)</h2>
            <h4 class="auto-style1" style="font-style: italic">Lưu ý: V/v gửi đơn/email đến Phòng TC&QLĐT
                Phòng TC&QLĐT sẽ trả lời đơn/email của sinh viên trong vòng 48h 
                (trừ đơn xin phúc tra, chuyển cơ sở; không tính ngày nghỉ). 
                Để hạn chế SPAM, Phòng TC&QLĐT sẽ giãn thời gian trả lời đơn/email 
                có tính chất SPAM theo nguyên tắc: Khi sinh viên gửi N đơn/email (N>1) 
                cho cùng một yêu cầu thì thời gian trả lời trong vòng N x 48h. 
                Vì vậy sinh viên cần cân nhắc trước khi gửi đơn/email với cùng một nội dung để nhận được 
                trả lời/giải quyết nhanh nhất theo quy định.</h4>
            <div id="bala" class="auto-style1">
                <asp:Label ID="lbl1" runat="server" Text="Label">Account balance (Số dư tài khoản): </asp:Label>
                <asp:Label ID="lblmon" runat="server" Text="Label"></asp:Label>
            </div>
            <div>
                <table class="auto-style1">
                    <tr>
                        <td>Application type:</td>
                        <td><asp:DropDownList ID="ddType" runat="server" Height="25px" Width="415px" AutoPostBack = "true" OnSelectedIndexChanged="ddType_SelectedIndexChanged"></asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="lblcheck" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                        </td> 
                    </tr>
                    <tr>
                        <td>Purpose:</td>
                        <td><textarea id="txtpur" runat="server" class="auto-style2" required="" ></textarea></td>
                    </tr>
                    <tr>
                        <td>File Attach:</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br />
                            <h5 style="font-style: inherit">Extension File: "xlsx", "pdf", "docx", "doc", "xls", "jpg", "png","zip" => Template 
                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Click here</asp:LinkButton>
                            </h5>
                            <asp:Button ID="Button1" Visible="false" runat="server" Text="Send" BackColor="#339933" ForeColor="White" OnClick="Button1_Click" />
                            <asp:Label ID="lblresult" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div><br />
        <br />
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
