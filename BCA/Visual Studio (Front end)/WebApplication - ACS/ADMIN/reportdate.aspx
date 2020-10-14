<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/admin.Master" AutoEventWireup="true" CodeBehind="reportdate.aspx.cs" Inherits="WebApplication2.ADMIN.reportdate" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Maincontent" runat="server">
    <h3><b><u>Report - DATE</u></b></h3>
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox1">
        </asp:CalendarExtender>
        <asp:Button ID="Button1" runat="server" Text="Generate Report" OnClick="Button1_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
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
