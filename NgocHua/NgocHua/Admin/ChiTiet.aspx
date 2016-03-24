<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="NgocHua.Admin.ChiTiet" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    Chi tiết sản phẩm
                </header>
                <div class="panel-body">
                    <div class="form-horizontal tasi-form">
                        <div class="form-group">
                            <label class="col-lg-2 col-sm-2 control-label">Stt</label>
                            <div class="col-lg-10">
                                <p class="form-control-static">
                                    <asp:Label runat="server" ID="lbStt" />
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Nhóm hàng hóa</label>
                            <div class="col-sm-10">
                                <input id="txtNhom" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Tên sản phẩm</label>
                            <div class="col-sm-10">
                                <input id="txtTen" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Đơn vị tính</label>
                            <div class="col-sm-10">
                                <input id="txtDonVi" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Nhà sản xuất</label>
                            <div class="col-sm-10">
                                <input id="txtSanXuat" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Giá</label>
                            <div class="col-sm-10">
                                <Telerik:RadNumericTextBox ID="txtGia" CssClass="form-control" runat="server" ShowButton="False" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Bán chạy</label>
                            <div class="col-sm-10">
                                <input id="cboHot" type="checkbox" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Khuyến mãi</label>
                            <div class="col-sm-10">
                                <input id="cboSale" type="checkbox" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Hình ảnh</label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="fileImport" AllowMultiple="False" runat="server"/>
                                <div style="margin-top: 10px">
                                    <asp:Image runat="server" ID="img" Width="300" /></div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button onclick="back()" type="button" class="btn btn-default">Trở về</button>
                        </div>
                        <div class="col-sm-4">
                            <button onserverclick="btnSave_OnServerClick" id="btnSave" type="button" class="btn btn-primary" runat="server">Lưu</button>
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
            document.location = "../../Admin/SanPham";
        }
    </script>
</asp:Content>
