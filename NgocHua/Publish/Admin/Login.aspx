<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NgocHua.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div style="padding-top: 20%">

        <div class="col-lg-6 col-lg-offset-3" style="border: solid 1px aqua">
            <section class="panel">
                <header class="panel-heading">
                    Đăng nhập
                </header>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" id="form1" runat="server">
                        <div class="form-group">
                            <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Username</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputEmail1" runat="server" placeholder="Username" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Password</label>
                            <div class="col-lg-10">
                                <input type="password" class="form-control" id="inputPassword1" runat="server" placeholder="Password" />
                            </div>
                        </div>
                        <div class="form-group" style="visibility: collapse">
                            <div class="col-lg-offset-2 col-lg-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" />
                                        Remember me
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button id="btnLogin" onserverclick="btnLogin_OnServerClick" type="submit" class="btn btn-danger" runat="server">Đăng nhập</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
    <script src="js/jquery.min.js" type="text/javascript"></script>

    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="js/Director/app.js" type="text/javascript"></script>
</body>
</html>
