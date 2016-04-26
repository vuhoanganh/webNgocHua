using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;

namespace NgocHua.Admin
{
    public partial class GioiThieu : System.Web.UI.Page
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
            var repo = new TrangRepository();
            var item = new Page();

            int id;
            int.TryParse(hdId.Value, out id);
            if (id > 0)
                item = repo.Find(id) ?? new Page();
            if (item.Id == 0) return;

            txtTen.Value = item.Name;
            txtContent.Content = item.Content;
        }

        protected void btnSave_OnServerClick(object sender, EventArgs e)
        {
            var repoSp = new TrangRepository();
            var item = new Page();

            int id;
            int.TryParse(hdId.Value, out id);
            if (id > 0)
                item = repoSp.Find(Convert.ToInt32(hdId.Value));
            
            item.Name = txtTen.Value;
            item.Content = txtContent.Content;

            var message = item.Id > 0 ? repoSp.Update(item) : repoSp.Add(item);
            
            ShowError(string.IsNullOrEmpty(message) ? "Lưu thành công" : message);
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/img/infoAlert.png");
        }
        
    }
}