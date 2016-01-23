<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChonHang.aspx.cs" Inherits="NgocHua.ChonHang" %>

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

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">

            <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
                AllowSorting="True" AllowPaging="True"
                OnBatchEditCommand="grid_OnBatchEditCommand"
                PageSize="40" Skin="Metro">
                <MasterTableView CommandItemDisplay="TopAndBottom" EditMode="Batch" AutoGenerateColumns="False" DataKeyNames="Id">
                    <CommandItemSettings ShowSaveChangesButton="true" ShowAddNewRecordButton="False" ShowCancelChangesButton="False"
                        SaveChangesText="Thêm vào giỏ hàng" ShowRefreshButton="False"/>
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
                        <%--<Telerik:GridTemplateColumn UniqueName="EditCommandColumn">
                            <ItemTemplate>
                                <asp:Button ID="BtnInsertOrder" Text="Mua" runat="server" OnClick="BtnInsertOrder_Click" />
                            </ItemTemplate>
                            <HeaderStyle Width="70px" HorizontalAlign="Center" />
                            <ItemStyle Width="70px" HorizontalAlign="Center" />
                        </Telerik:GridTemplateColumn>--%>
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
            <Telerik:AjaxSetting AjaxControlID="BtnInsertOrder">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="loadingpanel" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManager>
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    <Telerik:RadAjaxLoadingPanel runat="server" ID="loadingpanel" Skin="Metro" />
</asp:Content>
