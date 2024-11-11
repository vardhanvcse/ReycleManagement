<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecycleManagementDesk.aspx.cs" Inherits="RecycleManager.RecycleManagementDesk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recycle Admin</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>  
     <link rel="stylesheet" type="text/css" href="css/dashboard.css"/>  
</head>
<body>
    <header class="header">
        <div class="wrapper">
            <h1>Recycle Management Desk</h1>
        </div>
    </header>

    <form id="form1" runat="server" class="welcome-container">
         <div class="dropdown">
            <asp:Button ID="btnLogOut" Width="80px" runat="server" OnClick="btnLogOut_Click"  CssClass="login-button" Text="Log Out"  />
        </div>
        <div>
            <h3 style="color:purple; text-align: center; margin-bottom: 20px;">Dashboard</h3>

            <!-- Dashboard Container -->
            <div class="dashboard-container">
                <!-- Vehicle Management -->
                <div id="divVehicleMgt" class="dashboard" runat="server">
                    <h1><asp:Label ForeColor="Purple" ID="lblVehicles" runat="server" Text="0"></asp:Label></h1>
                    <span class="dashboard-title">Vehicles</span><br />
                    <a href="VehiclesManagement.aspx">
                        <button type="button" class="btn-view">View All</button>
                    </a>
                </div>

                <div class="dashboard">
                    <h1>
                        <asp:Label ForeColor="Purple" ID="Label1" runat="server" Text=" "></asp:Label>
                        <asp:Label ForeColor="Purple" ID="Label2" runat="server" Text=" "></asp:Label>
                    </h1>
                    <span class="dashboard-title">Data Management</span><br />
                    <a href="DataManagement.aspx">
                        <button type="button" class="btn-view">Data Entry Console</button>
                    </a>
                </div>

                <div class="dashboard" id="userMgtPanel" runat="server">
                    <h1><asp:Label ForeColor="Purple" ID="lblUsers" runat="server" Text="0"></asp:Label></h1>
                    <span class="dashboard-title">Users</span><br />
                    <a href="UserManagement.aspx">
                        <button type="button" class="btn-view">View All</button>
                    </a>
                </div>

                <div class="dashboard" id="materialMgtPanel" runat="server">
                    <h1><asp:Label ForeColor="Purple" ID="lblMatreials" runat="server" Text="0"></asp:Label></h1>
                    <span class="dashboard-title">Materials</span><br />
                    <a href="MaterialManagement.aspx">
                        <button type="button" class="btn-view">View All</button>
                    </a>
                </div>

                <div class="dashboard" id="reportsPanel" runat="server">
                    <h1>
                        <asp:Label ForeColor="Purple" ID="Label3" runat="server" Text=" "></asp:Label>
                        <asp:Label ForeColor="Purple" ID="Label4" runat="server" Text=" "></asp:Label>
                    </h1>
                    <span class="dashboard-title">Reports Viewer</span><br />
                    <a href="ReportsViewer.aspx">
                        <button type="button" class="btn-view">Reports Console</button>
                    </a>
                </div>
            </div>
        </div>
    </form>

    <footer class="footer">
        <div class="wrapper">
            <p>&copy; Recycle Management System. All rights reserved 2024.</p>
        </div>
    </footer>
</body>
</html>
