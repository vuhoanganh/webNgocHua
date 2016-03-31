using System;
using NgocHua.Repository;
using Telerik.Web.UI;

namespace NgocHua.Admin
{
    public partial class HinhDong : System.Web.UI.Page
    {
        private readonly HinhAnhRepository _repo = new HinhAnhRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            grid.DataSource = _repo.FindList("Banner");
            grid.DataBind();
        }
        
        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grid.DataSource = _repo.FindList("Banner");
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
                    Response.Redirect("BannerLogo\\" + id, false);
                    break;
                //cancel the default insert command and display the external insert form
                case RadGrid.InitInsertCommandName:
                    e.Canceled = true;
                    Response.Redirect("BannerLogo");
                    break;
            }
        }

        protected void grid_OnDeleteCommand(object sender, GridCommandEventArgs e)
        {
            var item = ((GridDataItem)e.Item);
            var id = (int)item.GetDataKeyValue("Id");

            var message = _repo.Remove(id);

            ShowError(!string.IsNullOrEmpty(message) ? message : "Xóa thành công");
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/Images/infoAlert.png");
        }
        
    }
}