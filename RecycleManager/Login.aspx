<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RecycleManager.Login" %>
<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>    
</head>
<body style="padding: 50px; background-color: #f0f8ff; border-radius: 10px;">
      <header class="header">
          <div class="wrapper">
              <h1>Recycle Management System</h1>
          </div>  
       </header>   
     <link rel="stylesheet" type="text/css" href="css/login.css"/>    
    <form id="form1" runat="server">        
   
    <div class="login-container">
        <h2>Login</h2>
        <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username" CssClass="form-control" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" CssClass="form-control" />
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        <!-- Error Label -->
        <asp:Label ID="lblError" runat="server" CssClass="error-label" Visible="false" />
        <br />
    </div>
            </form>
        <footer class="footer" style="height:50px">
            <div class="wrapper" >
                <p>&copy; Recycle Management System. All rights reserved 2024.</p>
            </div>
        </footer>
</body>
</html>
