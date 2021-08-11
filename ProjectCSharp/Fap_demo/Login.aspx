<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Fap_demo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">  
        .style2{
            width: 10%;  
        }
        .auto-style2 {
            width: 144px;
        }
        #form1{
            margin: 0 auto;
        }
        .auto-style3 {
            width: 99%;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 15%;
        }
    </style>  
</head>
<body>
    
        <form id="form1" runat="server">
        
            <div align="center" style="width:100%;">
                <asp:LinkButton ID="home" runat="server" Text="FPT University Academic Portal" BackColor="#FF6600" BorderColor="#999966" BorderStyle="Double" ForeColor="White" Font-Size="Larger"></asp:LinkButton>
        <br /><br />  
                <fieldset style ="width:200px;">
                <legend style="background-color: #FF6600; color: #FFFFFF;">Login page </legend>
                    <br />
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style5">Username:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="TextBox1" runat="server" Width="145px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="TextBox1" ErrorMessage="Please Enter Your Username"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">Password:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="TextBox2"    runat="server" Width="145px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="TextBox2" ErrorMessage="Please Enter Your Password"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="auto-style5">Confirm Captcha:</td>
                        <td><asp:textbox ID="txtCaptcha" runat="server" Width="74px" required ></asp:textbox>
                        </td>
                        <td><BotDetect:WebFormsCaptcha  ID="formcap" runat="server" /></td>
                    </tr>
                     <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style2">
                            <asp:Button ID="Button1" runat="server" Text="Let's Go" OnClick="Button1_Click" BackColor="White" BorderColor="#FF6600" BorderStyle="Outset" Font-Overline="False" Font-Underline="True" ForeColor="#FF6600" Height="28px" />
                        </td>
                        <td> 
                            <asp:Label ID="lblResult" Visible="false" runat="server" ForeColor="Red" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>
            
            

                <br /><br />
             <p style="text-align: center" class="auto-style4">
            
            © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>&nbsp;|&nbsp;
        <a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>&nbsp;|&nbsp; <a href="http://library.fpt.edu.vn" target="_blank">library</a>&nbsp;|&nbsp; <a href="http://library.books24x7.com" target="_blank">books24x7</a>
            <span id="ctl00_lblHelpdesk"></span>
        </p>
        </form>
    
    
</body>
</html>
