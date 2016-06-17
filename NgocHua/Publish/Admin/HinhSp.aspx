<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="HinhSp.aspx.cs" Inherits="NgocHua.Admin.HinhSp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--Sản phẩm--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="panel-body table-responsive">
        <div style="float: left">
            <asp:FileUpload ID="fileImport" runat="server" AllowMultiple="True" />
        </div>
        <div style="float: left; margin-left: 10px;">
            <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary" Text="Upload hình" OnClick="btnImport_Click" />
        </div>
        <asp:Label ID="listofuploadedfiles" runat="server" />
        <Telerik:RadGrid ID="grid" OnNeedDataSource="grid_OnNeedDataSource" runat="server"
            OnDeleteCommand="grid_OnDeleteCommand" AllowSorting="True" AllowPaging="True"
            PageSize="20" CssClass="table table-hover" Skin="Metro">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
                <Columns>
                    <Telerik:GridBoundColumn DataField="Id" HeaderText="Id" UniqueName="Id">
                        <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                    </Telerik:GridBoundColumn>
                    <Telerik:GridTemplateColumn DataField="Url" HeaderText="Hình" UniqueName="Url">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%# "~/img/products/" + Eval("Url") %>' Height="150" />
                        </ItemTemplate>
                    </Telerik:GridTemplateColumn>
                    <Telerik:GridButtonColumn ConfirmText="Bạn có chắc chắn xóa hình này ko?" ConfirmDialogType="RadWindow"
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
