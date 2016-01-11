using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NgocHua.CustomTemplate
{
    public class ItemSlideTemplate
    {
        public string TemplateHtml { get; set; }

        public ItemSlideTemplate()
        {
            TemplateHtml = "<div>";
            TemplateHtml += "<div class='product'>";
            TemplateHtml += "<div class='product-image'>";
            TemplateHtml += "<img src='[SRC]' alt='[ALT]'>";
            TemplateHtml += "<a href='[HREF]' class='product-hover'>";
            TemplateHtml += "<i class='icons icon-eye-1'></i>Xem nhanh</a></div>";
            TemplateHtml += "<div class='product-info'>";
            TemplateHtml += "<h5><a href='[HREF1]'>[NAME]</a></h5>";
            TemplateHtml += "<span class='price'>[GIA]</span></div>";
            TemplateHtml += "<div class='product-actions'>";
            TemplateHtml += "<span class='add-to-cart'>";
            TemplateHtml += "<span class='action-wrapper'>";
            TemplateHtml += "<i class='icons icon-basket-2'></i>";
            TemplateHtml += "<span class='action-name'>Thêm vào giỏ hàng</span></span></span></div></div>";
            TemplateHtml += "</div>";
        }
    }
}