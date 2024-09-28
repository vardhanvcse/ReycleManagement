<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataManagement.aspx.cs" Inherits="RecycleManager.DataManagement" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <header class="header">
        <div class="wrapper">
            <h1>Recycle Management System</h1>
        </div>
    </header>
    <div class="main">
    <div class="wrapper">           
    <div class="useradd-details">
    <form id="form1" runat="server" style="background-color:white">
        <table width="100%" align="center">
            <tr>
                <td>
                    <asp:Button Text="Vehicle Maintenance Details" BorderStyle="None" ID="VehicleMaintainanceDetails" runat="server"
                        OnClick="VehicleMaintainanceDetails_Click" style="background-color:lightgray" />
                    <asp:Button Text="Material Waste Collection" BorderStyle="None" ID="RecyclingCollectionDeatils" runat="server"
                        OnClick="RecyclingCollectionDeatils_Click" style="background-color:lightgray" />
                    <asp:Button Text="Tab 3" BorderStyle="None" ID="Tab3" runat="server"
                        OnClick="Tab3_Click" style="background-color:lightgray" />
                    
                    <asp:MultiView ID="MainView" runat="server">
                        <asp:View ID="View1" runat="server">
                            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                <tr>
                                    <td>
                                        <h3>Add Vehicle Maintenance Expenses</h3>
                                        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                                        <br />
                                        
                                        <span class="name">Date</span>
                                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                        <br /><br />

                                        <span class="name">Vehicle</span>
                                        <asp:DropDownList ID="ddlVehicleIds" runat="server" Width="350px"></asp:DropDownList>
                                        <br /><br />

                                        <span class="name">Current Mileage</span>
                                        <asp:TextBox ID="txtCurrentMilage" runat="server" TextMode="Number" Width="350px" CausesValidation="false" placeholder="Current Mileage"></asp:TextBox>
                                        <br /><br /><br />
                                        <span class="name">Fuel Use</span>
                                        <asp:TextBox ID="txtFuelUse" runat="server" CausesValidation="false" TextMode="Number"  placeholder="Fuel Use Gallons"></asp:TextBox>
                                        <br /><br />
                                        
                                        <span class="name">Fuel Cost</span>
                                        <asp:TextBox ID="txtFuelCost" runat="server" CausesValidation="false" TextMode="Number" placeholder="Fuel Cost $"></asp:TextBox>
                                        <br /><br /> 

                                         <span class="name">Maintainance Cost Dollars</span>
                                         <asp:TextBox ID="txtMaintainanceCosts" runat="server" CausesValidation="false" TextMode="Number" placeholder="Maintainance Cost $"></asp:TextBox>
                                         <br /><br /> 
                                        <asp:Button ID="btnAddVehicleMaintainance" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddVehicleMaintainance_Click" Text="Add Vehicle Maintainance" Width="175px" />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>

                        <asp:View ID="View2" runat="server">
                            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                <tr>
                                    <td>
                                        <h3>Material Waste Collection</h3>
                                           <asp:Label ID="lblRecycleCollectionResult" runat="server" Text=""></asp:Label>
                                            <br />
                                            
                                            <span class="name">Date</span>
                                            <asp:TextBox ID="txtCollectionDate" runat="server" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                            <br /><br />

                                            <span class="name">Material Waste</span>
                                            <asp:DropDownList ID="ddlMaterialWate" runat="server" Width="350px"></asp:DropDownList>
                                            <br /><br />

                                            <span class="name">Weight of Material Waste(lbs)</span>
                                            <asp:TextBox ID="txtFoodWasteWeight" TextMode="Number" Width="350px"  CausesValidation="false" placeholder="Food Waste Weight in lbs"  runat="server" />
                                            <br /><br />

                                            <asp:Button ID="btnAddMaterialWasteCollectionDetails" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddMaterialWasteCollectionDetails_Click" Text="Add Material Collection" Width="175px" />
                                            <br /> 
                                    </td>
                                </tr>
                            </table>
                        </asp:View>

                        <asp:View ID="View3" runat="server">
                            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                <tr>
                                    <td>
                                        <h3>View 3</h3>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    </form>
        </div></div></div>
    <footer class="footer" style="height:50px">
        <div class="wrapper">
            <p>&copy; Recycle Management System. All rights reserved 2024.</p>
        </div>
    </footer>
</body>
</html>