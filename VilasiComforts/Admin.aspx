<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="VilasiComforts.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vilasi Admin</title>
    <link rel="shortcut icon" type="image/icon" href="Images/Favicon.ico" />
    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
    <link rel="stylesheet" href="App_Themes/bootstrap.min.css" />
    <link rel="stylesheet" href="App_Themes/font-awesome.min.css" />
    <link rel="stylesheet" href="App_Themes/form-elements.css" />
    <link rel="stylesheet" href="App_Themes/style2.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    <!-- Favicon and touch icons -->
    <%--<link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png"--%>
</head>
<body style="background-image: url(../Images/1.jpg)">
    <form id="form1" runat="server">
        <div class="top-content">

            <div class="inner-bg">
                <div>
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1>
                            <img src="Images/logo1.png" alt="" />
                            <strong>Vilasi Comforts</strong> Admin Login Form</h1>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>Login to Admin Page</h3>
                            <p>Enter your UserId and password to log on:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <div class="">
                            <label>Username</label>
                            <asp:TextBox ID="userId" runat="server" placeholder="User ID..." CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RfvUserName" runat="server"
                                ControlToValidate="userId" Text="Required!!" ForeColor="Red" ValidationGroup="Login">
                            </asp:RequiredFieldValidator>

                        </div>
                        <div class="">
                            <label>Password</label>
                            <asp:TextBox ID="Password" runat="server" placeholder="Password..." CssClass="form-control" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RfvPassword" runat="server"
                                ControlToValidate="Password" Text="Required!!" ForeColor="Red" ValidationGroup="Login">
                            </asp:RequiredFieldValidator>

                        </div>
                        <div class="text-center">
                            <asp:Button ID="BtnLogin" runat="server" Text="Sign in" CssClass="btn btn-danger" Font-Size="Large" ValidationGroup="Login" />
                            <input type="reset" value="Reset" style="font-size: large" class="btn btn-danger col-lg-offset-1 col-sm-offset-1 col-md-offset-1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Javascript -->
    <script src="JQuery/jquery-1.11.1.min.js"></script>
    <script src="JQuery/bootstrap.min.js"></script>
    <script src="JQuery/jquery.backstretch.min.js"></script>
    <script src="JQuery/scripts.js"></script>
</body>
</html>
