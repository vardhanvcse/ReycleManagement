<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportsViewer.aspx.cs" Inherits="RecycleManager.ReportsViewer" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
                <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header text-center">
                                <i class="fas fa-link"></i> Report Links
                            </div>
                            <div class="card-body">
                                <ul class="list-group">
                                    <asp:Repeater ID="linksRepeater" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item">
                                                <a href='<%# Eval("Url") %>' target="_blank">
                                                    <i class="fas fa-external-link-alt"></i> <%# Eval("Title") %>
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

                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
              <footer class="footer" style="height:50px">
           
                 <div class="wrapper" >
                    <p>&copy; Recycle Management System. All rights reserved 2024.</p>
                 </div>
            </footer>
</body>
</html>

