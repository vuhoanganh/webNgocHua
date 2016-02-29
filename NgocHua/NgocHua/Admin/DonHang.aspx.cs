using System;
using System.Linq;
using Repository.Model;
using Repository.Repository;
using Telerik.Web.UI;

namespace NgocHua.Admin
{
    public partial class DonHang : System.Web.UI.Page
    {
        private readonly HoaDonRepository _hoaDonRepository = new HoaDonRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            grid.DataSource = _hoaDonRepository.GetAllByAdmin().Select(x => new JsonHoaDon(x));
            grid.DataBind();
        }

        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grid.DataSource = _hoaDonRepository.GetAllByAdmin().Select(x => new JsonHoaDon(x));
        }

        protected void grid_OnItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                //cancel default edit command and load the edited data in the external form
                case RadGrid.EditCommandName:
                    var temp = (GridEditableItem)e.Item;
                    var id = (int)temp.GetDataKeyValue("Id");
                    e.Canceled = true;
                    Response.Redirect("ChiTietHd\\" + id, false);
                    break;
            }
        }
        
        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/Images/infoAlert.png");
        }
    }

    public class JsonHoaDon
    {
        public int Id { get; set; }
        public string Date { get; set; }
        public string User { get; set; }
        public string TinhTrang { get; set; }
        public string Total { get; set; }

        public JsonHoaDon()
        { }

        public JsonHoaDon(HoaDon entity)
        {
            Id = entity.Id;
            Date = entity.CreatedDate.ToString("dd/MM/yyyy hhhh:mm");
            User = entity.TaiKhoan.Username;
            TinhTrang = entity.XacNhan ? "<p style='color: limegreen'>Đã xác nhận</p>" : "<p style='color: red'>Chưa xác nhận</p>";
            Total = entity.ChiTietHds.Sum(x => x.TotalAmt).ToString("n0");
        }
    }
}