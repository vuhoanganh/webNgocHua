<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="NgocHua.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="mainSlide">
    <div class="flexslider flexsliderBig" runat="server" id="divSlide">
        <li id="slide1" style="background: rgba(0, 0, 0, 0) url('[IMG]') no-repeat scroll 0 0">
            <div class="text">

                <div class="bg"></div>

                <div class="title">
                </div>

                <div class="desc">
                </div>

                <div class="button">
                </div>

            </div>
        </li>
    </div>
    <%--<ul class="slides">
            <li id="slide1">
                <div class="text">

                    <div class="bg"></div>

                    <div class="title">
                        <h2><strong>Lorem Ipsum Dolor</strong></h2>
                    </div>

                    <div class="desc">
                        <h3>All the power in your hands!</h3>
                        <span>From <span class="price">$960.00</span></span>
                    </div>

                    <div class="button">
                        <a class="button big red" href="#">Buy Now</a>
                    </div>

                </div>
            </li>
        </ul>--%>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="bannerItems">
    <%--<div class="left-side-banner banner-item icon-on-right gray">
        <h4>8(802)234-5678</h4>
        <p>Monday - Saturday: 8am - 5pm PST</p>
        <i class="icons icon-phone-outline"></i>
    </div>

    <a href="#">
        <div class="middle-banner banner-item icon-on-left light-blue">
            <h4>Free shipping</h4>
            <p>on all orders over $99</p>
            <span class="button">Learn more</span>
            <i class="icons icon-truck-1"></i>
        </div>
    </a>

    <a href="#">
        <div class="right-side-banner banner-item orange">
            <h4>Crazy sale!</h4>
            <p>on selected items</p>
            <span class="button">Shop now</span>
        </div>
    </a>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Hàng mới -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Hàng Mới</h4>
                <div class="carousel-arrows">
                    <i class="icons icon-left-dir"></i>
                    <i class="icons icon-right-dir"></i>
                </div>
            </div>

        </div>
        <!-- /Carousel Heading -->

        <!-- Carousel -->
        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

            <div class="owl-carousel" data-max-items="3" id="slideNew" runat="server">
            </div>
        </div>
        <!-- /Carousel -->

    </div>
    <!-- /Hàng mới -->

    <!-- Hàng bán chạy -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Hàng bán chạy</h4>
                <div class="carousel-arrows">
                    <i class="icons icon-left-dir"></i>
                    <i class="icons icon-right-dir"></i>
                </div>
            </div>

        </div>
        <!-- /Carousel Heading -->

        <!-- Carousel -->
        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

            <div class="owl-carousel" data-max-items="3" id="slideHot" runat="server">
            </div>
        </div>
        <!-- /Carousel -->

    </div>
    <!-- /Hàng bán chạy -->





    <!-- Hàng giảm giá -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Hàng Giảm Giá</h4>
                <div class="carousel-arrows">
                    <i class="icons icon-left-dir"></i>
                    <i class="icons icon-right-dir"></i>
                </div>
            </div>

        </div>
        <!-- /Carousel Heading -->

        <!-- Carousel -->
        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

            <div class="owl-carousel" data-max-items="3" id="slideSale" runat="server">
            </div>
        </div>
        <!-- /Carousel -->

    </div>
    <!-- /Hàng giảm giá -->

</asp:Content>
