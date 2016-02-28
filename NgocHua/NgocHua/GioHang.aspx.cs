using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NgocHua.Models;
using Repository.Model;
using Repository.Repository;
using Telerik.Web.UI;

namespace NgocHua
{
    public partial class GioHang : System.Web.UI.Page
    {
        private readonly HoaDonRepository _hdRepository = new HoaDonRepository();
        private readonly ChiTietHdRepository _ctHdRepository = new ChiTietHdRepository();

        public List<ItemInOrder> ItemSource { get; set; }
        private HoaDon _hoaDon;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserCus"] == null || Session["UserCus"].ToString() == "")
            {
                ShowError("Vui lòng đăng nhập");

                grid.DataSource = new List<ItemInOrder>();

                return;
            }

            _hoaDon = _hdRepository.FindByUserAndTamThoi(Convert.ToInt32(Session["UserCus"].ToString()));

            grid.DeleteCommand += grid_DeleteCommand;
            if (Page.IsPostBack) return;

            SetData();
        }

        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            SetData();
        }

        private void SetData()
        {
            if (_hoaDon == null)
            {
                grid.DataSource = new List<ItemInOrder>();
                return;
            }
            ItemSource = _hoaDon.ChiTietHds?.Select(x => new ItemInOrder(x)).ToList() ?? new List<ItemInOrder>();
            grid.DataSource = ItemSource;
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/img/infoAlert.png");
        }

        protected void grid_OnBatchEditCommand(object sender, GridBatchEditingEventArgs e)
        {
            SaveChanged(e, null);
        }

        private void SaveChanged(GridBatchEditingEventArgs e, GridBatchEditingEventArgument argument)
        {
            if (Session["UserCus"] == null || Session["UserCus"].ToString() == "")
            {
                return;
            }

            _hoaDon = _hdRepository.FindByUserAndTamThoi(Convert.ToInt32(Session["UserCus"].ToString()));

            if (argument == null)
                foreach (GridBatchEditingCommand command in e.Commands)
                {
                    var newValues = command.NewValues;
                    var chitiet = ReturnItem(newValues["SoLuong"].ToString(), newValues["Id"].ToString());
                    _ctHdRepository.Update(chitiet);
                }
            else
            {
                var newValues = argument.NewValues;
                var chitiet = ReturnItem(newValues["SoLuong"].ToString(), newValues["Id"].ToString());
                _ctHdRepository.Update(chitiet);
            }

            _hoaDon.TamThoi = false;
            _hdRepository.Update(_hoaDon);


            ShowError("Đơn hàng của bạn đã được đặt. Chúng tôi sẽ liên hệ với bạn ngay khi xác nhận.");
        }

        private ChiTietHd ReturnItem(string soluong, string id)
        {
            var soluongValue = Convert.ToInt32(soluong);
            var idValue = Convert.ToInt32(id);
            
            var item = _hoaDon.ChiTietHds.FirstOrDefault(x => x.Id == idValue) ?? new ChiTietHd();
            item.Quantity = soluongValue;
            item.TotalAmt = item.Quantity * item.SingleAmt;
            return item;
        }

        protected void grid_OnItemCommand(object sender, GridCommandEventArgs e)
        {
            
        }

        void grid_DeleteCommand(object source, GridCommandEventArgs e)
        {
            
        }

        protected void grid_OnDeleteCommand(object sender, GridCommandEventArgs e)
        {
            var item = ((GridDataItem)e.Item);
            var id = (int)item.GetDataKeyValue("Id");

            var message = _ctHdRepository.Remove(id);

            ShowError(!string.IsNullOrEmpty(message) ? message : "Xóa thành công");

            SetData();
            grid.DataBind();
        }
    }
}