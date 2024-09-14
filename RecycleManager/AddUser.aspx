<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="RecycleManager.AddUser" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>    
</head>
<body>
      <header class="header">
          <div class="wrapper">
              <h1>Recycle Management System</h1>
          </div>  
       </header>   

        <div class="main">
        <div class="wrapper">
            
            
            <!--Contact Detail Entry-->
            <div class="useradd-details">
                <form id="form1" runat="server">
                <h3>Add User</h3>          
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label><br/>
                    <span class="name">User Login Name</span>
                    <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate ="txtUserName" runat="server" ErrorMessage="*" Text="Missing User Name" /><br />
                    <span class="name">Mail Id</span>
                    <asp:TextBox ID="txtMailId" runat="server" placeholder="Mail Id"></asp:TextBox><br />
                    
                    
                    <span class="name">Phone Number</span>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ControlToValidate ="txtPhoneNumber" runat="server" ErrorMessage="*" Text="Missing Phone Number" /><br />
                     
                    <span class="name">Address</span>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Address"></asp:TextBox><br />
                    
                    <span class="name">Login Password</span>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password to login"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate ="txtPassword" runat="server" ErrorMessage="*" Text="Missing User Password" /><br />
                      
                    <span class="name">Select the Applicable Role</span>
                      <asp:DropDownList ID="ddlRoles" runat="server" Height="28px" Width="401px" />                      
                      <br />
                     
                      <asp:Button ID="btnAddUser" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddUser_Click" Text="Add uSER" Width="111px" />
                      <br />
                    </form>
                      </div>      
        </div>
    </div>

    <footer class="footer" style="height:50px">
    <div class="wrapper" >
        <p>&copy; Recycle Management System. All rights reserved 2024.</p>
    </div>
</footer>
</body>
</html>
