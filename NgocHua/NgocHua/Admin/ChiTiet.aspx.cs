using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;
using System.IO;

namespace NgocHua.Admin
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            var id = url.Split('/')[url.Split('/').Count() - 1];
            hdId.Value = id;

            if (Page.IsPostBack) return;

            PrepareData();
        }

        private void PrepareData()
        {
            var repo = new HangHoaRepository();
            var repoImg = new HinhAnhRepository();
            var item = new HangHoa();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = repo.Find(Convert.ToInt32(hdId.Value)) ?? new HangHoa();
            if (item.Id == 0) return;

            lbStt.Text = item.Stt.ToString();
            txtNhom.Value = item.Nhom;
            txtTen.Value = item.Ten;
            txtDonVi.Value = item.DonVi;
            txtSanXuat.Value = item.SanXuat;
            txtGhiChu.Content = item.GhiChu;
            txtGia.Value = Convert.ToDouble(item.Gia ?? 0);
            cboHot.Checked = item.IsHot == true;
            cboSale.Checked = item.IsSale == true;

            var imgEntity = repoImg.Find(item.Id) ?? new HinhAnh();
            if (imgEntity.Id > 0)
                img.ImageUrl = "~/img/products/" + imgEntity.Url;
        }

        protected void btnUpload_OnServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/HinhSp/" + hdId.Value);
        }
        
        protected void btnSave_OnServerClick(object sender, EventArgs e)
        {
            var repoSp = new HangHoaRepository();
            var repoImg = new HinhAnhRepository();
            var item = new HangHoa();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = repoSp.Find(Convert.ToInt32(hdId.Value));

            item.Nhom = txtNhom.Value;
            item.Ten = txtTen.Value;
            item.DonVi = txtDonVi.Value;
            item.SanXuat = txtSanXuat.Value;
            item.Gia = (decimal?)txtGia.Value;
            item.IsHot = cboHot.Checked;
            item.IsSale = cboSale.Checked;
            item.GhiChu = txtGhiChu.Content;

            var message = item.Id > 0 ? repoSp.Update(item) : repoSp.Add(item);

            if (string.IsNullOrEmpty(fileImport.FileName))
            {
                ShowError(string.IsNullOrEmpty(message) ? "Lưu thành công" : message);
                return;
            }
            
            var filetype = fileImport.FileName.Split('.')[1];
            var imgName = "img" + "_" + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + filetype;
            var savePath = Server.MapPath("~/img/products/") + imgName;
            fileImport.SaveAs(savePath);

            img.ImageUrl = "~/img/products/" + imgName;

            if (item.Id > 0)
            {
                var imgEntity = repoImg.Find(item.Id) ?? new HinhAnh();
                imgEntity.Url = imgName;
                imgEntity.HangHoaId = item.Id;
                if(imgEntity.Id == 0)
                    repoImg.Add(imgEntity);
                else
                    repoImg.Update(imgEntity);
            }

            ShowError(string.IsNullOrEmpty(message) ? "Lưu thành công" : message);
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/img/infoAlert.png");
        }

        protected void fileImport_OnDataBinding(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fileImport.FileName))
                return;

            var imgName = fileImport.FileName + "_" + DateTime.Now.ToString("yyyyMMddhhmmss");
            var savePath = Server.MapPath("~/img/products/") + imgName;
            fileImport.SaveAs(savePath);

            img.ImageUrl = Server.MapPath("~/img/products/") + imgName;
        }
    }
}