<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="NgocHua.Admin.SanPham" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="panel-body table-responsive">
        <div class="box-tools m-b-15">
            <div class="input-group">
                <input type="text" id="txtSearch" name="table_search" class="form-control input-sm pull-right" style="width: 250px;" placeholder="Tìm kiếm" runat="server" />
                <div class="input-group-btn">
                    <button class="btn btn-sm btn-default" runat="server" id="btnSearch" OnServerClick="btnSearch_OnServerClick"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </div>

        <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
            OnItemCommand="grid_OnItemCommand" OnDeleteCommand="grid_OnDeleteCommand" AllowSorting="True" AllowPaging="True"
            PageSize="20" CssClass="table table-hover" Skin="Metro">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
                <Columns>
                    <Telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" UniqueName="EditCommandColumn">
                        <HeaderStyle Width="30px" HorizontalAlign="Center" />
                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                    </Telerik:GridButtonColumn>
                    <Telerik:GridBoundColumn DataField="Stt" HeaderText="Stt" UniqueName="Stt">
                        <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridBoundColumn DataField="Nhom" HeaderText="Nhóm hàng hóa" UniqueName="Nhom">
                        <HeaderStyle Width="200px" HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle Width="200px" HorizontalAlign="Left"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridBoundColumn DataField="Ten" HeaderText="Tên sản phẩm" UniqueName="Ten">
                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridBoundColumn DataField="DonVi" HeaderText="Đơn vị tính" UniqueName="DonVi">
                        <HeaderStyle Width="90px" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridBoundColumn DataField="SanXuat" HeaderText="Nhà sản xuất" UniqueName="SanXuat">
                        <HeaderStyle Width="150px" HorizontalAlign="Left"></HeaderStyle>
                        <ItemStyle Width="150px" HorizontalAlign="Left"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridBoundColumn DataField="Gia" HeaderText="Giá" UniqueName="Gia">
                        <HeaderStyle Width="90px" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridButtonColumn ConfirmText="Bạn có chắc chắn xóa sản phẩm này ko?" ConfirmDialogType="RadWindow"
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
