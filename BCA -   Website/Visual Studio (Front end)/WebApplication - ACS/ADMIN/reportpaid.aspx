

<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/admin.Master" AutoEventWireup="true" CodeBehind="reportpaid.aspx.cs" Inherits="WebApplication2.ADMIN.reportpaid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Maincontent" runat="server">
     <form id="form1" runat="server">
         <h3><b><u>Report - PAID</u></b></h3>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="idproof" HeaderText="IDPROOF" ReadOnly="True" SortExpression="idproof" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="airname" HeaderText="Aircraft" ReadOnly="True" SortExpression="airname" />
                <asp:BoundField DataField="depat" HeaderText="Departure" ReadOnly="True" SortExpression="depat" />
                <asp:BoundField DataField="arrival" HeaderText="Arrival" ReadOnly="True" SortExpression="arrival" />
                <asp:BoundField DataField="date" HeaderText="DoT" ReadOnly="True" SortExpression="date" />
            </Columns>
        </asp:GridView>

         <asp:HiddenField ID="HiddenField1" runat="server" />
         </form>
</asp:Content>
