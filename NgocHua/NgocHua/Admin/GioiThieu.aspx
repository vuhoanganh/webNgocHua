<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GioiThieu.aspx.cs" Inherits="NgocHua.Admin.GioiThieu" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    Giới Thiệu
                </header>
                <div class="panel-body">
                    <div class="form-horizontal tasi-form">
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Tên trang</label>
                            <div class="col-sm-10">
                                <input id="txtTen" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Nhà sản xuất</label>
                            <div class="col-sm-10">
                                <telerik:RadEditor runat="server" ID="txtContent" RenderMode="Lightweight" Height="675px">
                                    <ImageManager EnableAsyncUpload="False"></ImageManager>
                                </telerik:RadEditor>
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
            document.location = "../../Admin/DanhSachTrang";
        }
    </script>
</asp:Content>
