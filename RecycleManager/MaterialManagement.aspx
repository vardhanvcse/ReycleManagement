<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialManagement.aspx.cs" Inherits="RecycleManager.MaterialManagement" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recycle Admin</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />   
</head>
<body>
    <header class="header">
    <div class="wrapper">
        <h1>Recycle Management Desk</h1>
    </div>  
 </header>   
    <form id="form2" runat="server" class="welcome-container" style="padding: 50px; background-color: #f0f8ff; border-radius: 10px;">
   <div>  
          <table><tr><td>
               <a href="RecycleManagementDesk.aspx" style="margin:50px;zoom:1" class="top-right">
                    <i class="fas fa-home"></i> 
                </a>
                </td><td /><td>                        
         <div class="dropdown"> 
            <asp:Button ID="btnLogin" Width="80px"  runat="server" CssClass="login-button" Text="Log Out"  />
            <div class="dropdown-content">       
                <a href="SignOut.aspx">Sign Out</a>
            </div>                       
        </div>
        </td></tr></table>
    </div>

       <div class="main">
       <div class="wrapper">
           <div class="register-material">
               <h2>Material Management</h2>                 
                 
               <h3 style="align-content:center">All Materials</h3>
               <a href="AddMaterial.aspx">
                    <button type="button">Add Material</button>
                </a>
               <asp:GridView ID="GVMaterials" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="material_id" DataSourceID="sdsMaterials" ForeColor="#333333" GridLines="None" Width="1158px">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   <Columns>
                       <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                       <asp:BoundField DataField="material_id" HeaderText="material_id" InsertVisible="False" ReadOnly="True" SortExpression="material_id" />
                       <asp:BoundField DataField="material_name" HeaderText="material_name" SortExpression="material_name" />
                       <asp:BoundField DataField="material_description" HeaderText="material_description" SortExpression="material_description" />
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
               <asp:SqlDataSource ID="sdsMaterials" runat="server" ConnectionString="<%$ ConnectionStrings:RecycleSystemConnection %>" DeleteCommand="DELETE FROM dbo.[material] WHERE [material_id] = @material_id" InsertCommand="INSERT INTO dbo.[material] ([material_id], [material_name], [material_description]) VALUES (@material_id, @material_name, @material_description)" SelectCommand="SELECT [material_id], [material_name], [material_description] FROM dbo.[material] ORDER BY [material_id] DESC" UpdateCommand="UPDATE  dbo.[material] SET [material_name] = @material_name, [material_description] = @material_description WHERE [material_id] = @material_id">
                   <DeleteParameters>
                       <asp:Parameter Name="material_id" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="material_id" Type="String" />
                       <asp:Parameter Name="material_name" Type="String" />
                       <asp:Parameter Name="material_description" Type="String" />                                           
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="material_name" Type="String" />
                          <asp:Parameter Name="material_description" Type="String" />
                          <asp:Parameter Name="material_id" Type="String" />                    
                   </UpdateParameters>
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
