<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RecycleManager.Login" %>
<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>  
    <style>
        /* Login Container */
        .login-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 400px;
            margin: 50px auto;
            text-align: center;
        }

        /* Form Controls */
        .form-control {
            width: 100%;
            padding: 12px 20px;
            margin: 10px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        /* Login Button */
        .btn-login {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #45a049;
        }

        /* Error Label */
        .error-label {
            color: red;
            font-size: 0.9em;
            margin-top: 15px;
            display: block;
        }
        /* Header */
        .header {
            background-color: #4CAF50;
            padding: 20px 0;
            color: white;
            text-align: center;
        }

        .header-content h1 {
            font-size: 2em;
            margin: 0;
            font-weight: bold;
        }

        /* Footer */
        .footer {
            background-color: #333;
            padding: 15px 0;
            color: white;
            text-align: center;
            margin-top: 40px;
        }

        .footer-content p {
            margin: 0;         
            font-size: 0.9em;
            color: #aaa;
        }

    </style>
</head>
<body>
    <header class="header">
        <div class="wrapper">
            <h1>Recycle Management System</h1>
        </div>
    </header>

    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username" CssClass="form-control" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" CssClass="form-control" />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
            
            <!-- Error Label -->
            <asp:Label ID="lblError" runat="server" CssClass="error-label" Visible="false" />
        </div>
    </form>

    <footer class="footer">
        <div class="wrapper">
            <p>&copy; Recycle Management System. All rights reserved 2024.</p>
        </div>
    </footer>
</body>
</html>