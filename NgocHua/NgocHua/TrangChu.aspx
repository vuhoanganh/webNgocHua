﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="NgocHua.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="mainSlide">
    <div class="flexslider flexsliderBig">
        <ul class="slides">
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
            <li id="slide2">
                <div class="text">

                    <div class="bg"></div>

                    <div class="title">
                        <h2><strong>The New Studio<br>
                            Original Headphones</strong></h2>
                    </div>

                    <div class="desc">
                        <h3>Lorem ipsum dolor</h3>
                        <span>From <span class="price">$399.00</span></span>
                    </div>

                    <div class="button">
                        <a class="button big red" href="#">Buy Now</a>
                    </div>

                </div>
            </li>
            <li id="slide3">
                <div class="text">

                    <div class="bg"></div>

                    <div class="title">
                        <h2>The New <strong>Laptop</strong></h2>
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
        </ul>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="bannerItems">
    <div class="left-side-banner banner-item icon-on-right gray">
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
    </a>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Featured Products -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Featured Products</h4>
                <div class="carousel-arrows">
                    <i class="icons icon-left-dir"></i>
                    <i class="icons icon-right-dir"></i>
                </div>
            </div>

        </div>
        <!-- /Carousel Heading -->

        <!-- Carousel -->
        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

            <div class="owl-carousel" data-max-items="3">

                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample1.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <span class="product-tag">Sale</span>
                            <img src="img/products/sample2.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->



                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample3.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->




                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample1.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->




                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample2.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->





                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample3.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


            </div>
        </div>
        <!-- /Carousel -->

    </div>
    <!-- /Featured Products -->




    <!-- New Collection -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>New Collection</h4>
                <div class="carousel-arrows">
                    <i class="icons icon-left-dir"></i>
                    <i class="icons icon-right-dir"></i>
                </div>
            </div>

        </div>
        <!-- /Carousel Heading -->

        <!-- Carousel -->
        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

            <div class="owl-carousel" data-max-items="3">

                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <span class="product-tag">Sale</span>
                            <img src="img/products/sample4.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample5.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->



                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample6.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->




                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample4.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->




                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample5.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->





                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample6.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


            </div>
        </div>
        <!-- /Carousel -->

    </div>
    <!-- /New Collection -->





    <!-- Random Products -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Random Products</h4>
                <div class="carousel-arrows">
                    <i class="icons icon-left-dir"></i>
                    <i class="icons icon-right-dir"></i>
                </div>
            </div>

        </div>
        <!-- /Carousel Heading -->

        <!-- Carousel -->
        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

            <div class="owl-carousel" data-max-items="3">

                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample7.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample8.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->



                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample9.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->




                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample7.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->




                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample8.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->





                <!-- Slide -->
                <div>
                    <!-- Carousel Item -->
                    <div class="product">

                        <div class="product-image">
                            <img src="img/products/sample9.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <span class="price">$281.00</span>
                            <div class="rating readonly-rating" data-score="4"></div>
                        </div>

                        <div class="product-actions">
                            <span class="add-to-cart">
                                <span class="action-wrapper">
                                    <i class="icons icon-basket-2"></i>
                                    <span class="action-name">Add to cart</span>
                                </span>
                            </span>
                            <span class="add-to-favorites">
                                <span class="action-wrapper">
                                    <i class="icons icon-heart-empty"></i>
                                    <span class="action-name">Add to wishlist</span>
                                </span>
                            </span>
                            <span class="add-to-compare">
                                <span class="action-wrapper">
                                    <i class="icons icon-docs"></i>
                                    <span class="action-name">Add to Compare</span>
                                </span>
                            </span>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


            </div>
        </div>
        <!-- /Carousel -->

    </div>
    <!-- /Random Products -->

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
