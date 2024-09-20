﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="RecycleManager.AddVehicle" %>

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
           <script type="text/javascript">
            function showCalendar() {
                document.getElementById('calendarContainer').style.display = 'block';
            }

            function closeCalendar() {
                document.getElementById('calendarContainer').style.display = 'none';
            }
    </script>
       </header>   

        <div class="main">
        <div class="wrapper">           
              <div class="useradd-details">
      <form id="form1" runat="server">
      <h3>Add Vehicle</h3>          
          <br />
          <asp:Label ID="lblResult" runat="server" Text=""></asp:Label><br/>
          <span class="name">Vehicle Id</span>
          <asp:Label ID="txtVehicleId" runat="server" Width="350px" placeholder="User Name"></asp:Label><br /><br />
          <span class="name">Year</span>
          <asp:TextBox ID="txtYear" runat="server" placeholder="Make Year"></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate ="txtYear" runat="server" ErrorMessage="*" ForeColor="Red" Text="Add Make year for Vehicle" /><br />
                    
          <span class="name">Make</span>
          <asp:TextBox ID="txtMake" runat="server" placeholder="Vehicle Make"></asp:TextBox> 
          <asp:RequiredFieldValidator ControlToValidate ="txtMake" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Vehicle Make" /><br />
           
          <span class="name">Model</span>
          <asp:TextBox ID="txtModel" runat="server" placeholder="Vehicle Model"></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate ="txtModel" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Vehicle Model" /><br />
          
          <span class="name">Purchase Date</span>
          <asp:TextBox ID="txtPurchaseDate" runat="server" placeholder="Vehicle Purchase Date" onfocus="showCalendar()"></asp:TextBox>
           <div id="calendarContainer">
             <asp:Calendar runat="server" OnSelectionChanged="Unnamed_SelectionChanged" ID="cldPurchaseDate" />
                 <br />
                <!-- Close Button -->
                <span class="close-btn" onclick="closeCalendar()">Close</span>
               </div>
           <br />
          <asp:RequiredFieldValidator ControlToValidate ="txtPurchaseDate" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Vehicle Purchase Date" /><br />
          
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
