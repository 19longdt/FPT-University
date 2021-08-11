<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportClass.aspx.cs" Inherits="Fap_demo.ExportClass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 77px;
        }
        .auto-style2 {
            width: 384px;
        }
        #content{
            display:  flex;
            flex-direction: row;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="Home" runat="server" OnClick="Home_Click" Text="FPT University Academic Portal" BackColor="#FF6600" BorderColor="#999966" BorderStyle="Double" ForeColor="White" Font-Size="Larger"></asp:LinkButton>
        <br />
        <br />

            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" BackColor="#009933" ForeColor="White"></asp:LinkButton>
            |
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" BackColor="#009933" ForeColor="White">LogOut</asp:LinkButton>
        <br /><br />
            <asp:Label ID="Label1" runat="server" Text="Export List Student to Excel" Font-Bold="True" Font-Size="Larger" ForeColor="#FF6600"></asp:Label>
            <br /><br />
            <div id="content">
                <div class="auto-style1">
                    <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Class">
                        <ItemTemplate>
                            <a href="ExportClass.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>" style="text-decoration: none"><%#DataBinder.Eval(Container.DataItem, "name") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

            </asp:GridView>
                </div>
                <div class="auto-style2">
                    <asp:GridView ID="GridView2" AutoGenerateColumns="False" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" BorderColor="White" Width="379px">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 
                <Columns>
                    <asp:BoundField HeaderText="Roll Number" DataField="code" />
                    <asp:BoundField HeaderText="DOB" DataField="dob" />
                    <asp:BoundField HeaderText="Full Name" DataField="fullname" />
                </Columns>  

                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
                </div>
            </div>
            
            
        </div>
        <asp:Button ID="Button1" Visible="false" runat="server" Text="Export" OnClick="Button1_Click" />
    </form>
</body>
</html>
