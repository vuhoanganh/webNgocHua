<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="NgocHua.ChiTiet" %>

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

                    <h2 id="lblTen" runat="server"></h2>
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

                    <span class="price" id="lblGia" runat="server"></span>

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
                        <tr>
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
                        </tr>
                    </table>

                    <div class="social-share">
                        <iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=21" style="border: none; overflow: hidden; height: 21px; width: 100px;"></iframe>

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

                        <%--<div id="tab2">

                            <div class="row">

                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="category-results">
                                        <p>Results 1-6 of 6</p>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="pagination">
                                        <a href="#">
                                            <div class="previous"><i class="icons icon-left-dir"></i></div>
                                        </a>
                                        <a href="#">
                                            <div class="page-button">1</div>
                                        </a>
                                        <a href="#">
                                            <div class="page-button">2</div>
                                        </a>
                                        <a href="#">
                                            <div class="page-button">3</div>
                                        </a>
                                        <a href="#">
                                            <div class="next"><i class="icons icon-right-dir"></i></div>
                                        </a>
                                    </div>
                                </div>

                            </div>

                            <ul class="comments">
                                <li>
                                    <p><strong><a href="#">Anna Doe</a></strong></p>
                                    <span class="date">2013-10-09 09:23</span>
                                    <i class="icons green icon-thumbs-up-alt"></i>
                                    <i class="icons sum no-pointer green-sum">1</i>
                                    <i class="icons red icon-thumbs-down-alt"></i>
                                    <i class="icons icon-reply"></i>
                                    <div class="rating-box">
                                        <div class="rating readonly-rating" data-score="4"></div>
                                    </div>
                                    <br>
                                    <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>

                                </li>
                                <li>
                                    <p><strong><a href="#">Anna Doe</a></strong></p>
                                    <span class="date">2013-10-09 09:23</span>
                                    <i class="icons green icon-thumbs-up-alt"></i>
                                    <i class="icons sum no-pointer">0</i>
                                    <i class="icons red icon-thumbs-down-alt"></i>
                                    <i class="icons icon-reply"></i>
                                    <div class="rating-box">
                                        <div class="rating readonly-rating" data-score="4"></div>
                                    </div>
                                    <br>
                                    <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>

                                    <ul>
                                        <li>
                                            <p><strong><a href="#">Anna Doe</a></strong></p>
                                            <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <p><strong><a href="#">Anna Doe</a></strong></p>
                                    <span class="date">2013-10-09 09:23</span>
                                    <i class="icons green icon-thumbs-up-alt"></i>
                                    <i class="icons sum no-pointer red-sum">-2</i>
                                    <i class="icons red icon-thumbs-down-alt"></i>
                                    <i class="icons icon-reply"></i>
                                    <div class="rating-box">
                                        <div class="rating readonly-rating" data-score="4"></div>
                                    </div>
                                    <br>
                                    <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>

                                </li>
                            </ul>

                            <h3>WRITE A REVIEW</h3>
                            <p>Now please write a (short) review....(min. 200, max. 2000 characters)</p>
                            <textarea id="review-textarea"></textarea>
                            <p>First: Rate the product. Please select a rating between 0 (poorest) and 5 stars (best)</p>
                            <div class="rating-box">
                                Rating: 
												<div class="rating rate" data-score="3"></div>
                            </div>
                            <div class="char-counter">
                                <label>Characters written</label>
                                <input data-target="#review-textarea" type="text">
                            </div>
                            <br>
                            <input type="submit" class="dark-blue big" value="Submit a review">
                        </div>--%>

                        <%--<div id="tab3">
                            <ul class="comments">
                                <li>
                                    <p><strong><a href="#">Anna Doe</a></strong></p>
                                    <span class="date">2013-10-09 09:23</span>
                                    <i class="icons icon-reply"></i>
                                    <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>

                                </li>
                                <li>
                                    <p><strong><a href="#">Anna Doe</a></strong></p>
                                    <span class="date">2013-10-09 09:23</span>
                                    <i class="icons icon-reply"></i>
                                    <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>

                                    <ul>
                                        <li>
                                            <p><strong><a href="#">Anna Doe</a></strong></p>
                                            <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <p><strong><a href="#">Anna Doe</a></strong></p>
                                    <span class="date">2013-10-09 09:23</span>
                                    <i class="icons icon-reply"></i>
                                    <p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque.</p>
                                </li>
                            </ul>
                            <a href="#" class="button home-green"><i class="icons icon-spinner"></i>Refresh comments list</a>
                            <a href="#" class="button orange"><i class="icons icon-rss"></i>RSS feed for comments to this post</a>
                            <br />
                            <br />
                            <div class="row">

                                <div class="col-lg-6 col-md-6 col-sm-8">
                                    <h3>ADD A COMMENT</h3>
                                    <label>Name (required)</label>
                                    <input type="text">
                                    <br>
                                    <br>
                                    <label>E-mail (required, but will not display)</label>
                                    <input type="text">
                                    <br>
                                    <br>
                                    <label>Website (required)</label>
                                    <input type="text">
                                    <br>
                                    <br>
                                    <label>Comment (required)</label>
                                    <textarea></textarea>
                                    <br>
                                    <br>
                                    <input id="comments-checkbox" type="checkbox"><label for="comments-checkbox">Notify me of follow-up comments</label>
                                    <br>
                                    <br>
                                    <img src="img/captcha.jpg" alt="">
                                    <br>
                                    <br>
                                    <div class="row">

                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <label><a href="#">Refresh</a></label>
                                            <input type="text">
                                        </div>

                                    </div>
                                    <br>
                                    <input type="submit" value="Submit comment" class="dark-blue big">
                                </div>

                            </div>

                        </div>--%>
                    </div>

                </div>

            </div>

        </div>
        <!-- /Product Tabs -->

    </div>


    <!-- New Collection -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Related Products</h4>
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
    <!-- /New Collection -->





    <!-- Recently Viewed Products -->
    <div class="products-row row">

        <!-- Carousel Heading -->
        <div class="col-lg-12 col-md-12 col-sm-12">

            <div class="carousel-heading">
                <h4>Recently Viewed Products</h4>
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
                            <img src="img/products/sample4.jpg" alt="Product1">
                            <a href="products_page_v1.html" class="product-hover">
                                <i class="icons icon-eye-1"></i>Quick View
                            </a>
                        </div>

                        <div class="product-info">
                            <h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
                            <p class="product-categories"><a href="#">Computers &amp; Tablets</a></p>
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
                            <p class="product-categories"><a href="#">Computers &amp; Tablets</a></p>
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
                            <p class="product-categories"><a href="#">Computers &amp; Tablets</a></p>
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
                            <p class="product-categories"><a href="#">Computers &amp; Tablets</a></p>
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
                            <p class="product-categories"><a href="#">Computers &amp; Tablets</a></p>
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
                            <p class="product-categories"><a href="#">Computers &amp; Tablets</a></p>
                        </div>

                    </div>
                    <!-- /Carousel Item -->
                </div>
                <!-- /Slide -->


            </div>
        </div>
        <!-- /Carousel -->


    </div>
    <!-- /Recently Viewed Products -->



    <!-- Product Buttons -->
    <div class="row button-row">

        <div class="col-lg-5 col-md-5 col-sm-5">
            <a class="button grey regular" href="#"><i class="icons icon-reply"></i>BACK TO: Computers &amp; Tablets</a>
        </div>

        <div class="col-lg-7 col-md-7 col-sm-7 align-right">
            <a class="button grey regular" href="#"><i class="icons icon-left-dir"></i>PREVIOUS PRODUCT</a>
            <a class="button grey regular right-icon" href="#">NEXT PRODUCT <i class="icons icon-right-dir"></i></a>
        </div>

    </div>
    <!-- /Product Buttons -->

</asp:Content>
