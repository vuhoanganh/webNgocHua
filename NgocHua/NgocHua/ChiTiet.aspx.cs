using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;
using Telerik.Web.UI;

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
            var item = _spRepository.Find(_id);

            #region Detail
            lblTen.InnerHtml = item.Ten;
            lblSanxuat.InnerHtml = item.SanXuat;
            var gia = item.Gia != null && item.Gia.Value > 0 ? item.Gia.Value.ToString("n0") : "Thương lượng";
            lblGia.InnerHtml = item.IsSale != true ? gia : "<dev>" + gia + "</dev>";

            lblChitiet.InnerHtml = item.Ten;

            #endregion
        }
        
        protected void RadImageGallery1_OnNeedDataSource(object sender, ImageGalleryNeedDataSourceEventArgs e)
        {
            var item = _spRepository.Find(_id);
            var imgSource = item.HinhAnhs.ToList();
            var gallery = sender as RadImageGallery;
            if (gallery != null)
                gallery.DataSource = GetImageGalleryData(imgSource);
        }

        private DataTable GetImageGalleryData(List<HinhAnh> imgSource)
        {
            var table = new DataTable();
            table.Columns.Add("Title", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("ImageData", typeof(string));
            table.Columns.Add("ThumbnailData", typeof(string));

            var plus = 0;
            foreach (var img in imgSource)
            {
                plus++;
                table.Rows.Add(string.Empty, string.Empty, "img/products/" + img.Url, "img/products/" + img.Url);
            }

            return table;
        }
    }
}