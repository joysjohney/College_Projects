<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log.aspx.cs" Inherits="WebApplication2.ADMIN.log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>ACS ADMIN LOGIN</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="login/css/bootstrap.min.css" />
		<link rel="stylesheet" href="login/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="login/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="login/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="login/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<%--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]--%>
  
    <script>
        function validate() {
            var type_name = document.getElementById("ContentPlaceHolder1_uname").value;
            if (type_name.trim() == "") {
                document.getElementById("ContentPlaceHolder1_uname").focus();
                alert("Username is Mandatory");
                return false;
            }
            var type_pwd = document.getElementById("ContentPlaceHolder1_pwd").value;
            if (type_pwd.trim() == "") {
                document.getElementById("ContentPlaceHolder1_pwd").focus();
                alert("Password is Mandatory");
                return false;
            }
           
        }
        

    </script>
      
</head>


<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
                            <form runat="server" id="form1" >
							<div class="center">

								<h1>
									<i class="ace-icon fa fa-plane"></i>
									
									<span class="white" id="id-text2">ACS</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Air Charter Service</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-plane"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>

											
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="uname" placeholder="Email ID" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
															<%--<input type="text" name="uname" id="uname" class="form-control" placeholder="Username"  />--%>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="pwd" placeholder="Password" class="form-control" runat="server" TextMode="Password" MaxLength="10" ValidationGroup="minimum 6 characters" ></asp:TextBox>
															<%--<input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" />--%>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<%--<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Remember Me</span>
														</label>
                                                        <i class="ace-icon fa fa-key"></i>
															<span class="bigger-110"></span>class="width-35 pull-right btn btn-sm btn-primary"--%>
														<%--<button runat="server" class="width-35 pull-right btn btn-sm btn-primary" type="button" onserverclick="login_click">Login</button>--%>
													<button id="Button1" runat="server" onserverclick="login_Click" class="width-65 pull-right btn btn-sm btn-success" onclientclick="return validate();">
															<span class="bigger-110">Login</span>
															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
                                                    </div>

													<div class="space-4"></div>
												</fieldset>
											<%--</form>

											<div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>--%>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<%--<a href="forgot" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													I forgot my password
												</a>--%>
											</div>



											<%--<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>--%>




										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>
												Enter your email and to receive instructions
											</p>

											<%--<form>--%>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Send Me!</span>
														</button>
													</div>
												</fieldset>
											<%--</form>--%>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>

											<%--<form runat="server" >--%>
												<fieldset>
                                                    

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<asp:TextBox ID="email" placeholder="Email" class="form-control" runat="server"></asp:TextBox>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<asp:TextBox ID="usrname" placeholder="Userame" class="form-control" runat="server"></asp:TextBox>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<asp:TextBox ID="usrpwd" placeholder="Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<asp:TextBox ID="repwd" placeholder="Repeat Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<%--<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label>--%>

													<div class="space-24"></div>
                                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button id="regiter" runat="server" onserverclick="register_Click" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Register</span>
															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											<%--</form>--%>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Back to login
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<%--<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;--%>
								<%--<span class="blue">/</span>--%>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div>
                            </form>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="login/js/jquery-2.1.4.min.js"></script>
    
		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='login/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		    jQuery(function ($) {
		        $(document).on('click', '.toolbar a[data-target]', function (e) {
		            e.preventDefault();
		            var target = $(this).data('target');
		            $('.widget-box.visible').removeClass('visible');//hide others
		            $(target).addClass('visible');//show target
		        });
		    });



		    //you don't need this, just used for changing background
		    jQuery(function ($) {
		        $('#btn-login-dark').on('click', function (e) {
		            $('body').attr('class', 'login-layout');
		            $('#id-text2').attr('class', 'white');
		            $('#id-company-text').attr('class', 'blue');

		            e.preventDefault();
		        });
		        $('#btn-login-light').on('click', function (e) {
		            $('body').attr('class', 'login-layout light-login');
		            $('#id-text2').attr('class', 'grey');
		            $('#id-company-text').attr('class', 'blue');

		            e.preventDefault();
		        });
		        $('#btn-login-blur').on('click', function (e) {
		            $('body').attr('class', 'login-layout blur-login');
		            $('#id-text2').attr('class', 'white');
		            $('#id-company-text').attr('class', 'light-blue');

		            e.preventDefault();
		        });

		    });
		</script>
	</body>
   
</html>