<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/admin.Master" AutoEventWireup="true" CodeBehind="reportdepart.aspx.cs" Inherits="WebApplication2.ADMIN.reportdepart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Maincontent" runat="server">
       <form id="form1" runat="server">
           <h3><b><u>Report - DEPARTURE AIRPORT</u></b></h3>
           <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
           <asp:Button ID="Button1" runat="server" Text="Generate Report" OnClick="Button1_Click" />
           &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="idproof" HeaderText="IDPROOF" ReadOnly="True" SortExpression="idproof" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="airname" HeaderText="Aircraft" ReadOnly="True" SortExpression="airname" />
                <asp:BoundField DataField="depat" HeaderText="Departure" ReadOnly="True" SortExpression="depat" />
                <asp:BoundField DataField="arrival" HeaderText="Arrival" ReadOnly="True" SortExpression="arrival" />
                <asp:BoundField DataField="date" HeaderText="DoT" ReadOnly="True" SortExpression="date" />
                <asp:BoundField DataField="time" HeaderText="ToT" ReadOnly="True" SortExpression="time" />
            </Columns>
        </asp:GridView>
           <asp:HiddenField ID="HiddenField1" runat="server" />
         </form>
</asp:Content>
