using System;
using System.Linq;
using NgocHua.Repository;

namespace NgocHua
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private int _id;

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            url = url.Replace("http://", "");
            var queryId = url.Split('/')[2];
            int.TryParse(queryId, out _id);

            if (_id <= 0)
                Response.Redirect("~/SanPham");
            if (Page.IsPostBack) return;

            PrepareData();
        }

        private void PrepareData()
        {
            var bodyImgMain = imgMain.InnerHtml;

            var item = _spRepository.Find(_id);
            var imgSource = item.HinhAnhs.ToList();

            const string noImg = "../../../img/products/single1.jpg";

            #region Main Img

            var firstImg = imgSource.FirstOrDefault();
            bodyImgMain = bodyImgMain.Replace("[IMG1]", firstImg != null && firstImg.Id > 0 ? "../../../img/products/" + firstImg.Url : noImg);
            bodyImgMain = bodyImgMain.Replace("[IMG2]", firstImg != null && firstImg.Id > 0 ? "../../../img/products/" + firstImg.Url : noImg);
            imgMain.InnerHtml = bodyImgMain;

            #endregion
            
            #region Detail
            lblTen.InnerHtml = item.Ten;
            lblSanxuat.InnerHtml = item.SanXuat;
            var gia = item.Gia != null && item.Gia.Value > 0 ? item.Gia.Value.ToString("n0") : "Thương lượng";
            lblGia.InnerHtml = item.IsSale != true ? gia : "<dev>" + gia + "</dev>";

            lblChitiet.InnerHtml = item.Ten;

            #endregion
        }
    }
}