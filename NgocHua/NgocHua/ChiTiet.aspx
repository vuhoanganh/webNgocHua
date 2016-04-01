﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="NgocHua.ChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainSlide" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bannerItems" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainContent" runat="server">

    <div id="product-single">

        <!-- Product -->
        <div class="product-single">

            <div class="row">

                <!-- Product Images Carousel -->
                <div class="col-lg-5 col-md-5 col-sm-5 product-single-image">

                    <div id="product-slider">
                        <ul class="slides" id="imgMain" runat="server">
                            <li>
                                <img class="cloud-zoom" src="[IMG1]" data-large="[IMG2]" alt="" />
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /Product Images Carousel -->


                <div class="col-lg-7 col-md-7 col-sm-7 product-single-info">

                    <h2 id="lblTen" runat="server" style="color: red"></h2>
                    <table>
                        <tr>
                            <td>Nhà Sản Xuất</td>
                            <td><a href="#" id="lblSanxuat" runat="server"></a></td>
                        </tr>
                        <%--<tr>
                            <td>Availability</td>
                            <td><span class="green">in stock</span> 20 items</td>
                        </tr>--%>
                        <%--<tr>
                            <td>Product code</td>
                            <td>PBS173</td>
                        </tr>--%>
                    </table>

                    <%-- <strong>Product Dimensions</strong>
                    <table>
                        <tr>
                            <td>Product Width</td>
                            <td>10.00000M</td>
                        </tr>
                        <tr>
                            <td>Product Length</td>
                            <td>10.00000M</td>
                        </tr>
                    </table>--%>

                    <span id="lblGia" runat="server"></span>

                    <table class="product-actions-single">
                        <%--<tr>
                            <td>Color:</td>
                            <td>
                                <select class="chosen-select">
                                    <option>Red +$25.00</option>
                                    <option>Red +$25.00</option>
                                    <option>Red +$25.00</option>
                                    <option>Red +$25.00</option>
                                </select>
                            </td>
                        </tr>--%>
                        <%--<tr>
                            <td>Số lượng mua:</td>
                            <td>
                                <div class="numeric-input">
                                    <input id="txtSoluong" type="text" value="1" runat="server" />
                                    <span class="arrow-up"><i class="icons icon-up-dir"></i></span>
                                    <span class="arrow-down"><i class="icons icon-down-dir"></i></span>
                                </div>
                                <a href="#">
                                    <span class="add-to-cart">
                                        <span class="action-wrapper">
                                            <i class="icons icon-basket-2"></i>
                                            <span class="action-name">Thêm vào giỏ hàng</span>
                                        </span>
                                    </span>
                                </a>
                            </td>
                        </tr>--%>
                    </table>

                    <div class="social-share">
                        <%--<iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=21" style="border: none; overflow: hidden; height: 21px; width: 100px;"></iframe>--%>

                        <!-- Place this tag where you want the +1 button to render. -->
                        <div class="g-plusone" data-size="medium"></div>

                        <!-- Place this tag after the last +1 button tag. -->
                        <script type="text/javascript">
                            (function () {
                                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                po.src = 'https://apis.google.com/js/platform.js';
                                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                            })();
                        </script>

                    </div>

                </div>

            </div>

        </div>
        <!-- /Product -->


        <!-- Product Tabs -->
        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12">

                <div class="tabs">

                    <div class="tab-heading">
                        <a href="#tab1" class="button big">Thông tin sản phẩm</a>
                        <%--<a href="#tab2" class="button big">Reviews</a>
                        <a href="#tab3" class="button big">Comments</a>--%>
                    </div>

                    <div class="page-content tab-content">

                        <div id="tab1">
                            <label id="lblChitiet" runat="server"></label>
                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- /Product Tabs -->

    </div>



    <!-- Product Buttons -->
    <%--<div class="row button-row">

        <div class="col-lg-5 col-md-5 col-sm-5">
            <a class="button grey regular" href="#"><i class="icons icon-reply"></i>BACK TO: Computers &amp; Tablets</a>
        </div>

        <div class="col-lg-7 col-md-7 col-sm-7 align-right">
            <a class="button grey regular" href="#"><i class="icons icon-left-dir"></i>PREVIOUS PRODUCT</a>
            <a class="button grey regular right-icon" href="#">NEXT PRODUCT <i class="icons icon-right-dir"></i></a>
        </div>

    </div>--%>
    <!-- /Product Buttons -->

</asp:Content>
