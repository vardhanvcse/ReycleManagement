<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="RecycleManager.AddVehicle" %>

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
          <asp:TextBox ID="txtYear" runat="server" TextMode="Number" placeholder="Make Year"></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate ="txtYear" runat="server" ErrorMessage="*" ForeColor="Red" Text="Add Make year for Vehicle" /><br />
                    
          <span class="name">Make</span>
          <asp:TextBox ID="txtMake" runat="server" placeholder="Vehicle Make"></asp:TextBox> 
          <asp:RequiredFieldValidator ControlToValidate ="txtMake" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Vehicle Make" /><br />
           
          <span class="name">Model</span>
          <asp:TextBox ID="txtModel" runat="server" placeholder="Vehicle Model"></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate ="txtModel" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Vehicle Model" /><br />
          
          <span class="name">Purchase Date</span>
          <asp:TextBox ID="txtPurchaseDate" runat="server" placeholder="Vehicle Purchase Date" TextMode="Date"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ControlToValidate ="txtPurchaseDate" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Vehicle Purchase Date" /><br />          
        <span class="name">Starting Milage</span>
        <asp:TextBox ID="txtStartingMilageGallon" TextMode="Number" runat="server" placeholder="Starting Milage per Gallon"></asp:TextBox><br />
        <asp:RequiredFieldValidator ControlToValidate ="txtStartingMilageGallon" runat="server" ErrorMessage="*" ForeColor="Red" Text="Missing Starting Milage per Gallon" /><br />
             
        <span class="name">Vehicle Weight</span>
       <asp:DropDownList ID="ddlVehicleWeight" runat="server" Height="28px" Width="300px" />                      
       <br /><br />
          
        <span class="name">Vehicle Type</span>
        <asp:DropDownList ID="ddlVehicleType" runat="server" Height="28px" Width="300px" />                      
        <br />
          <br />
        <span class="name">Vehicle Class</span>
        <asp:DropDownList ID="ddlVehicleClass" runat="server" Height="28px" Width="300px" />                      
        <br /> <br />

           <span class="name">Exempt (Law Enforcement or > 8,500 pounds)</span>
           <asp:CheckBox ID="chkIsExcemptOfLawEnforcement" runat="server" />
          <br /><br />
           <asp:Button ID="btnAddVehicle" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddVehicle_Click" Text="Add Vehicle" Width="111px" />
            <br />

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
