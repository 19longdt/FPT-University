<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewApplication.aspx.cs" Inherits="Fap_demo.ViewApplication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="home" runat="server" OnClick="Home_Click" Text="FPT University Academic Portal" BackColor="#FF6600" BorderColor="#999966" BorderStyle="Double" ForeColor="White" Font-Size="Larger"></asp:LinkButton>
            <br />
            <br />
            <div>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" BackColor="#009933" ForeColor="White"></asp:LinkButton>
                |
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" BackColor="#009933" ForeColor="White">LogOut</asp:LinkButton>
            </div>
            <br />
            <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" Width="633px">
                <Columns>
                    <asp:BoundField HeaderText="PURPOSE" DataField="purpose" />
                    <asp:BoundField HeaderText="CREATEDATE" DataField="sendDate" />
                    <asp:BoundField HeaderText="PROCESSNOTE" DataField="processnote" />
                    <asp:TemplateField HeaderText="FILE">
                        <ItemTemplate>
                            <a href="ViewApplication.aspx?file=<%#DataBinder.Eval(Container.DataItem, "filename") %>"><%#DataBinder.Eval(Container.DataItem, "filename") %></a>
                            <%--<asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click1" runat="server"><%#DataBinder.Eval(Container.DataItem, "filename") %></asp:LinkButton>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="STATUS" DataField="status" />
                    <asp:BoundField HeaderText="STACHANGE STATUS TIME" DataField="closeDate" />
                </Columns>  
                <FooterStyle BackColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White"  HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
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
