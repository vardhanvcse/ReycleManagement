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
                    <div class="welcome-container" style="text-align: center; padding: 50px; background-color: #f0f8ff; border-radius: 10px;">
                        <h1 style="font-size: 2.5em; color: #1976D2; margin-bottom: 20px;">Welcome to the Recycle Management System</h1>
                        <h2 style="font-size: 1.8em; color: #64B5F6; margin-bottom: 30px;">Empowering Sustainable Waste Management</h2>
                        <p style="font-size: 1.2em; color: #555; line-height: 1.6; max-width: 800px; margin: 0 auto;">
                            Thank you for joining our mission to create a cleaner, greener environment. Our Recycle Management System is designed to streamline the recycling process, optimize resource management, and track waste efficiently.
                        </p>
                        <p style="font-size: 1.2em; color: #555; line-height: 1.6; max-width: 800px; margin: 20px auto;">
                            Whether you’re managing users, overseeing daily operations, handling finances, or analyzing reports, our system provides the tools you need to drive sustainability and operational excellence.
                        </p>
                        <p style="font-size: 1.2em; color: #555; line-height: 1.6; max-width: 800px; margin: 20px auto;">
                            Your role in this system is crucial to ensuring that our recycling efforts are efficient and impactful. Let’s work together to make a positive difference in our environment.
                        </p>
                    </div>
                </div>
            </form>
            <footer class="footer" style="height:50px">
                <div class="wrapper" >
                    <p>&copy; Recycle Management System. All rights reserved 2024.</p>
                </div>
            </footer>
</body>
</html>
