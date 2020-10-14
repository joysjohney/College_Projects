<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="WebApplication2.payment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Private Jet &amp; Helicopters Charters in India - Air Charter Service</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Payment Form Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="pay/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href='//fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="pay/js/jquery.min.js"></script>
</head>
<body>
    <form runat="server" id="form1">
        <div class="main">
            <h1>ACS BOOKING PAYMENT</h1>
            <div class="content">

                <script src="pay/js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion           
                            width: 'auto', //auto or any width like 600px
                            fit: true   // 100% fit in a container
                        });
                    });
                    function Validatenum(e) {
                        var valid = ((e.which >= 48 && e.which <= 57) || (e.which == 8));
                        if (!valid) {
                            alert("Enter number only!");
                            e.preventDefault();
                        }
                    }
                    function Validatealphabet(e) {
                        var valid = ((e.which >= 65 && e.which <= 90) || (e.which == 8) || (e.which == 32) || (e.which >= 97 && e.which <= 122));
                        if (!valid) {
                            alert("Invalid  character entered");
                            e.preventDefault();
                        }
                    }
                </script>
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <div class="pay-tabs">
                            <h2>Select Payment Method</h2>
                            <ul class="resp-tabs-list">
                                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>
                                    <label class="pic1"></label>
                                    Credit Card</span></li>
                               <%-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>
                                    <label class="pic3"></label>
                                    Net Banking</span></li>--%>
                                <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>
                                    <label class="pic2"></label>
                                    Debit Card</span></li>

                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <%--<li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span><label class="pic2"></label>Debit Card</span></li>--%>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <h5>TOTAL AMOUNT</h5>
                        <asp:TextBox ID="TextBox13" class="payment-info" runat="server" CssClass="pay-tabs" OnTextChanged="TextBox13_TextChanged" ReadOnly="True"></asp:TextBox>
                        <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                <div class="payment-info">

                                   
                                    <%--</form>--%>
                                    <h3 class="pay-title">Credit Card Info</h3>
                                    <%--<form>--%>
                                    <div class="tab-for">
                                        <h5>NAME ON CARD</h5>
                                        <asp:TextBox ID="TextBox3" onKeyPress="Validatealphabet(event);" runat="server" ToolTip="Enter Name as in CREDIT CARD" MaxLength="20"></asp:TextBox>
                                        <h5>CARD NUMBER</h5>

                                        <asp:TextBox ID="TextBox12" runat="server" value="16 DIGIT CARD NUMBER" onKeyPress="Validatenum(event);" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '16 DIGIT CARD NUMBER';}" required="" MaxLength="16" TextMode="SingleLine" ToolTip="Enter 16 DIGIT CARD NUMBER"></asp:TextBox>
                                    </div>
                                    <div class="transaction">
                                        <div class="tab-form-left user-form">

                                            <h5>EXPIRATION</h5>
                                            <ul>
                                                <li>
                                                    <asp:DropDownList ID="DropDownList3" Required="" CssClass="form-control" runat="server" Height="32px" Width="90px">
                                    <asp:ListItem Selected="True">Month</asp:ListItem>
                                    <asp:ListItem>Jan</asp:ListItem>
                                    <asp:ListItem>Feb</asp:ListItem>
                                    <asp:ListItem>Mar</asp:ListItem>
                                    <asp:ListItem>Apr</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>Jun</asp:ListItem>
                                    <asp:ListItem>Jul</asp:ListItem>
                                    <asp:ListItem>Aug</asp:ListItem>
                                    <asp:ListItem>Sep</asp:ListItem>
                                    <asp:ListItem>Oct</asp:ListItem>
                                    <asp:ListItem>Nov</asp:ListItem>
                                    <asp:ListItem>Dec</asp:ListItem>
                                </asp:DropDownList>
                                                    <%--<asp:TextBox ID="TextBox2" runat="server" value="MM" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM';}" required=""></asp:TextBox>--%>
                                                </li>
                                                <li>
                                                    <asp:DropDownList ID="DropDownList4" Required="" CssClass="form-control" runat="server" Height="32px" Width="90px">
                                    <asp:ListItem Selected="True">Year</asp:ListItem>
                                    
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                    <asp:ListItem>2027</asp:ListItem>
                                    <asp:ListItem>2028</asp:ListItem>
                                    <asp:ListItem>2029</asp:ListItem>
                                    <asp:ListItem>2030</asp:ListItem>
                                </asp:DropDownList>
                                                    <%--<asp:TextBox ID="TextBox1" runat="server" value="YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YYYY';}" required=""></asp:TextBox>	--%>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="tab-form-right user-form-rt">
                                            <h5>CVV NUMBER</h5>

                                            <asp:TextBox ID="TextBox6" runat="server" value="xxx" onKeyPress="Validatenum(event);" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxx';}" required="" MaxLength="3" ToolTip="CVV is a 3 digit number found at the backside ." ></asp:TextBox>
                                        </div>

                                    </div>
                                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" OnClientClick="return validate();" type="submit"/>
                                    <%--</form>--%>
                                    <%--<div class="single-bottom">
													<ul>
														<li>
															<input type="hidden" id="brand">--%>
                                    <label for="brand"><span></span><H6>In case of any transaction error,inform team  & your bank.Immediatly!</H6></label>
                                    <%--</li>
													</ul>
											</div>--%>
                                </div>
                            </div>
                       
            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
                <div class="payment-info">

                    <h3 class="pay-title">Dedit Card Info</h3>
                    <%--	<form>--%>
                    <div class="tab-for">
                        <h5>NAME ON CARD</h5>
                        <asp:TextBox ID="TextBox7" onKeyPress="Validatealphabet(event);" runat="server" MaxLength="15"></asp:TextBox>
                        <h5>CARD NUMBER</h5>

                        <asp:TextBox ID="TextBox8" runat="server" class="pay-logo" value="0000-0000-0000-0000" onKeyPress="Validatenum(event);" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="" MaxLength="19" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="transaction">
                        <div class="tab-form-left user-form">
                            <h5>EXPIRATION</h5>
                            <ul>
                                <li>

                                    <asp:DropDownList ID="DropDownList1" Required="" CssClass="form-control" runat="server" Height="32px" Width="90px">
                                    <asp:ListItem Selected="True">Month</asp:ListItem>
                                    <asp:ListItem>Jan</asp:ListItem>
                                    <asp:ListItem>Feb</asp:ListItem>
                                    <asp:ListItem>Mar</asp:ListItem>
                                    <asp:ListItem>Apr</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>Jun</asp:ListItem>
                                    <asp:ListItem>Jul</asp:ListItem>
                                    <asp:ListItem>Aug</asp:ListItem>
                                    <asp:ListItem>Sep</asp:ListItem>
                                    <asp:ListItem>Oct</asp:ListItem>
                                    <asp:ListItem>Nov</asp:ListItem>
                                    <asp:ListItem>Dec</asp:ListItem>
                                </asp:DropDownList>
                                </li>
                                <li>

                                     <asp:DropDownList ID="DropDownList2" Required="" CssClass="form-control" runat="server" Height="32px" Width="90px">
                                    <asp:ListItem Selected="True">Year</asp:ListItem>
                                    
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                    <asp:ListItem>2027</asp:ListItem>
                                    <asp:ListItem>2028</asp:ListItem>
                                    <asp:ListItem>2029</asp:ListItem>
                                    <asp:ListItem>2030</asp:ListItem>
                                </asp:DropDownList>
                                </li>

                            </ul>
                        </div>
                        <div class="tab-form-right user-form-rt">
                            <h5>CVV NUMBER</h5>

                            <asp:TextBox ID="TextBox11" runat="server" value="xxx" onKeyPress="Validatenum(event);" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxx';}" required="" MaxLength="3" ></asp:TextBox>
                        </div>
                        <%--<div class="clear"></div>--%>
                    </div>
                    <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" type="submit"/>
                    <%--</form>--%>
                    <%--<div class="single-bottom">
													<ul>
														<li>
															<input type="checkbox"  id="brand" value="">--%>
                    <label for="brand"><span></span>In case of any transaction error,inform team  & your bank.Immediatly!</label>
                    <%--</li>
													</ul>
											</div>--%>
                </div>
            </div>
        </div>
        </div>
						</div>	

		</div>
		<p class="footer">Copyright © 2018 Payment @ ACS. All Rights Reserved |<%-- Template by <a href="https://w3layouts.com/" target="_blank">w3layouts</a>--%></p>
        </div>
    </form>
</body>
</html>

