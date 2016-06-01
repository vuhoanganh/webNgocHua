<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="NgocHua.SanPham" %>

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
                <div class="col-md-4" style="padding: 10px">
                    <div class="product-image">
                        <img src="<%# Eval("Img") %>" alt="Product1" width="270" height="270">
                        <a href="<%# Eval("Link") %>" class="product-hover">
                            <i class="icons icon-eye-1"></i>Xem nhanh
                        </a>
                    </div>

                    <div class="product-info">
                        <h5><a href="<%# Eval("Link") %>" style="color: red"><%# Eval("Ten") %></a></h5>
                        <span><%# Eval("Gia") %></span>
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
