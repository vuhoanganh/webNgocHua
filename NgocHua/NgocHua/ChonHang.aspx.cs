using System;
using System.Collections.Generic;
using System.Linq;
using NgocHua.Models;
using Repository.Model;
using Repository.Repository;
using Telerik.Web.UI;

namespace NgocHua
{
    public partial class ChonHang : System.Web.UI.Page
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private readonly HoaDonRepository _hdRepository = new HoaDonRepository();
        private readonly ChiTietHdRepository _ctHdRepository = new ChiTietHdRepository();

        public List<ItemInOrder> ItemSource { get; set; }
        private HoaDon _hoaDon;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DataSource"] == null && (ItemSource == null || !ItemSource.Any()))
                ItemSource = _spRepository.GetAllOrderByDescending().Select(x => new ItemInOrder(x)).ToList();
            else
                ItemSource = Session["DataSource"] as List<ItemInOrder>;
            Session["DataSource"] = ItemSource;

            if (Page.IsPostBack) return;

            grid.DataSource = ItemSource;
            grid.DataBind();

            if (Session["UserCus"] == null || Session["UserCus"].ToString() == "") return;
            var userRepo = new UserRepository();
            var userId = Convert.ToInt32(Session["UserCus"].ToString());
            var user = userRepo.FindById(userId);

            if (user == null || user.Id == 0)
            {
                ShowError("Vui lòng đăng nhập trước khi chọn hàng");
                return;
            }

            _hoaDon = _hdRepository.FindByUserAndTamThoi(user.Id) ?? _hdRepository.CreateNew(user.Id);
        }

        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (Session["DataSource"] == null || ItemSource == null || !ItemSource.Any())
                grid.DataSource = _spRepository.GetAllOrderByDescending().Select(x => new ItemInOrder(x)).ToList();
            else
                grid.DataSource = ItemSource;
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/img/infoAlert.png");
        }
        
        protected void grid_OnBatchEditCommand(object sender, GridBatchEditingEventArgs e)
        {
            if (Session["UserCus"] == null || Session["UserCus"].ToString() == "")
            {
                ShowError("Vui lòng đăng nhập trước khi chọn hàng");
                return;
            }

            _hoaDon = _hdRepository.FindByUserAndTamThoi(Convert.ToInt32(Session["UserCus"].ToString()));

            foreach (GridBatchEditingCommand command in e.Commands)
            {
                var newValues = command.NewValues;
                var soluong = Convert.ToInt32(newValues["SoLuong"].ToString());
                var id = Convert.ToInt32(newValues["Id"].ToString());

                var itemInGrid = ItemSource?.FirstOrDefault(x => x.Id == id);
                var gia = itemInGrid?.Gia ?? 0;
                var chitiet = new ChiTietHd
                {
                    HangHoaId = id,
                    HoaDonId = _hoaDon?.Id ?? 0,
                    Quantity = soluong,
                    SingleAmt = gia,
                    TotalAmt = soluong * gia
                };
                _ctHdRepository.Add(chitiet);
            }

            if (_hoaDon != null)
                ShowError("Số lượng mặt hàng: " + _hoaDon.ChiTietHds.Count);
        }
    }
}