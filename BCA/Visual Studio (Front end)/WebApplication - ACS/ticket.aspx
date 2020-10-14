<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ticket.aspx.cs" Inherits="WebApplication2.ticket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script language="javascript" type ="text/javascript" >


    function printTbl() {
        var TableToPrint = document.getElementById('printtab');
        newWin = window.open("");
        newWin.document.write(TableToPrint.outerHTML);
        newWin.print();
        newWin.close();
    }
</script>
</head>
<body>
     <td colspan="4" class="auto-style2" style="border-style: groove">
   <form id="form1" runat="server">
    <div style="background-color: #FFFFFF">
       
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                <table class="auto-style1"   id="printtab" style="width: 100%"  >
            <tr>
                <td colspan="4" class="auto-style2" style="border-style: groove"><br />
                    <img alt="" class="auto-style3" src="img/logo.jpg.ico" /><br />
                    <span class="auto-style12"><strong>Air Charter Service</strong></span><strong><br class="auto-style12" />
                    </strong><span class="auto-style12"><strong>Private Jet &amp; Helicopters Charters in India</strong></span> </td>
            </tr>
            <tr>
                <td class="auto-style17" style="border-style: none; empty-cells: hide;">
                    <br />
                    <br />
                </td>
                <td class="auto-style18" style="border-style: none; empty-cells: hide;">&nbsp;</td>
                <td class="auto-style19" style="border-style: none; empty-cells: hide;">&nbsp;</td>
                <td class="auto-style20" style="border-style: none; empty-cells: hide;">&nbsp;</td>
            </tr>
 <tr>
                <td colspan="4" class="auto-style11"><strong><span class="auto-style16">PASSENGER DETAILS </span></strong> </td>
            </tr>
            <tr>
                <td class="auto-style17" style="border-style: none; empty-cells: hide;">Book ID</td>
                <td class="auto-style22" style="border-style: none; empty-cells: hide;"><%#book %></td>
                <td class="auto-style17" style="border-style: none; empty-cells: hide;">Name</td>
                <td class="auto-style22" style="border-style: none; empty-cells: hide;"><%#name %></td>
              
            </tr>
            <tr>
                  <td class="auto-style14" style="border-style: none; empty-cells: hide;">Date of Birth</td>
                <td style="border-style: none; empty-cells: hide;" class="auto-style23"><%# dob %></td>
                <td class="auto-style7" style="border-style: none; empty-cells: hide;">ID proof Number</td>
                <td class="auto-style21" style="border-style: none; empty-cells: hide;"><%# emirates %></td>
                
                
              
          
                </tr>
                    <tr>
                  <td class="auto-style19" style="border-style: none; empty-cells: hide;">Email</td>
                <td class="auto-style24" style="border-style: none; empty-cells: hide;"><%# email %></td>
                <td class="auto-style7" style="border-style: none; empty-cells: hide;">Phone</td>
                <td class="auto-style21" style="border-style: none; empty-cells: hide;"><%# phone %></td>
            </tr>
            <tr>
                <td class="auto-style7" style="border-style: none; empty-cells: hide;">
                    <br />
                    <br />
                </td>
                <td class="auto-style4" style="border-style: none; empty-cells: hide;">&nbsp;</td>
                <td class="auto-style14" style="border-style: none; empty-cells: hide;">&nbsp;</td>
                <td style="border-style: none; empty-cells: hide;" class="auto-style27">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" class="auto-style11"><strong><span class="auto-style16">BOOKING DETAILS </span></strong> </td>
            </tr>
            <tr>
                <td class="auto-style15" style="">Aircraft Name</td>
                 <td class="auto-style5" style="border-bottom-style: hidden; padding-bottom: 7px; "><%# airname %></td>
                </tr>
                    <tr>
                <td class="auto-style25" style="">Depature Airport </td>
                        <td class="auto-style5" style="border-bottom-style: hidden; padding-bottom: 7px; "><%# depat %></td>
                        </tr>
                    <tr>
                <td class="auto-style9" style="">Arrival Airport</td>
                         <td class="auto-style6" style="border-bottom-style: hidden; padding-bottom: 7px; "><%# arrival %></td>
                        </tr>
                    <tr>
                <td class="auto-style9" style="">Depature Date</td>
                           <td class="auto-style6" style="border-bottom-style: hidden; padding-bottom: 7px; "><%# date %></td>
                        </tr>
                    <tr>
                <td class="auto-style9" style="">Depature Time</td>
  <td class="auto-style6" style="border-bottom-style: hidden; padding-bottom: 7px; "><%# time %></td>
            </tr>
                </HeaderTemplate>
           
            <FooterTemplate>
                   <tr>
                <td class="auto-style8" style="empty-cells: show">&nbsp;</td>
                <td class="auto-style10" style="empty-cells: show">&nbsp;</td>
            </tr>
                    <tr>
                <td class="auto-style8" style="border-style: none; empty-cells: show">Total</td>
                <td class="auto-style10" style="border-style: dotted; empty-cells: show">INR&nbsp;<%# total %></td>
                    </tr>
                   <tr>
                <td class="auto-style8" style="empty-cells: show">
                    <br />
                    <br />
                       </td>
                <td class="auto-style10" style="empty-cells: show">&nbsp;</td>
            </tr>
                <tr>
                <td colspan="4" style="border-style: groove; font-size: x-small" class="auto-style2"><span class="auto-style13">This is a computer generated statement and does not require a signature . Team ACS</span><br />
                </td>
            </tr>
        </table>


                
                </td>
                </FooterTemplate>
        </asp:Repeater>
        <asp:Button ID="Button1" OnClientClick  ="printTbl()" runat="server"  Text="Print Ticket"  />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server"  Text="Go home" OnClick="Button2_Click" style="margin-left: 36px"  />
    </div>
    </form>
</body>
</html>

