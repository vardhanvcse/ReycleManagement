<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignOut.aspx.cs" Inherits="RecycleManager.SignOut" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Out - Recycle Management</title>
    <link href="css/signout.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="signout-container">
            <header>
                <h1>Thank You for Using Recycle Management!</h1>
            </header>
            <main>
                <div class="icon-container">
                    <img src="Images/recycling-icon.png" alt="Recycling Icon" class="recycling-icon" />
                </div>
                <h2>You Have Successfully Signed Out.</h2>
                <p>We hope to see you back soon! Together, we can make a difference.</p>
                <div class="button-group">
                    <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn home-btn">Home</asp:HyperLink>
                    <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn login-btn">Login Again</asp:HyperLink>
                </div>
            </main>
            <footer>
                <div class="social-icons">
                    <a href="https://www.facebook.com/" target="_blank" aria-label="Facebook"><img src="Images/facebook-icon.png" alt="Facebook" /></a>
                    <a href="https://twitter.com/?lang=en" target="_blank" aria-label="Twitter"><img src="Images/twitter-icon.png" alt="Twitter" /></a>
                    <a href="https://www.linkedin.com/" target="_blank" aria-label="LinkedIn"><img src="Images/linkedin-icon.png" alt="LinkedIn" /></a>
                </div>
                <p>&copy; 2024 Recycle Management. All rights reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>
