<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.login" %>

<!DOCTYPE html>
<head>
<title>Private Jet &amp; Helicopters Charters in India - Air Charter Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Registration / Login form Responsive Widget, Login forms,Flat Pricing tables,Flat Drop downs  Sign up Web forms, Login sign up Responsive web Forms," />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom CSS -->
<link href="log/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS --><!--
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="//fonts.googleapis.com/css?family=Archivo+Black" rel="stylesheet">-->
<link href="//fonts.googleapis.com/css?family=Signika:300,400,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">

<!--font CSS-->
<script src="log/js/jquery2.0.3.min.js"></script>
</head>

<body class="dashboard-page">
    <form runat="server" id="form1" >
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- validation -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>Air Charter Service</h2>
					</div>
					
					<div class="forms-grids">
						<div class="forms3">
						<div class="w3agile-validation w3ls-validation">
							<div class="panel panel-widget agile-validation register-form">
								<div class="validation-grids widget-shadow" data-example-id="basic-forms"> 
									<div class="input-info">
										<h3><u>Register</u> </h3>
									</div>
									
											<div class="form-group has-feedback">
                                                <asp:Label ID="Label1" runat="server" Text="Email ID" ForeColor="White"></asp:Label>
                                                <asp:TextBox ID="TextBox1" class="form-control" runat="server"  TextMode="Email"></asp:TextBox>
												<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
												
											</div>
											<div class="form-group">
                                                <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="White"></asp:Label>
											 <asp:TextBox ID="TextBox2" class="form-control" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
                                                <asp:Label ID="Label3" runat="server" Text="Confirm Password" ForeColor="White"></asp:Label>
											<asp:TextBox ID="TextBox3" class="form-control" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
											    
											</div>
											<div class="form-group">
											  <div class="help-block with-errors"></div>
											</div>
											
											<%--<div class="form-group">
												<div class="checkbox">
													<label>
														<input type="checkbox" id="terms" data-error="Before you wreck yourself" required="">
														I have read and accept terms of use.
													</label>
													<div class="help-block with-errors"></div>
												</div>
											</div>--%>
                                   
											<div class="form-group">
												
                                                <asp:Button ID="Button1" class="btn btn-primary enabled" runat="server" Text="Submit" OnClick="Button1_Click" />
											</div>
										
									</div>
								</div>
							</div>
							
							<div class="panel panel-widget agile-validation">
								<div class="validation-grids validation-grids-right login-form">
									<div class="widget-shadow login-form-shadow" data-example-id="basic-forms"> 
										<div class="input-info">
											<h3><u>Login</u> </h3>
										</div>
										<div class="form-body form-body-info">
											<div class="form-group">
												<asp:Label ID="Label4" runat="server" Text="Email ID" ForeColor="White"></asp:Label>
                                                    <asp:TextBox ID="TextBox4" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
													
												</div>
												<div class="form-group">
                                                    <asp:Label ID="Label5" runat="server" Text="Password" ForeColor="White"></asp:Label>
                                                    <asp:TextBox ID="TextBox5" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
												</div>
												
													
													<div class="form-group">
														
                                                        <asp:Button ID="Button2" class="btn btn-primary enabled" runat="server" Text="Login" OnClick="Button2_Click" />
													</div>
												
										
									</div>
								</div>
							</div>
						</div>
						
						</div>
                        <div class="clear"> </div>
					</div>
				</div>
				<!-- //validation -->
			</div>
    </form>
		</body>
   
		<!-- footer -->
		<div class="footer">
			<p>© 2018 Registration & Login . All Rights Reserved Air Charter Service</p>
		</div>
		<!-- //footer -->
		<!-- input-forms -->
		
		
		<script type="text/javascript" src="log/js/valida.2.1.6.min.js"></script>
		<script type="text/javascript" >

			$(document).ready(function() {

				// show Valida's version.
				$('#version').valida( 'version' );

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
				$('#partial-1').on('click', function( ev ) {
					ev.preventDefault();
					$('#res-1').click(); // clear form error msgs
					$('form').valida('partial', '#field-1'); // validate only field-1
					$('form').valida('partial', '#field-1-3'); // validate only field-1-3
				});

			});

		</script>
		<!-- //input-forms -->
		<!--validator js-->
		<script src="log/js/validator.min.js"></script>
		<!--//validator js-->



