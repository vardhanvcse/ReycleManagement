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
                    <asp:Button Text="Recycle Revenue" BorderStyle="None" ID="RecyclingRevenue" runat="server"
                        OnClick="RecyclingRevenue_Click" style="background-color:lightgray" />
                    <asp:Button Text="Land Fill Expense" BorderStyle="None" ID="LandFillExpenses" runat="server"
                        OnClick="LandFillExpenses_Click" style="background-color:lightgray" />
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
                                        <br />
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
                                            <h3>Recycle Renue</h3><br />
                                               <asp:Label ID="lblRecycleRevenue" Visible="true" Width="100%" runat="server" Text=""></asp:Label>
                                                <br />
                                    
                                                <span class="name">Sale Date</span>
                                                <asp:TextBox ID="txtRecycleRevenueSaleDate" runat="server" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                                <br /><br />

                                                <span class="name">Material Type</span>
                                                <asp:DropDownList ID="ddlRecycleRevenueMaterial" runat="server" Width="350px"></asp:DropDownList>
                                                <br /><br />

                                                <span class="name">Weight of Material Sold(lbs)</span>
                                                <asp:TextBox ID="txtRecycleRevenueWeightOfMaterialSoldlbs" TextMode="Number" Width="350px"  CausesValidation="false" placeholder="Weight Of Material Sold in lbs"  runat="server" />
                                                <br /><br />
                                                <br /><br />
                                                <span class="name">Revenue of Sale(in $)</span>
                                                <asp:TextBox ID="txtRevenueInDollars" TextMode="Number" Width="350px"  CausesValidation="false" placeholder="Revenue of sale in Dollars"  runat="server" />
                                                <br /><br />
                                                <br />
                                                <span class="name">Buyer</span>
                                                <asp:TextBox ID="txtBuyer" Width="350px"  CausesValidation="false" placeholder="Buyer of the Material Waste"  runat="server" />
                                                <br /><br />
                                                <asp:Button ID="btnRecycleRevenue" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnRecycleRevenue_Click" Text="Add Recycle Revenue" Width="175px" />
                                                <br /> 
                                        </td>                             
                                </tr>
                            </table>
                        </asp:View>

                        <asp:View ID="View4" runat="server">
                            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                <tr>
                                         <td>
                                            <h3>Land Fill Expense</h3><br />
                                                  <asp:Label ID="lblLandFillExpense" Visible="true" Width="100%" runat="server" Text=""></asp:Label>
                                                  <br />                                
                                                <span class="name">Land Fill Date</span>
                                                <asp:TextBox ID="txtLandFillDate" runat="server" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                                <br /><br />                                               

                                                <span class="name">Land Fill Weight(lbs)</span>
                                                <asp:TextBox ID="txtLandFillWeight" TextMode="Number" Width="350px"  CausesValidation="false" placeholder="Weight Of Land Fill Waste lbs"  runat="server" />
                                                <br /><br />
                                                <br /><br />
                                                <span class="name">Landfill Expense(in $)</span>
                                                <asp:TextBox ID="txtLandFillExpense" TextMode="Number" Width="350px"  CausesValidation="false" placeholder="Landfill Expense Spent($)"  runat="server" />
                                                <br /><br />
                                                <br />
                                                <span class="name">Hauler</span>
                                                <asp:TextBox ID="txtLandFillHauler" Width="350px"  CausesValidation="false" placeholder="Buyer of the Material Waste"  runat="server" />
                                                <br /><br />                                    
                                             
                                                <asp:Button ID="btnAddLandFillExpense" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddLandFillExpense_Click" Text="Add Recycle Revenue" Width="175px" />
                                                <br /> 
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