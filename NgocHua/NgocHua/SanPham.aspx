<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="NgocHua.SanPham" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .RadDataPager_MetroTouch {
            padding: 0 !important;
            border: none !important;
            /*background: none !important;*/
        }

            .RadDataPager_MetroTouch .rdpNumPart a {
                border-radius: 0 !important;
                height: 30px !important;
            }

                .RadDataPager_MetroTouch .rdpNumPart a.rdpCurrentPage, .RadDataPager_MetroTouch .rdpNumPart a.rdpCurrentPage:hover {
                    background-color: #dde3e6 !important;
                    border: 1px solid #dde3e6 !important;
                    color: #111 !important;
                    height: 30px !important;
                }

            .RadDataPager_MetroTouch .rdpPageFirst, .RadDataPager_MetroTouch .rdpPagePrev, .RadDataPager_MetroTouch .rdpPageNext, .RadDataPager_MetroTouch .rdpPageLast {
                border-radius: 0 !important;
                border: none !important;
                height: 30px !important;
            }

                .RadDataPager_MetroTouch .rdpPageFirst:hover, .RadDataPager_MetroTouch .rdpPagePrev:hover, .RadDataPager_MetroTouch .rdpPageNext:hover, .RadDataPager_MetroTouch .rdpPageLast:hover {
                    background-color: #dde3e6 !important;
                    border: 1px solid #dde3e6 !important;
                    height: 30px !important;
                }

        .rdpWrap {
            line-height: 0 !important;
            padding: 0 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainSlide" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bannerItems" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainContent" runat="server">
    <Telerik:RadScriptManager runat="server"></Telerik:RadScriptManager>

    <div class="row">

        <!-- Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>
                    <asp:Label runat="server" ID="lbHeader" /></h4>
            </div>

        </div>
        <!-- /Heading -->

    </div>

    <div class="row">

        <div class="col-lg-12 col-md-12 col-sm-12">
            <Telerik:RadDataPager ID="RadDataPager1" runat="server" PagedControlID="listView"
                PageSize="15" Skin="MetroTouch" CssClass="pull-right">
                <Fields>
                    <Telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                    <Telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="5" />
                    <Telerik:RadDataPagerButtonField FieldType="NextLast" />
                </Fields>
            </Telerik:RadDataPager>
        </div>

    </div>

    <div class="row">
        <!-- Product Item -->
        <Telerik:RadListView runat="server" ID="listView" AllowPaging="True" OnNeedDataSource="listView_OnNeedDataSource"
            ItemPlaceholderID="ProductsHolder" BorderWidth="0px" BorderStyle="NotSet">
            <LayoutTemplate>
                <asp:Panel ID="ProductsHolder" runat="server" />

            </LayoutTemplate>
            <ItemTemplate>
                <div class="col-md-4" style="padding: 20px 15px">
                    <div class="product-image">
                        <img src="<%# Eval("Img") %>" alt="Product1">
                        <a href="<%# Eval("Link") %>" class="product-hover">
                            <i class="icons icon-eye-1"></i>Xem nhanh
                        </a>
                    </div>

                    <div class="product-info">
                        <h5><a href="<%# Eval("Link") %>"><%# Eval("Ten") %></a></h5>
                        <span class="price"><%# Eval("Gia") %></span>
                    </div>

                    <div class="product-actions">
                        <span class="add-to-cart">
                            <span class="action-wrapper">
                                <i class="icons icon-basket-2"></i>
                                <span class="action-name">Thêm vào giỏ hàng</span>
                            </span>
                        </span>
                    </div>
                </div>
            </ItemTemplate>
        </Telerik:RadListView>
        <!-- Product Item -->

    </div>

    <div class="row">

        <div class="col-lg-12 col-md-12 col-sm-12">
            <Telerik:RadDataPager ID="RadDataPager2" runat="server" PagedControlID="listView"
                PageSize="15" Skin="MetroTouch" CssClass="pagination">
                <Fields>
                    <Telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                    <Telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="5" />
                    <Telerik:RadDataPagerButtonField FieldType="NextLast" />
                </Fields>
            </Telerik:RadDataPager>
        </div>

    </div>


</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="footerContent">

    <div id="main-footer">

        <div class="row">

            <!-- Information -->
            <div class="col-lg-3 col-md-3 col-sm-6">
                <h4>Information</h4>
                <ul>
                    <li><a href="#"><i class="icons icon-right-dir"></i>About Us</a></li>
                    <li><a href="#"><i class="icons icon-right-dir"></i>New Collection</a></li>
                    <li><a href="#"><i class="icons icon-right-dir"></i>Bestsellers</a></li>
                    <li><a href="#"><i class="icons icon-right-dir"></i>Manufacturers</a></li>
                    <li><a href="#"><i class="icons icon-right-dir"></i>Privacy Policy</a></li>
                    <li><a href="#"><i class="icons icon-right-dir"></i>Terms &amp; Conditions</a></li>
                </ul>
            </div>
            <!-- /Information -->


            <!-- Like us on Facebook -->
            <div class="col-lg-3 col-md-3 col-sm-6 facebook-iframe">
                <h4>Like us on Facebook</h4>

            </div>
            <!-- /Like us on Facebook -->


            <!-- Contact Us -->
            <div class="col-lg-3 col-md-3 col-sm-6 contact-footer-info">
                <h4>Contact Us</h4>
                <ul>
                    <li><i class="icons icon-location"></i>8901 Marmora Road, Glasgow, D04 89GR.</li>
                    <li><i class="icons icon-phone"></i>+1 800 603 6035</li>
                    <li><i class="icons icon-mail-alt"></i><a href="mailto:mail@company.com">mail@companyname.com</a></li>
                    <li><i class="icons icon-skype"></i>homeshop</li>
                </ul>

                <!-- Social Media -->
                <div class="social-media">
                    <ul>
                        <li class="social-googleplus tooltip-hover" data-toggle="tooltip" data-placement="top" title="Google+"><a href="#"></a></li>
                        <li class="social-facebook tooltip-hover" data-toggle="tooltip" data-placement="top" title="Facebook"><a href="#"></a></li>
                        <li class="social-pinterest tooltip-hover" data-toggle="tooltip" data-placement="top" title="Pinterest"><a href="#"></a></li>
                        <li class="social-twitter tooltip-hover" data-toggle="tooltip" data-placement="top" title="Twitter"><a href="#"></a></li>
                        <li class="social-youtube tooltip-hover" data-toggle="tooltip" data-placement="top" title="Youtube"><a href="#"></a></li>
                    </ul>
                </div>
                <!-- /Social Media -->

            </div>
            <!-- /Contact Us -->


            <!-- Newsletter -->
            <div class="col-lg-3 col-md-3 col-sm-6">
                <form id="newsletter" action="php/newsletter.php">
                    <h4>Newsletter Sign Up</h4>
                    <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                    <input type="text" name="newsletter-email" placeholder="Enter your email address">
                    <input type="submit" name="newsletter-submit" value="Submit">
                </form>
            </div>
            <!-- /Newsletter -->

        </div>

    </div>
</asp:Content>
