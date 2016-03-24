using NgocHua.Helper;
using NgocHua.Repository;
using System;
using System.Linq;

namespace NgocHua
{
    public partial class User : System.Web.UI.MasterPage
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private readonly UserRepository _userRepo = new UserRepository();
        private string _type;

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            _type = url.Split('/')[url.Split('/').Count() - 1];

            if (Page.IsPostBack) return;

            PrepareMenuRight();
            loginPanel.Visible = true;
            helloPanel.Visible = false;

            if (Session["UserCus"] == null || Session["UserCus"].ToString() == "") return;

            hdUser.Value = Session["UserCus"].ToString();

            var user = _userRepo.FindById(Convert.ToInt32(hdUser.Value));

            loginPanel.Visible = !(user != null && user.Id > 0);
            helloPanel.Visible = user != null && user.Id > 0;

            lblUsername.Text = user != null && user.Id > 0 ? user.Fullname : string.Empty;
        }

        private void PrepareMenuRight()
        {
            const string template = "<li><a href='sanpham/[href]' [class]>[name]</a></li>";
            const string classSelected = "class='selected'";
            var body = "";

            var list = _spRepository.GetAll().Select(x => x.Nhom).Distinct().OrderBy(x => x).ToList();

            foreach (var name in list)
            {
                var nameSign = ConvertString.ConvertToUnSign3(name);
                body += template;
                body = body.Replace("[href]", nameSign);
                body = body.Replace("[name]", name);
                body = body.Replace("[class]", _type == nameSign ? classSelected : "");
            }

            menuRight.InnerHtml = body;
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            Session.Remove("UserCus");

            Session["UserCus"] = hdUser.Value;
        }

        protected void btnLogin_OnServerClick(object sender, EventArgs e)
        {
            var user = _userRepo.Login(txtUsername.Value, txtPassword.Value);
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
            Response.Redirect(Request.RawUrl);
        }
    }
}