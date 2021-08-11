<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="markreport.aspx.cs" Inherits="Fap_demo.markreport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 88px;
        }
        .auto-style2 {
            margin-top: 0px;
        }
        .auto-style3 {
            width: 30%;
        }
        .auto-style7 {
            text-align: center;
            width: 131px;
        }
        .auto-style8 {
            width: 350px;
        }
        .auto-style9 {
            width: 566px;
        }
        #content{
            display: flex;
            flex-direction: row;
        }
        #value{
            text-align: center;
        }

        .auto-style11 {
            width: 351px;
        }
        
        .auto-style14 {
            width: 225px;
        }

        .auto-style15 {
            width: 175px;
            height: 23px;
        }
        .auto-style16 {
            height: 23px;
        }
        #home{
            text-decoration: none;
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
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <div id="content">
            <div id="left" class="auto-style9">
            <table class="auto-style3">
                <tr style="background-color: #C0C0C0">
                    <td class="auto-style1">TERM</td>
                    <td>COURSE</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" Width="95px" EnableModelValidation="True" CssClass="auto-style2">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>

                                        <a href="markreport.aspx?tid=<%#DataBinder.Eval(Container.DataItem, "id") %>" style="text-decoration: none"><%#DataBinder.Eval(Container.DataItem, "name") %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </td>
                    <td>
                        <asp:GridView Visible="false" ID="GridView2" AutoGenerateColumns="False" runat="server" Width="463px" EnableModelValidation="True" CssClass="auto-style2">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href="markreport.aspx?cid=<%#DataBinder.Eval(Container.DataItem, "id") %>&cateid=<%#DataBinder.Eval(Container.DataItem, "cid") %>" style="text-decoration: none">
                                            <%#DataBinder.Eval(Container.DataItem, "fullname") %>(<%#DataBinder.Eval(Container.DataItem, "courseName") %>) (Start <%#DataBinder.Eval(Container.DataItem, "date") %>)</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </td>
                </tr>
            </table>
            </div>
            <br />
            <div id="right">
                <table  id="tableMark" runat="server" visible="false" class="auto-style8">
                <tr>
                    <td class="auto-style14" style="background-color: #C0C0C0">GRADE CATEGORY</td>
                    <td class="auto-style7" style="background-color: #C0C0C0">WEIGHT</td>
                    <td class="value" style="background-color: #C0C0C0">VALUE</td>
                </tr>
                <tr>
                    <td class="auto-style14"><asp:Label ID="tx1" runat="server" Enabled="False"></asp:Label></td>
                    <td class="auto-style7">20%</td>
                    <td class="value"><asp:Label ID="va1" runat="server" Enabled="False" Width="50px"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style14"><asp:Label ID="tx2" runat="server" Enabled="False"></asp:Label></td>
                    <td class="auto-style7">20%</td>
                    <td class="value"><asp:Label ID="va2" runat="server" Enabled="False" Width="50px"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style14"><asp:Label ID="tx3" runat="server" Enabled="False"></asp:Label></td>
                    <td class="auto-style7">20%</td>
                    <td class="value"><asp:Label ID="va3" runat="server" Enabled="False" Width="50px"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style14">Final Exam</td>
                    <td class="auto-style7">40%</td>
                    <td class="value"><asp:Label ID="va4" runat="server" Enabled="False" Width="50px"></asp:Label></td>
                </tr>
            </table>
            <asp:Label ID="Label3" visible="false" runat="server" Width="350px" BackColor="#99CCFF" Height="3px"></asp:Label>
            
            <table id="tableResult" runat="server" visible="false" class="auto-style11" >
                <tr>
                    <td class="auto-style15" >COURSE TOTAL</td>
                    <td class="auto-style16" >AVERAGE</td>
                    <td class="auto-style16"><asp:Label ID="Result" Enabled="false" runat="server" Width="24px" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style15" ></td>
                    <td class="auto-style16" >STATUS</td>
                    <td class="auto-style16"><asp:Label ID="Status" Enabled="false" runat="server"  Width="89px"></asp:Label></td>
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
