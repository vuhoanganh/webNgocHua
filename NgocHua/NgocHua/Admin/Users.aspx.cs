using System;
using System.Linq;
using NgocHua.Repository;
using Telerik.Web.UI;

namespace NgocHua.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        private readonly UserRepository _spRepository = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            grid.DataSource = _spRepository.GetAll();
            grid.DataBind();
        }
        
        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grid.DataSource = _spRepository.GetAll();
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
                    Response.Redirect("GioiThieu\\" + id, false);
                    break;
                //cancel the default insert command and display the external insert form
                case RadGrid.InitInsertCommandName:
                    e.Canceled = true;
                    Response.Redirect("GioiThieu");
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
        
    }
}