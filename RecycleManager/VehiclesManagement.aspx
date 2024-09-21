<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehiclesManagement.aspx.cs" Inherits="RecycleManager.VehiclesManagement" %>
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
    <div class="main">
        <div class="wrapper">
            <div class="register-user">
                <h2>Vehicle Management</h2>   
                <h3 style="align-content:center">All Vehicles</h3>
                <a href="AddVehicle.aspx">
                     <button type="button">Add Vehicle</button>
                 </a>
                <asp:GridView ID="GVVehicles" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="vehicle_id" DataSourceID="sdsVehicles" ForeColor="#333333" GridLines="None" Width="1158px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="False" />
                        <asp:BoundField DataField="vehicle_id" HeaderText="vehicle id" InsertVisible="False" ReadOnly="True" SortExpression="vehicle_id" />
                       <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
                        <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                        <asp:BoundField DataField="weight_desc" HeaderText="weight_desc" SortExpression="weight_desc" />
                        <asp:BoundField DataField="vehicle_class" HeaderText="vehicle_class" SortExpression="vehicle_class" />
                        <asp:BoundField DataField="vehicle_type" HeaderText="vehicle_type" SortExpression="vehicle_type" />
                        <asp:BoundField DataField="weight_text" HeaderText="weight_text" SortExpression="weight_text" />                   
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsVehicles" runat="server" ConnectionString="<%$ ConnectionStrings:RecycleSystemConnection %>" DeleteCommand="DELETE FROM dbo.[Vehicle] WHERE [vehicle_id] = @vehicle_id"  SelectCommand="exec Vehicle_Get ''">
                    <DeleteParameters>
                        <asp:Parameter Name="vehicle_id" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
            
        </div>
    </div> 
</form>
    <footer class="footer" style="height:50px">
    <div class="wrapper" >
        <p>&copy; Recycle Management System. All rights reserved 2024.</p>
    </div>
</footer>
</body>
</html>
