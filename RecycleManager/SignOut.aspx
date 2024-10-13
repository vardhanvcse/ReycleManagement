<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignOut.aspx.cs" Inherits="RecycleManager.SignOut" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Out - Recycle Management</title>
    <link href="css/SignOut.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="signout-container">
            <header>
                <h1>Thank you for using Recycle Management!</h1>
            </header>
            <main>
                <div class="icon-container">
                    <img src="Images/recycling-icon.png" alt="Recycling Icon" />
                </div>
                <h2>You have successfully signed out.</h2>
                <p>We hope to see you back soon! Let's continue making a difference.</p>
                <div class="button-group">
                    <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn">Home</asp:HyperLink>
                    <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn">Login Again</asp:HyperLink>
                </div>               
            </main>
            <footer>
                <div class="social-icons">
                    <a href="https://www.facebook.com/"><img src="Images/facebook-icon.png" alt="Facebook" /></a>
                    <a href="https://twitter.com/?lang=en"><img src="Images/twitter-icon.png" alt="Twitter" /></a>
                    <a href="https://www.linkedin.com/"><img src="Images/linkedin-icon.png" alt="LinkedIn" /></a>
                </div>
                <p>&copy; 2024 Recycle Management. All rights reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>