<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BannerLogo.aspx.cs" Inherits="NgocHua.Admin.BannerLogo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    <asp:Label runat="server" ID="lblHeader"></asp:Label>
                </header>
                <div class="panel-body">
                    <div class="form-horizontal tasi-form">
                       <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Hình</label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="fileBanner" AllowMultiple="False" runat="server"/>
                                <div style="margin-top: 10px">
                                    <asp:Image runat="server" ID="imgBanner" /></div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button onclick="back()" type="button" class="btn btn-default">Trở về</button>
                        </div>
                        <div class="col-sm-4">
                            <button onserverclick="btnSaveBanner_OnServerClick" id="btnSaveBanner" type="button" class="btn btn-primary" runat="server">Lưu</button>
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
            document.location = "../../Admin/HinhDong";
        }
    </script>
</asp:Content>
