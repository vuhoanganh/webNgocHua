using System;
using System.Collections.Generic;
using System.Linq;
using NgocHua.Models;
using NgocHua.Model;
using NgocHua.Repository;
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
            if (Page.IsPostBack) return;

            if (Session["ChonHang"] == null && (ItemSource == null || !ItemSource.Any()))
                ItemSource = _spRepository.GetAllOrderByDescending().Select(x => new ItemInOrder(x)).ToList();
            else
                ItemSource = Session["ChonHang"] as List<ItemInOrder>;
            Session["ChonHang"] = ItemSource;

            if (!string.IsNullOrEmpty(Session["Keywords"]?.ToString()))
            {
                var key = Session["Keywords"].ToString();
                TxtSearch.Value = key;
                ItemSource = _spRepository.Find(key).OrderByDescending(x => x.Id).Select(x => new ItemInOrder(x)).ToList();
                Session.Remove("Keywords");
            }
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
            grid.DataSource = GetList();
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
                ShowError("Vui lòng đăng nhập trước khi chọn hàng");
                return;
            }

            _hoaDon = _hdRepository.FindByUserAndTamThoi(Convert.ToInt32(Session["UserCus"].ToString()));

            if (argument == null)
                foreach (GridBatchEditingCommand command in e.Commands)
                {
                    var newValues = command.NewValues;
                    var chitiet = ReturnItem(newValues["SoLuong"].ToString(), newValues["Id"].ToString());
                    if(chitiet.Id == 0)
                        _ctHdRepository.Add(chitiet);
                    else
                        _ctHdRepository.Update(chitiet);
                }
            else
            {
                var newValues = argument.NewValues;
                var chitiet = ReturnItem(newValues["SoLuong"].ToString(), newValues["Id"].ToString());
                if (chitiet.Id == 0)
                    _ctHdRepository.Add(chitiet);
                else
                    _ctHdRepository.Update(chitiet);
            }
        }

        private ChiTietHd ReturnItem(string soluong, string id)
        {
            var soluongValue = Convert.ToInt32(soluong);
            var idValue = Convert.ToInt32(id);

            var itemInGrid = ItemSource?.FirstOrDefault(x => x.Id == idValue);
            var gia = itemInGrid?.Gia ?? 0;

            var item = _hoaDon.ChiTietHds.FirstOrDefault(x => x.HangHoaId == idValue) ?? new ChiTietHd();
            item.HangHoaId = idValue;
            item.HoaDonId = (int) _hoaDon?.Id;
            item.Quantity += soluongValue;
            item.SingleAmt = gia;
            item.TotalAmt = item.Quantity * gia;
            return item;
        }

        public List<ItemInOrder> GetList()
        {
            var key = TxtSearch.Value;
            List<ItemInOrder> source;

            if (string.IsNullOrEmpty(key))
            {
                if (Session["ChonHang"] == null || ItemSource == null || !ItemSource.Any())
                    source = _spRepository.GetAllOrderByDescending().Select(x => new ItemInOrder(x)).ToList();
                else
                    source = ItemSource;
            }
            else
            {
                source = _spRepository.Find(key).OrderByDescending(x => x.Id).Select(x => new ItemInOrder(x)).ToList();
            }


            return source;
        }

        protected void BtnSearch_OnServerClick(object sender, EventArgs e)
        {
            grid.DataSource = GetList();
            grid.DataBind();
        }

        //protected void grid_OnItemCommand(object sender, GridCommandEventArgs e)
        //{
        //    var argument = e.CommandArgument as GridBatchEditingEventArgument;
        //    SaveChanged(null, argument);
        //}
    }
}