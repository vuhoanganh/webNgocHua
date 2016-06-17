<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="NgocHua.Admin.DonHang" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Đơn Hàng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
        OnItemCommand="grid_OnItemCommand" AllowSorting="True" AllowPaging="True"
        PageSize="20" CssClass="table table-hover" Skin="Metro">
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
            <Columns>
                <Telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" UniqueName="EditCommandColumn">
                    <HeaderStyle Width="30px" HorizontalAlign="Center" />
                    <ItemStyle Width="30px" HorizontalAlign="Center" />
                </Telerik:GridButtonColumn>
                <Telerik:GridBoundColumn DataField="Id" HeaderText="Stt" UniqueName="Id">
                    <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="User" HeaderText="Người đặt hàng" UniqueName="User">
                    <HeaderStyle Width="200px" HorizontalAlign="Left"></HeaderStyle>
                    <ItemStyle Width="200px" HorizontalAlign="Left"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="Date" HeaderText="Ngày đặt hàng" UniqueName="Date">
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="TinhTrang" HeaderText="Tình trạng" UniqueName="TinhTrang">
                    <HeaderStyle Width="90px" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
                </Telerik:GridBoundColumn>
                <Telerik:GridBoundColumn DataField="Total" HeaderText="Tổng tiền" UniqueName="Total">
                    <HeaderStyle Width="150px" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="150px" HorizontalAlign="Center"></ItemStyle>
                </Telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </Telerik:RadGrid>
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptContent" runat="server">
   
</asp:Content>
