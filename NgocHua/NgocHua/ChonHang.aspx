<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChonHang.aspx.cs" Inherits="NgocHua.ChonHang" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .RadGrid_Metro .rgHeader, .RadGrid_Metro .rgHeader a {
            color: white !important;
        }

        .rgBatchContainer input {
            width: 100% !important;
            height: 100% !important;
            padding: 0 !important;
            margin: 0 !important;
        }

        .RadGrid_Metro .rgCommandRow a {
            color: black !important;
            font-size: 18px !important;
            padding: 10px 0 0 0 !important;
        }

        /*.rgSave {
            visibility: collapse !important;
            display: none !important;
        }*/

        .main-content table {
            margin-bottom: 0;
        }

        .rgCommandTable {
            margin-bottom: 10px !important;
        }
    </style>
    
    <script type="text/javascript">
        function saveAll(sender, args) {
            var grid = $find('<%=grid.ClientID%>');
            grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainSlide" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bannerItems" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <!-- Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="carousel-heading">
                <h4>Danh sách hàng hóa</h4>
            </div>
        </div>
        <!-- /Heading -->
    </div>

    <asp:Panel runat="server" DefaultButton="BtnSearch">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-lg-offset-6 col-md-offset-6 col-sm-offset-6">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Tìm theo ..." id="TxtSearch" runat="server" />

                    <span class="input-group-btn">
                        <asp:Button CssClass="btn btn-default" ID="BtnSearch" runat="server"
                            OnClick="BtnSearch_OnServerClick" Text="Tìm kiếm" />
                    </span>
                </div>
                <!-- /input-group -->
            </div>
        </div>
    </asp:Panel>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">

            <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
                AllowSorting="False" AllowPaging="True"
                OnBatchEditCommand="grid_OnBatchEditCommand" Skin="Metro" PageSize="50">
                <MasterTableView CommandItemDisplay="None" EditMode="Batch" AutoGenerateColumns="False" DataKeyNames="Id">
                    <CommandItemSettings ShowSaveChangesButton="False" ShowAddNewRecordButton="False" ShowCancelChangesButton="False"
                        SaveChangesText="Thêm vào giỏ hàng" ShowRefreshButton="False" />
                    <Columns>
                        <Telerik:GridBoundColumn DataField="Nhom" HeaderText="Nhóm hàng hóa" UniqueName="Nhom" ReadOnly="True">
                            <HeaderStyle Width="100px" HorizontalAlign="Left"></HeaderStyle>
                            <ItemStyle Width="100px" HorizontalAlign="Left"></ItemStyle>
                        </Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn DataField="Ten" HeaderText="Tên sản phẩm" UniqueName="Ten" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </Telerik:GridBoundColumn>
                        <%--<Telerik:GridBoundColumn DataField="SanXuat" HeaderText="Nhà sản xuất" UniqueName="SanXuat" ReadOnly="True">
                            <HeaderStyle Width="100px" HorizontalAlign="Left"></HeaderStyle>
                            <ItemStyle Width="100px" HorizontalAlign="Left"></ItemStyle>
                        </Telerik:GridBoundColumn>--%>
                        <Telerik:GridBoundColumn DataField="Gia" HeaderText="Giá" UniqueName="Gia" ReadOnly="True">
                            <HeaderStyle Width="80px" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                        </Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn DataField="SoLuong" HeaderText="Số lượng" UniqueName="SoLuong">
                            <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                        </Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn>
                            <HeaderStyle Width="100px" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <button runat="server" onclick="saveAll()">Đặt hàng</button>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </Telerik:RadGrid>
        </div>
    </div>

    <Telerik:RadAjaxManager runat="server" ID="ram2">
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="grid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="loadingpanel" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="BtnSearch">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="loadingpanel" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManager>
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    <Telerik:RadAjaxLoadingPanel runat="server" ID="loadingpanel" Skin="Metro" />
</asp:Content>
