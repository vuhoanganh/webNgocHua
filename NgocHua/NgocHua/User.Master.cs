using NgocHua.Helper;
using NgocHua.Repository;
using System;
using System.Linq;
using NgocHua.Model;

namespace NgocHua
{
    public partial class User : System.Web.UI.MasterPage
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private readonly HinhAnhRepository _haRepository = new HinhAnhRepository();
        private readonly TrangRepository _trangRepository = new TrangRepository();
        private readonly UserRepository _userRepo = new UserRepository();
        private string _type;

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            _type = url.Split('/')[url.Split('/').Count() - 1];

            if (Session["UserCus"] != null && !string.IsNullOrEmpty(Session["UserCus"].ToString()))
                hdUser.Value = Session["UserCus"].ToString();

            if (Page.IsPostBack) return;

            PrepareSlider();
            PrepareMenuMain();
            PrepareMenuRight();
            loginPanel.Visible = true;
            helloPanel.Visible = false;

            if (Session["UserCus"] == null || Session["UserCus"].ToString() == "") return;

            var user = _userRepo.FindById(Convert.ToInt32(hdUser.Value));

            loginPanel.Visible = !(user != null && user.Id > 0);
            helloPanel.Visible = user != null && user.Id > 0;

            lblUsername.Text = user != null && user.Id > 0 ? user.Fullname : string.Empty;
        }

        private void PrepareSlider()
        {

        }

        private void PrepareMenuMain()
        {
            var template = navGT.InnerHtml;
            var body = string.Empty;
            var list = _trangRepository.GetAll();

            foreach (var page in list)
            {
                body += template.Replace("[Name]", page.Name);
                body = body.Replace("[Id]", page.Id.ToString());
            }

            navGT.InnerHtml = body;
        }

        private void PrepareMenuRight()
        {
            const string templateMenuRight = "<li><a href='../../../../../sanpham/[href]' [class]>[name] [icon]</a>[Child]</li>";
            const string icon = "<i class='icons icon-right-dir'></i>";
            const string classSelected = "class='selected'";
            var bodyMenuRight = "";

            var templateMenuSp = navSp.InnerHtml;
            var bodyMenuSp = "";

            var listAll = _spRepository.GetAll().ToList();
            var list = listAll.Select(x => x.Nhom).Distinct().OrderBy(x => x).ToList();

            foreach (var name in list)
            {
                var listChild = listAll.Where(x => x.Nhom == name).Select(x => x.SanXuat).Distinct().OrderBy(x => x).ToList();

                var nameSign = ConvertString.ConvertToUnSign3(name);
                bodyMenuRight += templateMenuRight;
                bodyMenuRight = bodyMenuRight.Replace("[href]", nameSign);
                bodyMenuRight = bodyMenuRight.Replace("[name]", name);
                bodyMenuRight = bodyMenuRight.Replace("[class]", _type == nameSign ? classSelected : "");

                var bodyChild = "";
                const string firstChild = "<ul class='sidebar-dropdown'><li><ul>";
                const string endChild = "</ul></li></ul>";
                const string templateChild = "<li><a href='../../../../../sanpham/[href]'>[name]</a></li>";
                foreach (var child in listChild)
                {
                    var childNameSign = ConvertString.ConvertToUnSign3(child);
                    bodyChild += templateChild;
                    bodyChild = bodyChild.Replace("[href]", childNameSign);
                    bodyChild = bodyChild.Replace("[name]", child);
                }
                bodyMenuRight = bodyMenuRight.Replace("[Child]", listChild.Any() ? firstChild + bodyChild + endChild : string.Empty);
                bodyMenuRight = bodyMenuRight.Replace("[icon]", listChild.Any() ? icon : string.Empty);

                bodyMenuSp += templateMenuSp.Replace("[Id]", nameSign);
                bodyMenuSp = bodyMenuSp.Replace("[Name]", name);
            }

            menuRight.InnerHtml = bodyMenuRight;
            navSp.InnerHtml = bodyMenuSp;
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            //Session.Remove("UserCus");

            if (!string.IsNullOrEmpty(hdUser.Value))
                Session["UserCus"] = hdUser.Value;
        }

        protected void btnLogin_OnServerClick(object sender, EventArgs e)
        {
            var user = _userRepo.Login(txtUsername.Value, txtPassword.Value, false);
            if (user == null || user.Id == 0)
            {
                ShowError("Tên tài khoản hoặc mật khẩu không chính xác!");
                return;
            }

            hdUser.Value = user.Id.ToString();
            Response.Redirect(Request.RawUrl);
        }

        public void ShowError(string message)
        {
            RadWindowManager11.RadAlert(message, null, 120, "Message", null, "/img/infoAlert.png");
        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            hdUser.Value = string.Empty;
            Session.Remove("UserCus");
            Response.Redirect(Request.RawUrl);
        }
        
        protected void btnSearch_OnClick(object sender, EventArgs e)
        {
            Session["Keywords"] = txtSearch.Value;
            Response.Redirect("~/ChonHang");
        }
    }
}