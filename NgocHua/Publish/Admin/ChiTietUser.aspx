<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ChiTietUser.aspx.cs" Inherits="NgocHua.Admin.ChiTietUser" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    Chi tiết khách hàng
                </header>
                <div class="panel-body">
                    <div class="form-horizontal tasi-form">
                        
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Tên đăng nhập</label>
                            <div class="col-sm-10">
                                <input id="txtUsername" readonly type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Họ tên</label>
                            <div class="col-sm-10">
                                <input id="txtTen" readonly type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input id="txtEmail" readonly type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Địa chỉ</label>
                            <div class="col-sm-10">
                                <input id="txtAddress" readonly type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Thông tin khác</label>
                            <div class="col-sm-10">
                                <input id="txtDescription" readonly type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button onclick="back()" type="button" class="btn btn-default">Trở về</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hdId" />
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptContent" runat="server">
    <script>
        function back() {
            document.location = "../../Admin/Users";
        }
    </script>
</asp:Content>
