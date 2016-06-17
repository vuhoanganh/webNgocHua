<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="NgocHua.GioHang" %>

<%@ register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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

        function Grid_RowDataBound(sender, args) {
            if (confirm('Bỏ sản phẩm này khỏi giỏ hàng?')) {
                var item = args.get_item();
                var data = args.get_dataItem();
                var btn = $find('DeleteColumn');
                btn.add_clicking(delegate);
            }
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
                <h4>Giỏ hàng</h4>
            </div>
        </div>
        <!-- /Heading -->
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">

            <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
                AllowSorting="False" AllowPaging="True" OnItemCommand="grid_OnItemCommand"
                OnBatchEditCommand="grid_OnBatchEditCommand" OnDeleteCommand="grid_OnDeleteCommand" Skin="Metro" PageSize="50">
                <ClientSettings>
                    <ClientEvents OnCommand="Grid_Command" OnRowDataBound="Grid_RowDataBound" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="None" EditMode="Batch" AutoGenerateColumns="False" DataKeyNames="Id">
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
                            <HeaderStyle Width="80px" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                        </Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn DataField="SoLuong" HeaderText="Số lượng" UniqueName="SoLuong">
                            <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                        </Telerik:GridBoundColumn>
                        <Telerik:GridButtonColumn ConfirmText="Bỏ sản phẩm này khỏi giỏ hàng?" ConfirmDialogType="RadWindow"
                            ButtonType="ImageButton" CommandName="Delete" UniqueName="DeleteColumn">
                            <ItemStyle Width="30px" />
                            <HeaderStyle Width="30px" />
                        </Telerik:GridButtonColumn>
                    </Columns>
                </MasterTableView>
            </Telerik:RadGrid>
            <button runat="server" onclick="saveAll()">Xác nhận đơn hàng</button>
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
