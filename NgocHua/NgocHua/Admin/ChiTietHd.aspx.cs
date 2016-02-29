using System;
using System.Linq;
using NgocHua.Models;
using Repository.Model;
using Repository.Repository;
using Telerik.Web.UI;

namespace NgocHua.Admin
{
    public partial class ChiTietHd : System.Web.UI.Page
    {
        private readonly HoaDonRepository _hoaDonRepository = new HoaDonRepository();
        private readonly ChiTietHdRepository _ctHdRepository = new ChiTietHdRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            var id = url.Split('/')[url.Split('/').Count() - 1];
            hdId.Value = id;

            if (Page.IsPostBack) return;

            PrepareData();

            grid.DataSource = _ctHdRepository.FindByHd(Convert.ToInt32(id)).Select(x => new ItemInOrder(x));
            grid.DataBind();
        }
        
        private void PrepareData()
        {
            var item = new HoaDon();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = _hoaDonRepository.Find(Convert.ToInt32(hdId.Value)) ?? new HoaDon();
            if (item.Id == 0) return;

            lbStt.Text = item.Id.ToString();
            txtUser.Value = item.TaiKhoan.Username;
            txtDate.Value = item.CreatedDate.ToString("dd/MM/yyyy hhhh:mm");
            txtTotal.Value = item.ChiTietHds.Sum(x => x.TotalAmt).ToString("n0");
            txtStatus.Value = item.XacNhan ? "Đã xác nhận" : "Chưa xác nhận";
        }

        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var id = hdId.Value;
            grid.DataSource = _ctHdRepository.FindByHd(Convert.ToInt32(id)).Select(x => new ItemInOrder(x));
        }
        
        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/Images/infoAlert.png");
        }

        protected void btnSave_OnServerClick(object sender, EventArgs e)
        {
            var item = new HoaDon();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = _hoaDonRepository.Find(Convert.ToInt32(hdId.Value)) ?? new HoaDon();
            if (item.Id == 0) return;

            item.XacNhan = true;
            _hoaDonRepository.Update(item);

            txtStatus.Value = "Đã xác nhận";
        }
    }
    
}