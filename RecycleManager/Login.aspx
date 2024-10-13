<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RecycleManager.Login" %>


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
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1532073122101-df0529d2b89d');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh;
        }

        .login-container {
    background: rgba(255, 255, 255, 0.9); /* White background with slight transparency */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
    margin: 0;
}

        .login-container h2 {
            margin-top: 0;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

        .login-container a {
            color: #007bff;
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
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
