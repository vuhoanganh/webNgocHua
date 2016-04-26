using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;
using System.IO;

namespace NgocHua.Admin
{
    public partial class ChiTietUser : System.Web.UI.Page
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
            var repo = new UserRepository();
            var item = new TaiKhoan();

            if (!string.IsNullOrEmpty(hdId.Value))
                item = repo.FindById(Convert.ToInt32(hdId.Value)) ?? new TaiKhoan();
            if (item.Id == 0) return;
            
            txtTen.Value = item.Fullname;
            txtUsername.Value = item.Username;
            txtEmail.Value = item.Email;
            txtAddress.Value = item.Address;
            txtDescription.Value = item.Description;
        }
        
    }
}