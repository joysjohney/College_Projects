<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="status.aspx.cs" Inherits="WebApplication2.status" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h3><b><u>HISTORY</u></b></h3>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="idproof" HeaderText="IDPROOF" ReadOnly="True" SortExpression="idproof" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="airname" HeaderText="Aircraft" ReadOnly="True" SortExpression="airname" />
                <asp:BoundField DataField="depat" HeaderText="Departure" ReadOnly="True" SortExpression="depat" />
                <asp:BoundField DataField="arrival" HeaderText="Arrival" ReadOnly="True" SortExpression="arrival" />
                <asp:BoundField DataField="date" HeaderText="DoT" ReadOnly="True" SortExpression="date" />
                <asp:BoundField DataField="time" HeaderText="ToT" ReadOnly="True" SortExpression="time" />
                <asp:BoundField DataField="total" HeaderText="Amount" ReadOnly="True" SortExpression="total" />
                <asp:BoundField DataField="status" HeaderText="Status" ReadOnly="True" SortExpression="status" />
                <asp:BoundField DataField="userid" HeaderText="UserID" ReadOnly="True" SortExpression="userid" />
            </Columns>
        
        </asp:GridView> <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
        <div class="form-group">
                                           
       <asp:Button ID="Button1" class="btn btn-default" runat="server"  Text="VIEW HISTORY" OnClick="Button1_Click" BackColor="White" BorderColor="#666666" BorderStyle="None" ForeColor="#000066" Font-Bold="True"  />
                                 
                                    </div>
    </form>
</body>
</html>
