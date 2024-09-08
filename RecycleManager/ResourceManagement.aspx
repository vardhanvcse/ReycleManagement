<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourceManagement.aspx.cs" Inherits="RecycleManager.ResourceManagement" %>

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
     <nav class="menu">
        <div class="wrapper">
        <ul>
            <a href="ResourceManagement.aspx"><li>Resource Management</li></a>
            <a href="WasteManagement.aspx"><li>Waste Management</li></a>
            <a href="RevenueManagement.aspx"><li>RevenueManagement</li></a>
            <a href="Reports.aspx"><li>Reports</li></a>            
        </ul>
    </div>
 </nav>   

  <form id="form2" runat="server">  
      <table width="80%" align="center">
        <tr>
          <td>
            <asp:Button Text="Employee Management" BorderStyle="None" ID="TabEmployeeManagement" CssClass="Initial" runat="server"
                OnClick="TabEmployeeManagement_Click" />
            <asp:Button Text="Vehicle Management" BorderStyle="None" ID="TabVehicleManagement" CssClass="Initial" runat="server"
                OnClick="TabVehicleManagement_Click" />           
            <asp:MultiView ID="MainView" runat="server">
              <asp:View ID="View1" runat="server">
                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                  <tr>
                    <td>
                      <h3>
                        <span>
                            <asp:Panel runat="server">
                                <asp:Label runat="server"> Employee Management</asp:Label>
                            </asp:Panel>
                        </span>
                      </h3>
                    </td>
                  </tr>
                </table>
              </asp:View>
              <asp:View ID="View2" runat="server">
                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                  <tr>
                    <td>
                      <h3>
                          <span>
                                <asp:Panel runat="server">
                                    <asp:Label runat="server"> Vehicle Management</asp:Label>
                                </asp:Panel></span>
                      </h3>
                    </td>
                  </tr>
                </table>
              </asp:View>
              <asp:View ID="View3" runat="server">
                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                  <tr>
                    <td>
                      <h3>
                        View 3
                      </h3>
                    </td>
                  </tr>
                </table>
              </asp:View>
            </asp:MultiView>
          </td>
        </tr>
      </table>
</form>

      <footer class="footer" style="height:50px">
          <div class="wrapper" >
              <p>&copy; Recycle Management System. All rights reserved 2024.</p>
          </div>
  </footer>
</body>
</html>
