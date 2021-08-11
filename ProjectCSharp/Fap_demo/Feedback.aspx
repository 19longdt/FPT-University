<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Fap_demo.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 384px;
        }

        .auto-style2 {
            width: 815px;
            border: 1px dotted;
            border-color: orange;
        }
        .auto-style3 {
            margin-top: 0px;
        }
        #head{
            margin-top: -10px;
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
            <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" EnableModelValidation="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField HeaderText="GROUPNAME" DataField="classname" />
                    <asp:BoundField HeaderText="OPENDAY" DataField="openDate" />
                    <asp:BoundField HeaderText="LECTURER" DataField="teacher" />
                    <asp:BoundField HeaderText="SUBJECTS" DataField="course" />
                    <asp:BoundField HeaderText="CLOSINGDATE" DataField="closeDate" />
                    <asp:TemplateField HeaderText="DO FEEDBACK">
                        <ItemTemplate>
                            <a  href="Feedback.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>&edit=0" style="text-decoration: none">View</a>
                            <a  href="Feedback.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>&edit=1" style="text-decoration: none">Edit</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <br /><br />
        <div id="feedback" class="auto-style2">

            <table id="tbFeedback" runat="server" visible="false">
                <tr>
                    <td>
                    <div id="title">
                        <div id="head">
                            <asp:Label runat="server" BackColor="#999999" Font-Size="Large" ForeColor="White">>>EDIT FEEDBACK<<</asp:Label>
                        </div>
                        
                        <br />
                        <asp:Label BackColor="#FF6600" ForeColor="White" ID="txtClass" runat="server"> </asp:Label>
                        |
                        <asp:Label BackColor="#FF6600" ForeColor="White" ID="txtSubject" runat="server"> </asp:Label>
                        |
                        <asp:Label  BackColor="#FF6600" ForeColor="White" ID="txtTeacher" runat="server"> </asp:Label>
                        <br />
                    
                    </div>
                        </td>
                    
                </tr>
                <tr>
                    <td>
                        <div style="color: #008000">Sự đúng giờ của giảng viên trong giờ học</div>
                        <div>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem id="option1" runat="server" Value="1" >Luôn đúng giờ</asp:ListItem>
                                <asp:ListItem id="option2" runat="server" Value="2" >Phần Lớn đúng giờ</asp:ListItem>
                                <asp:ListItem id="option3" runat="server" Value="3" >Ít khi đúng giờ</asp:ListItem>
                                <asp:ListItem id="option4" runat="server" Value="4" >Không bao giờ đúng giờ</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <div style="color: #008000">Kỹ năng sư phạm của giảng viên</div>
                        <div>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                                <asp:ListItem runat="server" Value="1">Tốt</asp:ListItem>
                                <asp:ListItem runat="server" Value="2">Khá</asp:ListItem>
                                <asp:ListItem runat="server" Value="3">Trung Bình</asp:ListItem>
                                <asp:ListItem runat="server" Value="4">Kém</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="color: #008000">Đảm bảo khối lượng môn học theo chương trình</div>
                        <div>
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                                <asp:ListItem runat="server" Value="1">Đảm bảo hoàn toàn</asp:ListItem>
                                <asp:ListItem runat="server" Value="2" >Đảm bảo phần lớn</asp:ListItem>
                                <asp:ListItem runat="server" Value="3">Chỉ đảm bảo một phần</asp:ListItem>
                                <asp:ListItem runat="server" Value="4">Không đảm bảo</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <div style="color: #008000">Hỗ trợ của giảng viên trong và ngoài giờ - trả lời Email, hướng dẫn thực hành, giải đáp thắc mắc ...</div>
                        <div>
                            <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                                <asp:ListItem runat="server" Value="1">Tốt</asp:ListItem>
                                <asp:ListItem runat="server" Value="2">Khá</asp:ListItem>
                                <asp:ListItem runat="server" Value="3">Trung Bình</asp:ListItem>
                                <asp:ListItem runat="server" Value="4">Kém</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="color: #008000">Đáp ứng của giảng viên về những thắc mắc của học viên trong giờ học</div>
                        <div>
                            <asp:RadioButtonList ID="RadioButtonList5" runat="server">
                                <asp:ListItem runat="server" Value="1">Trả lời ngay hoặc trả lời vào cuối buổi học</asp:ListItem>
                                <asp:ListItem runat="server" Value="2">Trả lời vào buổi học sau</asp:ListItem>
                                <asp:ListItem runat="server" Value="3">Một số câu hỏi không được trả lời</asp:ListItem>
                                <asp:ListItem runat="server" Value="4">Phần lớn câu hỏi không được trả lời</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtcon"  runat="server" CssClass="auto-style3" Height="56px" Width="372px"></asp:TextBox>
                        <asp:Button ID="Button1" Visible="false" runat="server" Text="Send FeedBack" Width="107px" OnClick="Button1_Click" />
                        <asp:Label ID="lblresult" runat="server" ForeColor="Green" Visible="false" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
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
