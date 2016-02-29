<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ChiTietHd.aspx.cs" Inherits="NgocHua.Admin.ChiTietHd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Đơn Hàng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    Chi tiết đơn hàng
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
                            <label class="col-sm-2 col-sm-2 control-label">Người đặt hàng</label>
                            <div class="col-sm-10">
                                <input id="txtUser" type="text" class="form-control" runat="server" readonly=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Ngày đặt hàng</label>
                            <div class="col-sm-10">
                                <input id="txtDate" type="text" class="form-control" runat="server" readonly=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Tổng tiền</label>
                            <div class="col-sm-10">
                                <input id="txtTotal" type="text" class="form-control" runat="server" readonly=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Tình trạng</label>
                            <div class="col-sm-10">
                                <input id="txtStatus" type="text" class="form-control" runat="server" readonly=""/>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button onclick="back()" type="button" class="btn btn-default">Trở về</button>
                        </div>
                        <div class="col-sm-4">
                            <button onserverclick="btnSave_OnServerClick" id="btnSave" type="button" class="btn btn-primary" runat="server">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server" 
        AllowSorting="True" AllowPaging="True" PageSize="20" CssClass="table table-hover" Skin="Metro">
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
            <Columns>
                <Telerik:GridBoundColumn DataField="Nhom" HeaderText="Nhóm hàng hóa" UniqueName="Nhom" ReadOnly="True">
                    <HeaderStyle Width="100px" HorizontalAlign="Left"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Left"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="Ten" HeaderText="Tên sản phẩm" UniqueName="Ten" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="SanXuat" HeaderText="Nhà sản xuất" UniqueName="SanXuat" ReadOnly="True">
                    <HeaderStyle Width="100px" HorizontalAlign="Left"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Left"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="Gia" HeaderText="Giá" UniqueName="Gia" ReadOnly="True">
                    <HeaderStyle Width="100px" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="SoLuong" HeaderText="Số lượng" UniqueName="SoLuong" ReadOnly="True">
                    <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                </Telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </Telerik:RadGrid>

    <asp:HiddenField runat="server" ID="hdId" /><Telerik:RadAjaxManager runat="server" ID="ram2">
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="btnSave">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="txtStatus" LoadingPanelID="loadingpanel" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManager>
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    <Telerik:RadAjaxLoadingPanel runat="server" ID="loadingpanel" Skin="Metro" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptContent" runat="server">
    <script>
        function back() {
            document.location = "../../Admin/DonHang";
        }
    </script>
</asp:Content>