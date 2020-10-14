<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zbook9.aspx.cs" Inherits="WebApplication2.zbook9" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>Private Jet &amp; Helicopters Charters in India - Air Charter Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Registration / Login form Responsive Widget, Login forms,Flat Pricing tables,Flat Drop downs  Sign up Web forms, Login sign up Responsive web Forms," />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom CSS -->
<link href="booking/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS --><!--
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="//fonts.googleapis.com/css?family=Archivo+Black" rel="stylesheet">-->
<link href="//fonts.googleapis.com/css?family=Signika:300,400,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">

<!--font CSS-->
    <script src="booking/js/jquery2.0.3.min.js">
     
    </script>
    <script type="text/javascript">

        function Validatenum(e) {
            var valid = ((e.which >= 48 && e.which <= 57) || (e.which == 8));
            if (!valid) {
                alert("Invalid entry");
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
</head> 
    <form runat="server" id="form1">
       <body class="dashboard-page" onload='document.form1.TextBox4.focus()'>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- validation -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>ACS BOOKING</h2>
					</div>
					
					<div class="forms-grids">
						<div class="forms3">
						<div class="w3agile-validation w3ls-validation">
							<div class="panel panel-widget agile-validation register-form">
								
									<div class="input-info">
										<h3>Book Now</h3>
									</div>
									<div class="row">
                         <div class="col-md-6">
                             <div class="form-group">
                                 <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <asp:Label ID="Label11" runat="server" Text="Booking ID" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox6" class="form-control" runat="server" Height="29px"  Width="501px" ReadOnly="True"></asp:TextBox>

                                                </div>  
                             <asp:HiddenField ID="HiddenField2" runat="server" />
											<div class="form-group">
                                            <asp:Label ID="Label12" runat="server" Text="Full Name" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox1" class="form-control" onKeyPress="Validatealphabet(event);" runat="server" Height="29px"  Width="501px"></asp:TextBox>
                                                </div>  
											<div class="form-group">
                                            <asp:Label ID="Label13" runat="server" Text="Date of Birth" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox2" class="form-control"  runat="server" Height="29px"  placeholder="DD/MM/YYYY" Width="501px" MaxLength="10"></asp:TextBox>
                                            </div>  
                                           <div class="form-group">
                                            <asp:Label ID="Label14" runat="server" Text="ID Proof (UID no. / Passport no.)" ForeColor="White" Font-Bold="True" ></asp:Label>
                                                <asp:TextBox ID="TextBox3" class="form-control" runat="server" Height="29px" placeholder="123-456-789"  Width="501px" MaxLength="15"></asp:TextBox>
                                                </div>  
                                            
                                      						
                                          <div class="form-group">
                                            <asp:Label ID="Label5" runat="server" Text="Email" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox4" class="form-control" runat="server" Height="29px"  Width="501px" ></asp:TextBox>
                                                </div>  
                                           <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" Text="Phone Number" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox5" class="form-control" runat="server" Height="29px"  onKeyPress="Validatenum(event);" Width="501px" MaxLength="10"></asp:TextBox>
                                           </div>  
                                            <div class="form-group">
                                            <asp:Label ID="Label7" runat="server" Text="Aircraft Name" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox7" class="form-control" runat="server" Height="29px" Width="500px" ReadOnly="True"></asp:TextBox>
                                                </div>  


                                            
											 <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Depature Airport" ForeColor="White" Font-Bold="True"></asp:Label>
                                                 <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" Width="525px" BackColor="#333333" Height="40px"></asp:DropDownList>
                                                </div>  
                                             <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Arrival Airport" ForeColor="White" Font-Bold="True"></asp:Label>
                                                 <asp:DropDownList ID="DropDownList2" class="form-control" runat="server" Width="525px" BackColor="#333333" Height="40px"></asp:DropDownList>
                                                </div>  
                                            <div class="form-group">
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:Label ID="Label3" runat="server" Text="Date of Travel" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox10" class="form-control" runat="server" Height="29px"   Width="500px" TextMode="Date" OnTextChanged="TextBox10_TextChanged"></asp:TextBox>
                                                <%--<asp:CalendarExtender ID="TextBox10_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox10">
                                                </asp:CalendarExtender>--%>
                                                </div>  
                                            <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="Depature Time" ForeColor="White" Font-Bold="True"></asp:Label>
                                                <asp:TextBox ID="TextBox11" class="form-control" runat="server" Height="29px" placeholder="HH:MM(AM/PM)" Width="501px" TextMode="Time"></asp:TextBox>
                                                 </div>  
                                            
                                            <div class="form-group">
                                            <asp:Label ID="Label8" runat="server" Text="*Payable Amount" Font-Bold="True" ForeColor="White" Font-Italic="True"></asp:Label>
                                                <asp:TextBox ID="TextBox12" class="form-control" runat="server" Height="29px"  Width="501px" ReadOnly="True"></asp:TextBox>
                                                </div>  
                                            																		
                                            <div class="form-group">
                                                <asp:Button ID="Button2" runat="server" Text="CANCEL" OnClick="Button2_Click" BackColor="#0066FF" Font-Bold="True" Font-Size="Medium" ForeColor="White" />
                                                <asp:Button ID="Button1" runat="server" Text="BOOK NOW" OnClick="Button1_Click" BackColor="#0066FF" Font-Bold="True"  OnClientClick="ValidateEmail(document.form1.TextBox4)" Font-Size="Medium" ForeColor="White" />
													</div>
												<div class="form-group">
													</div>	
										
									</div>
								</div>
							</div>








							<%--guidline--%>
							<div class="panel panel-widget agile-validation">
								<div class="validation-grids validation-grids-right login-form">
									<div class="widget-shadow login-form-shadow" data-example-id="basic-forms"> 
										<div class="input-info">
											<h3><u>Guidline!</u></h3>
                                            <table border="0" cellpadding="0" cellspacing="0" class="tbl112" style="color: #FFFFFF">
	<tbody>
		
		<tr>
			<td>•	Daily Buffet Meals  as per the meal plan.</td>
		</tr>
		<tr>

            <td>•	All passengers are requested to be present at the airport at least 40mins prior to depature time.</td>
            </tr>
        <tr>
            <td>•	Failing to pushback before the depature time will eventually lead to cancellation of flight.As per DGCA regulation</td>
            
        </tr>
        <tr>
			<td>•	All aircrafts are 2 man crew with stewerdes on board.</td>
        </tr>
        <tr>
			<td>•	All Govt. Taxes.</td>
		</tr>
         <tr>
			<td>•	More deatils on My Account. Cancellation will incur 30% of the master ticket.</td>
		</tr>
	</tbody>
</table>
										</div>
                                        &nbsp;<%--<div class="form-body form-body-info">
											<form data-toggle="validator" action="#" method="post">
												<div class="form-group has-feedback">
													<input type="email" class="form-control" name="Eamil" placeholder="Enter Your Email" data-error="Bruh, that email address is invalid" required="">
													<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
												</div>																																				
											</form>
										</div>--%></div>
								</div>
							</div>



						</div>
						<div class="clear"> </div>
						</div>
					
				</div>
				<!-- //validation -->
			</div>
		</div>
		<!-- footer -->
		<div class="footer">
			<p>© 2018 ACS Booking . All Rights Reserved by Air Charter Service</p>
		</div>
		<!-- //footer -->
		<!-- input-forms -->
		
		
		<script type="text/javascript" src="booking/js/valida.2.1.6.min.js"></script>
            <script src="email-validation.js"></script>
		<script type="text/javascript" >


		    $(document).ready(function () {

		        // show Valida's version.
		        $('#version').valida('version');

		        // Exemple 1
		        $('.valida').valida();

		        // Exemple 2
		        /*
				$('.valida').valida({

					// basic settings
					validate: 'novalidate',
					autocomplete: 'off',
					tag: 'p',

					// default messages
					messages: {
						submit: 'Wait ...',
						required: 'Este campo é obrigatório',
						invalid: 'Field with invalid data',
						textarea_help: 'Digitados <span class="at-counter">{0}</span> de {1}'
					},

					// filters & callbacks
					use_filter: true,

					// a callback function that will be called right before valida runs.
					// it must return a boolan value (true for good results and false for errors)
					before_validate: null,

					// a callback function that will be called right after valida runs.
					// it must return a boolan value (true for good results and false for errors)
					after_validate: null

				});
				*/

		        // setup the partial validation
		        $('#partial-1').on('click', function (ev) {
		            ev.preventDefault();
		            $('#res-1').click(); // clear form error msgs
		            $('form').valida('partial', '#field-1'); // validate only field-1
		            $('form').valida('partial', '#field-1-3'); // validate only field-1-3
		        });

		    });

		</script>
		<!-- //input-forms -->
		<!--validator js-->
		<script src="booking/js/validator.min.js"></script>
		<!--//validator js-->
            </div>
</body>

    </form>
</html>