<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecycleManager.Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recycle Manager</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/> <!-- Main styles -->
    <link type="text/css" href="css/default_view.css" rel="stylesheet" />   
</head>
<body> 
    <div class="wrapper">      
        <header class="header">
            <div class="header-content">
                <h1>Recycle Management System</h1>
            </div>
        </header>
        <form id="form1" runat="server">
            <div class="dropdown">
                <asp:Button ID="btnLogin" Width="80px" runat="server" CssClass="login-button" Text="Log In" OnClick="btnLogin_Click" />
                <div class="dropdown-content">
                    <a href="Login.aspx">Login</a>
                    <a href="SignOut.aspx">Sign Out</a>
                </div>
            </div>
                        
            <div class="welcome-container">
                <h1>Welcome to the Recycle Management System</h1>
                <h2>Empowering Sustainable Waste Management</h2>
                <p>
                    Thank you for joining our mission to create a cleaner, greener environment. Our Recycle Management System is designed to streamline the recycling process, optimize resource management, and track waste efficiently.
                </p>
                <p>
                    Whether you’re managing users, overseeing daily operations, handling finances, or analyzing reports, our system provides the tools you need to drive sustainability and operational excellence.
                </p>
                <p>
                    Your role in this system is crucial to ensuring that our recycling efforts are efficient and impactful. Let’s work together to make a positive difference in our environment.
                </p>
            </div>
        </form>
    </div>
      
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 Recycle Management System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
