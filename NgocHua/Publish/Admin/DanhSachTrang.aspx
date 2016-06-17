<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DanhSachTrang.aspx.cs" Inherits="NgocHua.Admin.DanhSachTrang" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--Sản phẩm--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="panel-body table-responsive">
        <a href="GioiThieu" class="btn btn-primary">Thêm mới</a>
        <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
            OnItemCommand="grid_OnItemCommand" OnDeleteCommand="grid_OnDeleteCommand" AllowSorting="True" AllowPaging="True"
            PageSize="20" CssClass="table table-hover" Skin="Metro">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
                <Columns>
                    <Telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" UniqueName="EditCommandColumn">
                        <HeaderStyle Width="30px" HorizontalAlign="Center" />
                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                    </Telerik:GridButtonColumn>
                    <Telerik:GridBoundColumn DataField="Name" HeaderText="Tên trang" UniqueName="Name">
                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridButtonColumn ConfirmText="Bạn có chắc chắn xóa trang này ko?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Xóa" ButtonType="ImageButton" CommandName="Delete" Text="Xóa"
                        UniqueName="DeleteColumn">
                        <ItemStyle Width="30px" />
                        <HeaderStyle Width="30px" />
                    </Telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>
        </Telerik:RadGrid>
    </div>
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
</asp:Content>
