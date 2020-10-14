<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelbook.aspx.cs" Inherits="WebApplication2.cancelbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>ACS ADMIN LOGIN</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="ADMIN/login/css/bootstrap.min.css" />
		<link rel="stylesheet" href="ADMIN/login/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="ADMIN/login/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="ADMIN/login/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="ADMIN/login/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<%--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]--%>
    <style type="text/css">
table{border-collapse:collapse;border-spacing:0}*,:after,:before{-webkit-box-sizing:inherit;-moz-box-sizing:inherit;box-sizing:inherit}legend,td,th{padding:0}</style>
</head>
    <script>
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

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">

											<div class="space-6">
                                            </div>

											
												<fieldset>
													  <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="BOOK ID" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>

                            <asp:HiddenField ID="HiddenField1" runat="server" />

                            <asp:TextBox ID="TextBox1" class="form-control" onKeyPress="Validatenum(event);" runat="server" Height="30px" Width="300px" BackColor="White" BorderColor="Black" MaxLength="6"></asp:TextBox>
                            <br />

                        </div>
                        <div class="form-group">

                            <asp:Label ID="Label2" runat="server" Text="FULL NAME" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="#000066"></asp:Label>

                            <br />

                            <asp:TextBox ID="TextBox2" class="form-control" onKeyPress="Validatealphabet(event);" runat="server" Height="30px" Width="300px" BackColor="White" BorderColor="Black" MaxLength="20"></asp:TextBox>
                            <br />
                            <br />


                            <div class="form-group">
                                <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Home" OnClick="Button1_Click" BackColor="White" BorderColor="#666666" ForeColor="White" Font-Bold="False" />
                     
                            <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="CANCEL NOW !" OnClick="Button1_Click" BackColor="#99CCFF" BorderColor="#666666" ForeColor="Red" Font-Bold="True" />
                           </div>

                        
                        </div>
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



											<%--<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>--%>




										</div>
									</div>
                                    <!-- /.widget-body -->
								</div><!-- /.login-box -->

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
		</div>
    <!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="ADMIN/login/js/jquery-2.1.4.min.js"></script>
    
		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='login/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>

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
