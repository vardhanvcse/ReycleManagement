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
     <nav class="menu">
     <div class="wrapper">
         <ul >
             <a href="ResourceManagement.aspx"><li>Resource Management</li></a>
             <a href="WasteManagement.aspx"><li>Waste Management</li></a>
             <a href="RevenueManagement.aspx"><li>RevenueManagement</li></a>
             <a href="Reports.aspx"><li>Reports</li></a>            
         </ul>
     </div>
 </nav>
    <form id="form1" runat="server">
          <div>
            <h1>Resource & Waste Management System</h1>

            <h2>Resource Maintenance System</h2>
            <p>- Manage users and access</p>
            <p>- Oversee recycling center operations: employee details, vehicle management, and maintenance costs</p>

            <h2>Waste Management</h2>
            <p>- Categorize and track waste materials</p>
            <p>- Monitor daily trash input and stock levels with checkpoints</p>

            <h2>Revenue Management</h2>
            <p>- Track cash flow and revenue from trash sales</p>
            <p>- Update financial checkpoints for accurate revenue tracking</p>

            <h2>Reports</h2>
            <p>- Generate monthly reports on waste types, total weights, and recycling rates</p>
        </div>
    </form>
      <footer class="footer" style="height:50px">
          <div class="wrapper" >
              <p>&copy; Recycle Management System. All rights reserved 2024.</p>
          </div>
  </footer>
</body>
</html>
