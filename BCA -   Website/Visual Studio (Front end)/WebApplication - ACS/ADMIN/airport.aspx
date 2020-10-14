<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="airport.aspx.cs" Inherits="WebApplication2.admin.airport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
          function validate() {
            var type_name = document.getElementById("Maincontent_TextBox2").value;
            if (type_name.trim() == "") {
                document.getElementById("Maincontent_TextBox2").focus();
                alert("Airport Name is Mandatory");
                return false;
            }
          }
          function Validatealphabet(e) {
              var valid = ((e.which >= 65 && e.which <= 90) || (e.which == 8) || (e.which == 32) || (e.which >= 97 && e.which <= 122));
              if (!valid) {
                  alert("Invalid  character");
                  e.preventDefault();
              }
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Maincontent" runat="server">
    <form runat="server" id="form1">
    <div class="panel panel-default">
   
        <h2><b><u>AIRPORTS</u></b></h2>
        <asp:HiddenField ID="HiddenField1" runat="server" />
         <div class="panel-body">
                    <div class="row" style="background-image: url('assets/img/pic/air.jpg')">
                         <div class="col-md-6">
                               <div class="form-group">
                                           
                                   <asp:Label ID="Label1" runat="server" Text="AIRPORT ID" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                                           
                                   <asp:TextBox ID="TextBox1" class="form-control" runat="server" Height="40px" Width="300px" BackColor="White" BorderColor="Black" MaxLength="3"></asp:TextBox>                                               
                                   <br />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Value Must Required" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>
                              <div class="form-group">
                                           
                                   <asp:Label ID="Label2" runat="server" Text="AIRPORT NAME" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                                           
                                   <asp:TextBox ID="TextBox2" class="form-control" runat="server" Height="40px" Width="300px" BackColor="White" BorderColor="Black" onKeyPress="Validatealphabet(event);"></asp:TextBox>                                               
                                   <br />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Field Must Required" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>

                             
                              
                              <div class="form-group">
                                           
                                  <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="INSERT" OnClick="Button1_Click" BackColor="White" BorderColor="#666666" ForeColor="#000066" Font-Bold="True" OnClientClick="return validate();" />
                                  <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="UPDATE" OnClick="Button2_Click" BackColor="White" BorderColor="#666666" ForeColor="#000066" Font-Bold="True" OnClientClick="return validate();" />
                                    <asp:Button ID="Button3" class="btn btn-default" runat="server" Text="DELETE" OnClick="Button3_Click" BackColor="White" BorderColor="#666666" BorderStyle="Double" ForeColor="#000066" Font-Bold="True" />
                                    </div>
                        </div>
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" Width="524px" DataKeyNames="id,name" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="103px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                             <Columns>
                                 <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" ReadOnly="True" />
                                 <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" ReadOnly="True" />
                                 
                                 <asp:ButtonField ButtonType="Button" CommandName="Edit" HeaderText="EDIT" ShowHeader="True" Text="EDIT" />
                             </Columns>
                             <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                             <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                             <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />
                             <RowStyle BackColor="White" ForeColor="#003399" />
                             <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                             <SortedAscendingCellStyle BackColor="#EDF6F6" />
                             <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                             <SortedDescendingCellStyle BackColor="#D6DFDF" />
                             <SortedDescendingHeaderStyle BackColor="#002876" />
                         </asp:GridView>
             </div>
             </div>
             </div>
             </form>
</asp:Content>
