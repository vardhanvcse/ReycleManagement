<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="RecycleManager.UserManagement" %>

<html>
<head runat="server">
    <title>Recycle Manager</title>
     <link rel="stylesheet" type="text/css" href="css/style.css"/>   
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />   
</head>
<body>
      <header class="header">
          <div class="wrapper">
              <h1>Recycle Management System</h1>
          </div>  
       </header>   

      <form id="form1" runat="server" class="welcome-container" style="padding: 50px; background-color: #f0f8ff; border-radius: 10px;">
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
              <div class="register-user">
                  <h2>User Management</h2>                 
                    
                  <h3 style="align-content:center">All Users</h3>
                  <a href="AddUser.aspx">
                       <button type="button">Add User</button>
                   </a>
                  <asp:GridView ID="GVUsers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="user_id" DataSourceID="sdsUsers" ForeColor="#333333" GridLines="None" Width="1158px">
                      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                          <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                          <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                          <asp:BoundField DataField="user_mail_id" HeaderText="user_mail_id" SortExpression="user_mail_id" />
                          <asp:BoundField DataField="phone_num" HeaderText="phone_num" SortExpression="phone_num" />
                          <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />                   
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
                  <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:RecycleSystemConnection %>" DeleteCommand="DELETE FROM dbo.[user] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO dbo.[user] ([user_name], [user_mail_id], [phone_num], [address]) VALUES (@user_name, @user_mail_id, @phone_num, @address)" SelectCommand="SELECT [user_id], [user_name], [user_mail_id], [phone_num], [address] FROM dbo.[user] ORDER BY [user_id] DESC" UpdateCommand="UPDATE  dbo.[user] SET [user_name] = @user_name, [user_mail_id] = @user_mail_id, [phone_num] = @phone_num, [address] = @address WHERE [user_id] = @user_id">
                      <DeleteParameters>
                          <asp:Parameter Name="user_id" Type="Int32" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="user_name" Type="String" />
                          <asp:Parameter Name="user_mail_id" Type="String" />
                          <asp:Parameter Name="phone_num" Type="String" />
                          <asp:Parameter Name="address" Type="String" />                         
                      </InsertParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="user_name" Type="String" />
                             <asp:Parameter Name="user_mail_id" Type="String" />
                             <asp:Parameter Name="phone_num" Type="String" />
                             <asp:Parameter Name="address" Type="String" />   
                          <asp:Parameter Name="user_id" Type="Int32" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
              </div>
              
          </div>
      </div>
      <!--Main Body Ends HERE-->
  </form>


    <footer class="footer" style="height:50px">
    <div class="wrapper" >
        <p>&copy; Recycle Management System. All rights reserved 2024.</p>
    </div>
</footer>
</body>
</html>
