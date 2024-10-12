<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecycleManagementDesk.aspx.cs" Inherits="RecycleManager.RecycleManagementDesk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recycle Admin</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>  
</head>
<body>
    <header class="header">
    <div class="wrapper">
        <h1>Recycle Management Desk</h1>
    </div>  
 </header>      
           <div >           
            <div style="color:purple">
                <h3>Dashboard</h3>
                
                <div >
                    <table width="500" ><tr><td width="25%">
                    <div  class="dashboard">
                         <h1>
                             <asp:Label ForeColor="Purple" ID="lblUsers" runat="server" Text="0"></asp:Label>
                         </h1>
                        <span class="dashboard-title">Users</span><br />
                        <a href="UserManagement.aspx">
                            <button type="button" class="btn-view"  >View All</button>
                        </a>
                    </div>
                    </td><td width="25%">
                    <div id="divVehicleMgt" class="dashboard" runat="server" >
                         <h1>
                             <asp:Label ForeColor="Purple" ID="lblVehicles" runat="server" Text="0"></asp:Label>
                         </h1>
                        <span class="dashboard-title">Vehicles</span><br />
                        <a href="VehiclesManagement.aspx">
                            <button type="button"  class="btn-view">View All</button>
                        </a>
                    </div>
                       <%-- </td><td width="40%">--%>
                    <div  class="dashboard">
                        
                        <h1> <asp:Label ForeColor="Purple" ID="Label1" runat="server" Text=" "></asp:Label>
                             <asp:Label ForeColor="Purple" ID="Label2" runat="server" Text=" "></asp:Label>
                        </h1>
                        <span class="dashboard-title">Data Management</span><br />
                        <a href="DataManagement.aspx">
                            <button type="button"   class="btn-view">Data Entry Console</button>
                        </a>
                    </div>

                    </td>




                                        </tr>
                    </table>

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
