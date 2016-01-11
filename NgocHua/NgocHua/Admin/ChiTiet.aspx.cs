using System;
using System.Linq;
using Repository.Model;
using Repository.Repository;

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
            var item = new HangHoa();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = repo.Find(Convert.ToInt32(hdId.Value)) ?? new HangHoa();
            if (item.Id == 0) return;

            lbStt.Text = item.Stt.ToString();
            txtNhom.Value = item.Nhom;
            txtTen.Value = item.Ten;
            txtDonVi.Value = item.DonVi;
            txtSanXuat.Value = item.SanXuat;
            txtGia.Value = Convert.ToDouble(item.Gia ?? 0);
        }

        protected void btnSave_OnServerClick(object sender, EventArgs e)
        {
            var repo = new HangHoaRepository();
            var item = new HangHoa();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = repo.Find(Convert.ToInt32(hdId.Value));

            item.Nhom = txtNhom.Value;
            item.Ten = txtTen.Value;
            item.DonVi = txtDonVi.Value;
            item.SanXuat = txtSanXuat.Value;
            item.Gia = (decimal?)txtGia.Value;

            var message = item.Id > 0 ? repo.Update(item) : repo.Add(item);

            ShowError(string.IsNullOrEmpty(message) ? "Lưu thành công" : message);
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/Images/infoAlert.png");
        }

    }
}