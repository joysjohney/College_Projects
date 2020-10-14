<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start.aspx.cs" Inherits="WebApplication2.start" %>

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
            <h1>Air Charter Service</h1>
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

                </script>
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <div class="pay-tabs">
                            <h2>Select your option</h2>
                            <ul class="resp-tabs-list">
                                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab">
                                    <%--<label class="pic1"></label>
                                    Passenger</span></li>--%>
                               <%-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>
                                    <label class="pic3"></label>
                                    Net Banking</span></li>--%>
                                <li class="resp-tab-item" aria-controls="tab_item-2" role="tab">
                                   <%-- <label class="pic2"></label>
                                    Admin</span></li>--%>

                                <%--<asp:HiddenField ID="HiddenField1" runat="server" />
                               <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span><label class="pic2"></label>Debit Card</span></li>
                              <div class="clear"></div>--%>
                            </ul>
                        </div>
                      
                       <%-- <asp:Label ID="Label1" runat="server" Text="TOTAL AMOUNT" BackColor="White" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="TextBox13" class="payment-info" runat="server" CssClass="pay-tabs" OnTextChanged="TextBox13_TextChanged" ReadOnly="True"></asp:TextBox>--%>
                        <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                               <%-- <div class="payment-info">

                                   
                                    <%--</form>--%>
                                 <%--   <h3 class="pay-title"><b>ACS Home</b> </h3>
                                    <%--<form>--%>
                                    <%--<div class="tab-for">--%>
                                        <%--<h5>NAME ON CARD</h5>
                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                        <h5>CARD NUMBER</h5>

                                        <asp:TextBox ID="TextBox12" runat="server" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="" MaxLength="19" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="transaction">
                                        <div class="tab-form-left user-form">

                                            <h5>EXPIRATION</h5>
                                            <ul>
                                                <li>
                                                    <asp:TextBox ID="TextBox2" class="text_box" runat="server" value="MM" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM';}" required=""></asp:TextBox>
                                                    <%--<asp:TextBox ID="TextBox2" runat="server" value="MM" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM';}" required=""></asp:TextBox>--%>
                                               <%-- </li>
                                                <li>
                                                    <asp:TextBox ID="TextBox1" class="text_box" runat="server" value="YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YYYY';}" required=""></asp:TextBox>
                                                    <%--<asp:TextBox ID="TextBox1" runat="server" value="YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YYYY';}" required=""></asp:TextBox>	--%>
                                         <%--       </li>

                                            </ul>
                                        </div>
                                        <div class="tab-form-right user-form-rt">
                                            <h5>CVV NUMBER</h5>

                                            <asp:TextBox ID="TextBox6" runat="server" value="xxx" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxx';}" required="" MaxLength="3" TextMode="Password"></asp:TextBox>
                                        </div>--%>

                                    </div>
                                    <asp:Button ID="Button1" runat="server" Text="GO PASSENGER" OnClick="Button1_Click" BackColor="#0066FF" Font-Bold="True" Font-Size="Medium" ForeColor="White"/>
                                    <%--</form>--%>
                                    <%--<div class="single-bottom">
													<ul>
														<li>
															<input type="hidden" id="brand">--%>
                                   
                                    <%--</li>
													</ul>
											</div>--%>
                                </div>
                            </div>
                            <%--<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
										<div class="payment-info">
											<h3>Net Banking</h3>
											<div class="radio-btns">
												<div class="swit">								
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio" checked=""><i></i>Dubai Islamic Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Emirates NBD</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Bank of Baroda</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>State Bank of India</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Standard Charter</label> </div></div>--%>
                            <%--<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i></label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Indian Overseas Bank</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Punjab National Bank</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>South Indian Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>State Bank Of India</label> </div></div>		--%>
                        <%--</div>--%>
                        <%--<div class="swit">								
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio" checked=""><i></i>City Union Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>HDFC Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>IndusInd Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Syndicate Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Deutsche Bank</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Corporation Bank</label> </div></div>
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>UCO Bank</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Indian Bank</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Federal Bank</label> </div></div>	
													<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>ING Vysya Bank</label> </div></div>	
				<%--								</div>--%>
                  <%--  </div>
                    <a href="#">Continue</a>
                </div>
            </div>--%>
            <%--<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
										<div class="payment-info">
											<h3>PayPal</h3>
											<h4>Already Have A PayPal Account?</h4>
											<div class="login-tab">
												<div class="user-login">
													<h2>Login</h2>
													
													<form>
														<input type="text" value="name@email.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'name@email.com';}" required="">
														<input type="password" value="PASSWORD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWORD';}" required="">
															<div class="user-grids">
																<div class="user-left">
																	<div class="single-bottom">
																			<ul>
																				<li>
																					<input type="checkbox"  id="brand1" value="">
																					<label for="brand1"><span></span>Remember me?</label>
																				</li>
																			</ul>
																	</div>
																</div>
																<div class="user-right">
																	<input type="submit" value="LOGIN">
																</div>
																<div class="clear"></div>
															</div>
													</form>
												</div>
											</div>
										</div>
									</div>--%>
            <div class="resp-tabs-container">
                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
                               <%-- <div class="payment-info">

                                   
                                    <%--</form>--%>
                                 <%--   <h3 class="pay-title"><b>ACS Home</b> </h3>
                                    <%--<form>--%>
                                    <%--<div class="tab-for">--%>
                                        <%--<h5>NAME ON CARD</h5>
                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                        <h5>CARD NUMBER</h5>

                                        <asp:TextBox ID="TextBox12" runat="server" value="0000-0000-0000-0000" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}" required="" MaxLength="19" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="transaction">
                                        <div class="tab-form-left user-form">

                                            <h5>EXPIRATION</h5>
                                            <ul>
                                                <li>
                                                    <asp:TextBox ID="TextBox2" class="text_box" runat="server" value="MM" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM';}" required=""></asp:TextBox>
                                                    <%--<asp:TextBox ID="TextBox2" runat="server" value="MM" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM';}" required=""></asp:TextBox>--%>
                                               <%-- </li>
                                                <li>
                                                    <asp:TextBox ID="TextBox1" class="text_box" runat="server" value="YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YYYY';}" required=""></asp:TextBox>
                                                    <%--<asp:TextBox ID="TextBox1" runat="server" value="YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YYYY';}" required=""></asp:TextBox>	--%>
                                         <%--       </li>

                                            </ul>
                                        </div>
                                        <div class="tab-form-right user-form-rt">
                                            <h5>CVV NUMBER</h5>

                                            <asp:TextBox ID="TextBox6" runat="server" value="xxx" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'xxx';}" required="" MaxLength="3" TextMode="Password"></asp:TextBox>
                                        </div>--%>

                                    </div>
                                    <asp:Button ID="Button2" runat="server" Text="ADMIN" OnClick="Button2_Click" BackColor="#0066FF" Font-Bold="True" Font-Size="Medium" ForeColor="White"/>
                                    <%--</form>--%>
                                    <%--<div class="single-bottom">
													<ul>
														<li>
															<input type="hidden" id="brand">--%>
                                   
                                    <%--</li>
													</ul>
											</div>--%>
                                </div>
                            </div>
        </div>
        </div>
						
    </form>
</body>
</html>

