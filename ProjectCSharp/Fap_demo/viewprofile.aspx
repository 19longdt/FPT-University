<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewprofile.aspx.cs" Inherits="Fap_demo.viewprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 369px;
            text-align: center;
            height: 19px;
        }

        .auto-style3 {
            width: 228px;
        }

        .auto-style4 {
            width: 369px;
        }
        .auto-style5 {
            width: 456px;
        }
        #btnSubmit{
            margin-left: 30%;
        }
        .auto-style6 {
            width: 706px;
        }
        .auto-style7 {
            width: 228px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 228px;
            height: 32px;
        }
        .auto-style10 {
            height: 32px;
        }
        #tittle{
            display: flex;
            flex-direction: row;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script>  
        $(function () {
            $('#txtdob').datepicker(
                {
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1990:2030'
                });
        })
    </script>
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
        <div class="auto-style6">
            <table>
                <tr>
                    <td>
                        <div id="tittle">
                            <div>
                            <div class="auto-style1" style="background-color: #C0C0C0; font-size: medium; font-style: italic; font-variant: normal; font-weight: bold;">Update Profile</div>
                            <%--<asp:Label ID="Label1" style="background-color: #C0C0C0;" Width="369px" Height="3px" runat="server"></asp:Label>--%>
                            <div style="background-color: #C0C0C0" class="auto-style4">
                                <br />
                            Đây là những thông tin quan trọng, được nhà trường dùng để in bằng tốt nghiệp,
                        bảng điểm tốt nghiệp và các chứng chỉ cấp cho sinh viên, 
                        ngoài ra còn để báo cáo các Bộ ngành liên quan nên sinh viên cần nhập thông tin đầy đủ, chính xác.
                            </div>
                        </div>
                        <div>
                            <%--<asp:Image ID="image" runat="server" Width ="130" Height="128" />--%>
                        </div>
                        </div>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style3">Full Name</td>
                                <td>
                                    <asp:TextBox ID="txtfullname" runat="server" Width="260px"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtfullname" ErrorMessage="NotEmpty FullName"
                                ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Roll Number</td>
                                <td>
                                    <asp:TextBox ID="txtRoll" Enabled="false" runat="server" Width="130px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">Phone Number</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtphone" runat="server" Width="130px"></asp:TextBox></td>
                                <td class="auto-style8"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtphone" ErrorMessage="NotEmpty PhoneNumber"
                                ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Date Of Birth</td>
                                <td>
                                    <asp:TextBox ID="txtdob" runat="server" Width="130px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style9">Address</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="ddCity" runat="server" Width="137px" Height="24px"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Gender</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                       <%-- <asp:RadioButton ID="rbtn1" Text="Male" runat="server" />
                                        <asp:RadioButton ID="rbtn2" Text="Female" runat="server" />--%>
                                        <asp:ListItem ID="rbtn1" Text="Male" runat="server"></asp:ListItem>
                                        <asp:ListItem ID="rbtn2" Text="FeMale" runat="server"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    
                                </td>

                            </tr>
                            <tr>
                                <td class="auto-style3">Major</td>
                                <td>
                                    <asp:TextBox ID="txtMajor" Enabled="false" runat="server" Width="260px"></asp:TextBox></td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>

            <div id="btnSubmit" class="auto-style5">
                <asp:Button runat="server" Text="Update" OnClick="Unnamed1_Click" />
                <asp:Label ID="lblResult" runat="server" Visible="false" ForeColor="Green" Text="Update your profile Successfull :D"></asp:Label>
            </div>
        </div>
        <br />
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
