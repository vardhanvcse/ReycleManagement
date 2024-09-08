<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecycleManager.Default" %>
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
    <form id="form1" runat="server">
        <div class="dropdown">
            <asp:Button ID="btnLogin" runat="server" CssClass="login-button" Text="Log In" OnClick="btnLogin_Click" />
            <div class="dropdown-content">
                <a href="Login.aspx">Login</a>
                <a href="SignOut.aspx">Sign Out</a>
            </div>
        </div>
            <div>
                <asp:Label ID="lblWelcomeMessage" runat="server" Text="
                    <h2>Welcome to the Recycle Management System</h2>
                    <p>Empowering Sustainable Waste Management</p>
                    <p>Thank you for joining our mission to create a cleaner, greener environment. Our Recycle Management System is designed to streamline the recycling process, optimize resource management, and track waste efficiently.</p>
                    <p>Whether you’re managing users, overseeing daily operations, handling finances, or analyzing reports, our system provides the tools you need to drive sustainability and operational excellence.</p>
                    <p>Your role in this system is crucial to ensuring that our recycling efforts are efficient and impactful. Let’s work together to make a positive difference in our environment.</p>
                " />
            </div>
            </form>
            <footer class="footer" style="height:50px">
                <div class="wrapper" >
                    <p>&copy; Recycle Management System. All rights reserved 2024.</p>
                </div>
            </footer>
</body>
</html>
