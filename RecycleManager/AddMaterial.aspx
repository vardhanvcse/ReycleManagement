<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMaterial.aspx.cs" Inherits="RecycleManager.AddMaterial" %>

<!DOCTYPE html>

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

        <div class="main" style="padding: 50px; background-color: #f0f8ff; border-radius: 10px;">
        <div class="wrapper">
            
            
            <!--Contact Detail Entry-->
            <div class="useradd-details">
                <form id="form1" runat="server" >
                    <div class="dropdown">
                        <asp:Button ID="btnLogin" Width="80px" runat="server" CssClass="login-button" Text="Log Out"  />
                        <div class="dropdown-content">       
                            <a href="SignOut.aspx">Sign Out</a>
                        </div>
                    </div>
                <h3>Add Waste Material</h3>          
                    <br />
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label><br/>
                    <span class="name">Waste Material Name</span>
                    <asp:TextBox ID="txtWasteMaterialName" runat="server" placeholder="Waste Material Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate ="txtWasteMaterialName" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Waste Material Name" /><br />
                    <span class="name">Waste Material Description</span>
                    <asp:TextBox ID="txtWasteMaterialDescription" runat="server" placeholder="Waste Material Description"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate ="txtWasteMaterialDescription" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Waste Material Description" /><br />
                    <asp:Button ID="btnAddWasteMaterial" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddWasteMaterial_Click" Text="Add Waste Material" Width="126px" />
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
