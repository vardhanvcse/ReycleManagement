<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportsViewer.aspx.cs" Inherits="RecycleManager.ReportsViewer" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>  
    <style>
        body {
            font-family: 'Times New Roman', sans-serif;
            background-color: #f8f9fa;
            font-weight:100;
        }
        .container {
            margin-top: 50px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-size: 1.5rem;
        }
        .card-body {
            background-color: #ffffff;
            padding: 20px;
        }
        .list-group-item {
            font-size: 1.2rem;
            transition: background-color 0.3s;
        }
        .list-group-item:hover {
            background-color: #e9ecef;
        }
        .list-group-item a {
            text-decoration: none;
            color: #007bff;
        }
        .list-group-item a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
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
                    <div class="dropdown">
                        <asp:Button ID="btnLogin" runat="server" CssClass="login-button" Text="Log Out"  />
                        <div class="dropdown-content">       
                            <a href="SignOut.aspx">Sign Out</a>
                        </div>
                    </div>
              
                    <div class="wrapper">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header text-center">
                                <i class="fas fa-link"></i> Report Links
                            </div>
                            <div class="card-body" >
                                <ul class="list-group">
                                    <asp:Repeater  ID="linksRepeater" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item">
                                                <a href='<%# Eval("Url") %>' target="_blank">
                                                    <i class="fas fa-external-link-alt"></i> <%# Eval("ReportName") %>
                                                </a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
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

