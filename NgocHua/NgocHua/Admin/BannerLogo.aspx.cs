using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;
using System.IO;

namespace NgocHua.Admin
{
    public partial class BannerLogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            var id = url.Split('/')[url.Split('/').Count() - 1];
            hdId.Value = id;

            if (Page.IsPostBack) return;

            PrepareData(id.ToLower() == "logo");
        }

        private void PrepareData(bool isLogo)
        {
            var repoImg = new HinhAnhRepository();
            var itemBanner = new HinhAnh();
            if (!string.IsNullOrEmpty(hdId.Value))
                itemBanner = isLogo ? repoImg.Find("Logo") ?? new HinhAnh() : repoImg.FindById(Convert.ToInt32(hdId.Value)) ?? new HinhAnh();
            if (itemBanner.Id != 0)
            {
                imgBanner.ImageUrl = "~/img/" + itemBanner.Url;
            }
            hdId.Value = isLogo ? "logo" : itemBanner.Id.ToString();
        }

        protected void btnSaveBanner_OnServerClick(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fileBanner.FileName))
            {
                ShowError("Không có thay đổi hình ảnh");
                return;
            }

            var repoImg = new HinhAnhRepository();
            var item = new HinhAnh();
            var isLogo = hdId.Value.ToLower() == "logo";

            if (!string.IsNullOrEmpty(hdId.Value))
                item = isLogo ? repoImg.Find("Logo") ?? new HinhAnh() : repoImg.FindById(Convert.ToInt32(hdId.Value)) ?? new HinhAnh();
            
            item.Ten = isLogo ? "Logo" : "Banner";
            
            var filetype = fileBanner.FileName.Split('.')[1];
            var imgName = isLogo ? "logo.png" : "slide_" + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + filetype;
            var savePath = Server.MapPath("~/img/") + imgName;
            fileBanner.SaveAs(savePath);

            imgBanner.ImageUrl = "~/img/" + imgName;
            item.Url = imgName;
            
            var message = item.Id > 0 ? repoImg.Update(item) : repoImg.Add(item);

            ShowError(string.IsNullOrEmpty(message) ? "Lưu thành công" : message);
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/img/infoAlert.png");
        }

    }
}