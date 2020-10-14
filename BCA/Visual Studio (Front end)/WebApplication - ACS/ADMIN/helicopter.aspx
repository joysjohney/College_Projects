<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/admin.Master" AutoEventWireup="true" CodeBehind="helicopter.aspx.cs" Inherits="WebApplication2.ADMIN.helicopter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        function showimagepreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#Maincontent_Image1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function validate() {
            var type_name = document.getElementById("Maincontent_TextBox2").value;
            if (type_name.trim() == "") {
                document.getElementById("Maincontent_TextBox2").focus();
                alert("Helicopter Name is Mandatory");
                return false;
            }
            var type_seat = document.getElementById("Maincontent_TextBox3").value;
            if (type_seat.trim() == "") {
                document.getElementById("Maincontent_TextBox3").focus();
                alert("No.of seat is Mandatory");
                return false;
            }
            var type_price = document.getElementById("Maincontent_TextBox4").value;
            if (type_price.trim() == "") {
                document.getElementById("Maincontent_TextBox4").focus();
                alert("Price is Mandatory");
                return false;
            }
        }
        function Validatenum(e) {
            var valid = ((e.which >= 48 && e.which <= 57) || (e.which == 8));
            if (!valid) {
                alert("Invalid digits entered");
                e.preventDefault();
            }
        }

        function Validatealphabet(e) {
            var valid = ((e.which >= 65 && e.which <= 90) || (e.which == 8) || (e.which == 32) || (e.which >= 97 && e.which <= 122));
            if (!valid) {
                alert("Invalid character entered");
                e.preventDefault();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Maincontent" runat="server">
     <form runat="server" id="form1">
    <div class="panel panel-default">
   
     <h2><b><u>HELICOPTERS</u></b></h2>
    
         <div class="panel-body">
                    <div class="row" style="background-image: url('assets/img/pic/hel.jpg')">
                         <div class="col-md-6">
                               <div class="form-group">
                                   <asp:HiddenField ID="HiddenField1" runat="server" />      
                                   <asp:Label ID="Label1" runat="server" Text="HELICOPTER ID" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                                           
                                   <asp:TextBox ID="TextBox1" class="form-control" runat="server" Height="40px" Width="300px" BackColor="White" BorderColor="Black" ForeColor="Black" MaxLength="6"></asp:TextBox>                                               
                                   <br />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Value Must Required" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>
                              <div class="form-group">
                                           
                                   <asp:Label ID="Label2" runat="server" Text="HELICOPTER NAME" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                                           
                                   <asp:TextBox ID="TextBox2" class="form-control" runat="server" Height="40px" Width="300px" BackColor="White" BorderColor="Black" ></asp:TextBox>                                               
                                   <br />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Field Must Required" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>

                              <div class="form-group">
                                           
                                   <asp:Label ID="Label3" runat="server" Text="NO. OF SEATS" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                                           
                                   <asp:TextBox ID="TextBox3" class="form-control" runat="server" Height="40px" Width="300px" BackColor="White" BorderColor="Black" onKeyPress="Validatenum(event);"></asp:TextBox>                                               
                                   <br />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Field Must Required" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>
                              <div class="form-group">
                                   <asp:Label ID="Label5" runat="server" Text="IMAGE" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                  
                                  <asp:FileUpload ID="FileUpload1" runat="server" onchange="showimagepreview(this)" BackColor="White" ForeColor="#000066"  />
                                  <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" BackColor="White" />
                                  </div>
                              <div class="form-group">
                                           
                                   <asp:Label ID="Label4" runat="server" Text="PRICE" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                                           
                                   <asp:TextBox ID="TextBox4" class="form-control" runat="server" Height="40px" Width="300px" BackColor="White" BorderColor="Black" ForeColor="Black" onKeyPress="Validatenum(event);" MaxLength="6"></asp:TextBox>                                               
                                   <br />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Field Must Required" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>
                            
                              <div class="form-group">
                                           
                                  <asp:Button ID="Button1" class="btn btn-default" runat="server"  Text="INSERT" OnClick="Button1_Click" BackColor="White" BorderColor="#666666" BorderStyle="None" ForeColor="#000066" Font-Bold="True" OnClientClick="return validate();" />
                                  <asp:Button ID="Button2" class="btn btn-default" runat="server"  Text="UPDATE" OnClick="Button2_Click" BackColor="White" BorderColor="#666666" ForeColor="#000066" Font-Bold="True" OnClientClick="return validate();" />
                                    <asp:Button ID="Button3" class="btn btn-default" runat="server" Text="DELETE" OnClick="Button3_Click" BackColor="White" BorderColor="#666666" BorderStyle="Double" ForeColor="#000066" Font-Bold="True"  />
                                    </div>
                        </div>
                         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView3_RowEditing" Width="607px" DataKeyNames="id,name,seat,image,price" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="217px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                             <Columns>
                                 <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" ReadOnly="True" />
                                 <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" ReadOnly="True" />
                                  <asp:BoundField DataField="seat" HeaderText="SEAT" SortExpression="seat" ReadOnly="True" />
                                  <asp:TemplateField HeaderText="Image" SortExpression="image">
                                      <ItemTemplate>
                                          <asp:Image ID="Image2" runat="server" Height="82px" ImageUrl='<%# "getimg.aspx?id=" + DataBinder.Eval(Container.DataItem,"id") %>' Width="210px" />
                                      </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:BoundField DataField="price" HeaderText="PRICE" SortExpression="price" ReadOnly="True" />
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
