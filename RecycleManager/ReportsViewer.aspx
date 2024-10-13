<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportsViewer.aspx.cs" Inherits="RecycleManager.ReportsViewer" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>  
    <link rel="stylesheet" type="text/css" href="css/reports.css"/> 
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

