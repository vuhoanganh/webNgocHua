using System;
using NgocHua.CustomTemplate;
using NgocHua.Repository;

namespace NgocHua
{
    public partial class TrangChu : System.Web.UI.Page
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private readonly HinhAnhRepository _haRepository = new HinhAnhRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            PrepareSlide();
        }

        private void PrepareSlide()
        {
            PrepareImgSlide();
            PrepareNewSlide();
            PrepareHotSlide();
            PrepareSaleSlide();
        }

        private void PrepareImgSlide()
        {
            var template = "<ul class='slides'>";
            foreach (var img in _haRepository.FindList("Banner"))
            {
                var body = divSlide.InnerHtml;
                template += body.Replace("[IMG]", "../img/" + img.Url);
            }
            template += "</ul>";
            divSlide.InnerHtml = template;
        }

        private void PrepareNewSlide()
        {
            var slideTemplate = new ItemSlideTemplate();
            var template = slideTemplate.TemplateHtml;
            var body = "";

            var source = _spRepository.GetByHot();
            foreach (var item in source)
            {
                body += template;

                body = body.Replace("[SRC]", "img/products/single1.jpg");
                body = body.Replace("[ALT]", item.Ten);
                body = body.Replace("[HREF]", "ChiTiet/" + item.Id + "/" + item.Ten);
                body = body.Replace("[HREF1]", "ChiTiet/" + item.Id + "/" + item.Ten);
                body = body.Replace("[NAME]", item.Ten);
                body = body.Replace("[GIA]", item.Gia != null && (int)item.Gia.Value > 0 ? ((int)item.Gia.Value).ToString("n0") + " đ" : "Thương lượng");
            }

            slideNew.InnerHtml = body;
        }

        private void PrepareHotSlide()
        {
            var slideTemplate = new ItemSlideTemplate();
            var template = slideTemplate.TemplateHtml;
            var body = "";

            var source = _spRepository.GetByHot();
            foreach (var item in source)
            {
                body += template;

                body = body.Replace("[SRC]", "img/products/single1.jpg");
                body = body.Replace("[ALT]", item.Ten);
                body = body.Replace("[HREF]", "SanPham/" + item.Id + "/" + item.Ten);
                body = body.Replace("[HREF1]", "SanPham/" + item.Id + "/" + item.Ten);
                body = body.Replace("[NAME]", item.Ten);
                body = body.Replace("[GIA]", item.Gia != null && (int)item.Gia.Value > 0 ? ((int)item.Gia.Value).ToString("n0") + " đ" : "Thương lượng");
            }

            slideHot.InnerHtml = body;
        }

        private void PrepareSaleSlide()
        {
            var slideTemplate = new ItemSlideTemplate();
            var template = slideTemplate.TemplateHtml;
            var body = "";

            var source = _spRepository.GetBySale();
            foreach (var item in source)
            {
                body += template;

                body = body.Replace("[SRC]", "img/products/single1.jpg");
                body = body.Replace("[ALT]", item.Ten);
                body = body.Replace("[HREF]", "SanPham/" + item.Id + "/" + item.Ten);
                body = body.Replace("[HREF1]", "SanPham/" + item.Id + "/" + item.Ten);
                body = body.Replace("[NAME]", item.Ten);
                body = body.Replace("[GIA]", item.Gia != null && (int)item.Gia.Value > 0 ? ((int)item.Gia.Value).ToString("n0") + " đ" : "Thương lượng");
            }

            slideSale.InnerHtml = body;
        }
    }
}