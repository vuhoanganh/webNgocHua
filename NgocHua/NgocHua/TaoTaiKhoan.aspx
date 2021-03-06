﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TaoTaiKhoan.aspx.cs" Inherits="NgocHua.TaoTaiKhoan" %>

<%@ register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
                <h4>Đăng ký</h4>
            </div>

            <div class="page-content">
                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>E-Mail*</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="text" runat="server" id="txtEmail"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Tên đăng nhập*</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="text" runat="server" id="txtUsername"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Mật khẩu*</p>
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

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Họ tên*</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="text" runat="server" id="txtTen"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Địa chỉ</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="text" runat="server" id="txtAddress"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <p>Điện thoại</p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <input type="text" runat="server" id="txtPhone"/>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <input class="big" type="submit" value="Đăng ký" runat="server" OnServerClick="OnServerClick"/>
                        <input class="big" type="reset" value="Xóa thông tin"/>
                    </div>

                </div>
            </div>

        </div>

    </div>
    
    <Telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    <Telerik:RadAjaxLoadingPanel runat="server" ID="loadingpanel" Skin="Metro" />
</asp:Content>
