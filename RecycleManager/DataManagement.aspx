<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataManagement.aspx.cs" Inherits="RecycleManager.DataManagement" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />   
    <link type="text/css" href="css/data_management_multiviews.css" rel="stylesheet" />   
</head>
<body>
    <header class="header">
        <div class="wrapper">
            <h1>Recycle Management System</h1>
        </div>
    </header>

    <div class="main" style="padding: 50px;">
        <div class="wrapper">           
            <div class="useradd-details">

                <form id="form1" runat="server">      
                    <div>  
                        <table><tr><td>
                            <a href="RecycleManagementDesk.aspx" style="margin:50px;" class="top-right">
                                <i class="fas fa-home"></i> 
                            </a>
                        </td><td /><td> 
                                 <div class="dropdown">
                                     <asp:Button ID="btnLogOut"  style="border-radius: 10px;background-color: royalblue;color:white" Width="80px" runat="server" OnClick="btnLogOut_Click"  CssClass="login-button" Text="Log Out"  />
                                 </div>
                        </td></tr></table>
                    </div>
                    <table width="100%" align="center">
                        <tr>
                            <td>
                          <asp:Button Text="Vehicle Maintenance Details" BorderStyle="None" ID="VehicleMaintainanceDetails" runat="server"
                                OnClick="VehicleMaintainanceDetails_Click" CssClass="gray-button" />
                            <asp:Button Text="Material Waste Collection" BorderStyle="None" ID="RecyclingCollectionDeatils" runat="server"
                                OnClick="RecyclingCollectionDeatils_Click" CssClass="gray-button" />
                            <asp:Button Text="Recycle Revenue" BorderStyle="None" ID="RecyclingRevenue" runat="server"
                                OnClick="RecyclingRevenue_Click" CssClass="gray-button" />
                            <asp:Button Text="Land Fill Expense" BorderStyle="None" ID="LandFillExpenses" runat="server"
                                OnClick="LandFillExpenses_Click" CssClass="gray-button" />
                                <asp:MultiView ID="MainView" runat="server">
                                    <asp:View ID="View1" runat="server">
                                        <table class="form-table">
                                            <tr>
                                                <td>
                                                    <h3>Add Vehicle Maintenance Expenses</h3>
                                                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <label for="txtDate" class="name">Date</label>
                                                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                                    <br /><br />
                                                    
                                                    <label for="ddlVehicleIds" class="name">Vehicle</label>
                                                    <asp:DropDownList ID="ddlVehicleIds" runat="server" Width="350px"></asp:DropDownList>
                                                    <br /><br />
                                                    
                                                    <label for="txtCurrentMilage" class="name">Current Mileage</label>
                                                    <asp:TextBox ID="txtCurrentMilage" runat="server" TextMode="Number" Width="350px" CausesValidation="false" placeholder="Current Mileage"></asp:TextBox>
                                                    <br /><br />

                                                    <label for="txtFuelUse" class="name">Fuel Use</label>
                                                    <asp:TextBox ID="txtFuelUse" runat="server" CausesValidation="false" TextMode="Number" placeholder="Fuel Use Gallons"></asp:TextBox>
                                                    <br /><br />
                                                    
                                                    <label for="txtFuelCost" class="name">Fuel Cost</label>
                                                    <asp:TextBox ID="txtFuelCost" runat="server" CausesValidation="false" TextMode="Number" placeholder="Fuel Cost $"></asp:TextBox>
                                                    <br /><br /> 
                                                    
                                                    <label for="txtMaintainanceCosts" class="name">Maintenance Cost</label>
                                                    <asp:TextBox ID="txtMaintainanceCosts" runat="server" CausesValidation="false" TextMode="Number" placeholder="Maintenance Cost $"></asp:TextBox>
                                                    <br /><br />
                                                    
                                                    <asp:Button ID="btnAddVehicleMaintainance" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddVehicleMaintainance_Click" Text="Add Vehicle Maintenance" Width="175px" />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>

                                    <asp:View ID="View2" runat="server">
                                        <table class="form-table">
                                            <tr>
                                                <td>
                                                    <h3>Material Waste Collection</h3>
                                                    <asp:Label ID="lblRecycleCollectionResult" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    
                                                    <label for="txtCollectionDate" class="name">Date</label>
                                                    <asp:TextBox ID="txtCollectionDate" width="170px"  runat="server" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                                    <br /><br />
                                                    
                                                    <label for="ddlMaterialWate" class="name">Material Waste</label>
                                                    <asp:DropDownList ID="ddlMaterialWate" runat="server" Width="350px"></asp:DropDownList>
                                                    <br /><br />
                                                    
                                                    <label for="txtFoodWasteWeight" class="name">Weight of Material Waste(lbs)</label>
                                                    <asp:TextBox ID="txtFoodWasteWeight" TextMode="Number" Width="350px" Step="0.1" CausesValidation="false" placeholder="Weight of Waste in lbs" runat="server" />
                                                    <br /><br />                                                    
                                                    <asp:Button ID="btnAddMaterialWasteCollectionDetails" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddMaterialWasteCollectionDetails_Click" Text="Add Material Collection" Width="175px" />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>

                                   <asp:View ID="View3" runat="server">
                                        <table class="form-table" style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                            <tr>
                                                     <td>
                                                        <h3>Recycle Renue</h3><br />
                                                           <asp:Label ID="lblRecycleRevenue" Visible="true" Width="100%" runat="server" Text=""></asp:Label>
                                                            <br />
            
                                                           <label for="txtRecycleRevenueSaleDate" class="name">Sale Date</label>
                                                            <asp:TextBox ID="txtRecycleRevenueSaleDate" runat="server" width="170px" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                                            <br /><br />

                                                            <label for="ddlRecycleRevenueMaterial" class="name">Material Type</label>
                                                            <asp:DropDownList ID="ddlRecycleRevenueMaterial" runat="server" Width="350px"></asp:DropDownList>
                                                            <br /><br />

                                                            <label for="txtRecycleRevenueWeightOfMaterialSoldlbs" class="name">Weight of Material Sold(lbs)</label>
                                                            <asp:TextBox ID="txtRecycleRevenueWeightOfMaterialSoldlbs" TextMode="Number" Step="0.1" Width="350px"  CausesValidation="false" placeholder="Weight Of Material Sold in lbs"  runat="server" />
                                                            <br /><br />
                                                            <br /><br />
                                                            <label for="txtRevenueInDollars" class="name">Revenue of Sale(in $)</label>
                                                            <asp:TextBox ID="txtRevenueInDollars" TextMode="Number" Width="350px"  Step="0.1"  CausesValidation="false" placeholder="Revenue of sale in Dollars"  runat="server" />
                                                            <br /><br />
                                                            <br />
                                                            <label for="txtBuyer" class="name">Buyer</label>
                                                            <asp:TextBox ID="txtBuyer" Width="350px"  CausesValidation="false" placeholder="Buyer of the Material Waste"  runat="server" />
                                                            <br /><br />
                                                            <asp:Button ID="btnRecycleRevenue" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnRecycleRevenue_Click" Text="Add Recycle Revenue" Width="175px" />
                                                            <br /> 
                                                    </td>                             
                                            </tr>
                                        </table>
                                    </asp:View>

                                    <asp:View ID="View4" runat="server">
                                        <table class="form-table" style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                            <tr>
                                                     <td>
                                                        <h3>Land Fill Expense</h3><br />
                                                              <asp:Label ID="lblLandFillExpense" Visible="true" Width="100%" runat="server" Text=""></asp:Label>
                                                              <br />                                
                                                            <span class="name">Land Fill Date</span>
                                                            <asp:TextBox ID="txtLandFillDate" runat="server" width="170px" TextMode="Date" CausesValidation="false" placeholder="Date"></asp:TextBox>
                                                            <br /><br />                                               

                                                            <span class="name">Land Fill Weight(lbs)</span>
                                                            <asp:TextBox ID="txtLandFillWeight" TextMode="Number" Step="0.1" Width="350px"  CausesValidation="false" placeholder="Weight Of Land Fill Waste lbs"  runat="server" />
                                                            <br /><br />
                                                            <br /><br />
                                                            <span class="name">Landfill Expense(in $)</span>
                                                            <asp:TextBox ID="txtLandFillExpense" TextMode="Number" Step="0.1" Width="350px"  CausesValidation="false" placeholder="Landfill Expense Spent($)"  runat="server" />
                                                            <br /><br />
                                                            <br />
                                                            <span class="name">Hauler</span>
                                                            <asp:TextBox ID="txtLandFillHauler" Width="350px"  CausesValidation="false" placeholder="Hauler Information"  runat="server" />
                                                            <br /><br />                                    
                     
                                                            <asp:Button ID="btnAddLandFillExpense" runat="server" BackColor="#000066" BorderColor="#000066" ForeColor="White" Height="34px" OnClick="btnAddLandFillExpense_Click" Text="Add Land Fill Expense" Width="175px" />
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
            </div>
        </div>
    </div>
    <footer class="footer" style="height:50px">
        <div class="wrapper">
            <p>&copy; Recycle Management System. All rights reserved 2024.</p>
        </div>
    </footer>
</body>
</html>