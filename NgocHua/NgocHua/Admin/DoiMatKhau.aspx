<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="NgocHua.Admin.DoiMatKhau" %>
<%@ Register TagPrefix="Telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2016.1.113.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainSlide" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bannerItems" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainContent" runat="server">

    <div class="row">

        <div class="col-lg-12 col-md-12 col-sm-12 register-account">

            <div class="carousel-heading no-margin">
                <h4>Đổi mật khẩu</h4>
            </div>

            <div class="page-content">
                
                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Mật khẩu mới*</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="password" runat="server" id="txtPassword"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Xác nhận mật khẩu</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="password" runat="server" id="txtCPassword"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <input class="big" type="submit" value="Xác nhận" runat="server" OnServerClick="OnServerClick"/>
                    </div>

                </div>
            </div>

        </div>

    </div>
    
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    <Telerik:RadAjaxLoadingPanel runat="server" ID="loadingpanel" Skin="Metro" />
</asp:Content>
