using System;
using System.Linq;
using Repository.Repository;
using Telerik.Web.UI;

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
    }
}