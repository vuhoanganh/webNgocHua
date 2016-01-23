using System;
using System.Collections.Generic;
using System.Linq;
using LinqToExcel;
using NgocHua.Models;
using Repository.Model;
using Repository.Repository;
using Telerik.Web.UI;
using System.IO;

namespace NgocHua.Admin
{
    public partial class SanPham : System.Web.UI.Page
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private string _type;

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            _type = url.Split('/')[url.Split('/').Count() - 1];

            if (Page.IsPostBack) return;

            grid.DataSource = _spRepository.FindByType(_type);
            grid.DataBind();
        }
        
        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var key = txtSearch.Value;
            grid.DataSource = _spRepository.FindByType(_type, key);
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
                    Response.Redirect("ChiTiet\\" + id, false);
                    break;
                //cancel the default insert command and display the external insert form
                case RadGrid.InitInsertCommandName:
                    e.Canceled = true;
                    Response.Redirect("ChiTiet");
                    break;
            }
        }

        protected void grid_OnDeleteCommand(object sender, GridCommandEventArgs e)
        {
            var item = ((GridDataItem)e.Item);
            var id = (int)item.GetDataKeyValue("Id");

            var message = _spRepository.Remove(id);

            ShowError(!string.IsNullOrEmpty(message) ? message : "Xóa thành công");
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/Images/infoAlert.png");
        }

        protected void btnSearch_OnServerClick(object sender, EventArgs e)
        {
            var key = txtSearch.Value;
            grid.DataSource = _spRepository.FindByType(_type, key);
            grid.DataBind();
        }
        
        protected void btnImport_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(fileImport.FileName))
                    return;

                var source = SaveFile_ReturnData(null, null);

                ShowError(source != null && source.Any()
                    ? ImportData(source, true)
                    : "Import Data is null");

                grid.DataSource = _spRepository.FindByType(_type);
                grid.DataBind();
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        protected void btnImportHot_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(fileImport.FileName))
                    return;

                var source = SaveFile_ReturnData(true, null);

                ShowError(source != null && source.Any()
                    ? ImportData(source, false)
                    : "Import Data is null");

                grid.DataSource = _spRepository.FindByType(_type);
                grid.DataBind();
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        protected void btnImportSale_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(fileImport.FileName))
                    return;

                var source = SaveFile_ReturnData(null, true);

                ShowError(source != null && source.Any()
                    ? ImportData(source, false)
                    : "Import Data is null");

                grid.DataSource = _spRepository.FindByType(_type);
                grid.DataBind();
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        public List<HangHoa> SaveFile_ReturnData(bool? isHot, bool? isSale)
        {
            var savePath = Server.MapPath("~/App_Data/Temp/") + fileImport.FileName;
            if (!File.Exists(savePath))
                fileImport.SaveAs(savePath);

            var excel = new ExcelQueryFactory(savePath);

            var dataExcel = GetDataExcel(excel);
            var date = DateTime.Now;
            var source = dataExcel.Select(x => GetData(x, date, isHot, isSale)).ToList();
            
            return source;
        }

        public List<ExcelItem> GetDataExcel(ExcelQueryFactory excel)
        {
            excel.AddMapping<ExcelItem>(x => x.Stt, "STT");
            excel.AddMapping<ExcelItem>(x => x.Nhom, "Nhóm hàng hóa");
            excel.AddMapping<ExcelItem>(x => x.Ten, "Tên sản phẩm");
            excel.AddMapping<ExcelItem>(x => x.DonVi, "ĐVT");
            excel.AddMapping<ExcelItem>(x => x.SanXuat, "Nhà sản xuất");
            //excel.AddMapping<ExcelItem>(x => x.Gia, "sdt");

            return (from p in excel.Worksheet<ExcelItem>()
                    select p).ToList();
        }

        public string ImportData(List<HangHoa> source, bool isDelete)
        {
            try
            {
                _spRepository.Import(source, isDelete);
                
                return "Nhập dữ liệu mới thành công";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public HangHoa GetData(ExcelItem input, DateTime date, bool? isHot, bool? isSale)
        {
            return new HangHoa
            {
                Stt = input.Stt,
                Nhom = input.Nhom,
                Ten = input.Ten,
                DonVi = input.DonVi,
                SanXuat = input.SanXuat,
                Gia = input.Gia,
                CreatedDate = date,
                IsHot = isHot,
                IsSale = isSale
            };
        }

    }
}