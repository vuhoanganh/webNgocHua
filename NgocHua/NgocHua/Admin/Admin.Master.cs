using System;
using NgocHua.Repository;

namespace NgocHua.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            if(url.ToLower().Contains("sanpham"))
                liSanPham.Attributes.Add("class", "active");
            else if (url.ToLower().Contains("chitiet"))
                liSanPham.Attributes.Add("class", "active");
            else if (url.ToLower().Contains("donhang"))
                liDonHang.Attributes.Add("class", "active");
            else
                liTrangChu.Attributes.Add("class", "active");

            Unload += Page_Unload;

            if (Page.IsPostBack) return;

            if (Session["User"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
                return;
            }

            hdUser.Value = Session["User"].ToString();
            Session.Remove("User");

            var userRepo = new UserRepository();
            var user = userRepo.FindById(Convert.ToInt32(hdUser.Value));
            if(user == null || user.Id == 0)
            {
                Response.Redirect("Login");
                return;
            }

            lbName.Text = user.Fullname;
            lbUser.Text = user.Username;
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            Session["User"] = hdUser.Value;
        }
    }
}