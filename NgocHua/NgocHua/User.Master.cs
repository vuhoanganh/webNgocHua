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

            PrepareSlidebarRight();
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

        private void PrepareSlidebarRight()
        {
            var listAll = _spRepository.GetAll().ToList();
            var listHaveImg = listAll.Where(x => x.HinhAnhs.Any()).ToList();
            var rnd = new Random();
            var r1 = listHaveImg.Any() ? rnd.Next(listHaveImg.Count) : rnd.Next(listAll.Count);
            var r2 = listHaveImg.Any() ? rnd.Next(listHaveImg.Count) : rnd.Next(listAll.Count);
            var r3 = listHaveImg.Any() ? rnd.Next(listHaveImg.Count) : rnd.Next(listAll.Count);
            var item1 = listHaveImg.Any() ? listHaveImg[r1] : listAll[r1];
            var item2 = listHaveImg.Any() ? listHaveImg[r2] : listAll[r2];
            var item3 = listHaveImg.Any() ? listHaveImg[r3] : listAll[r3];
            var nameSign1 = ConvertString.ConvertToUnSign3(item1.Ten);
            var nameSign2 = ConvertString.ConvertToUnSign3(item2.Ten);
            var nameSign3 = ConvertString.ConvertToUnSign3(item3.Ten);
            var img1 = item1.HinhAnhs.FirstOrDefault() ?? new HinhAnh();
            var img2 = item2.HinhAnhs.FirstOrDefault() ?? new HinhAnh();
            var img3 = item3.HinhAnhs.FirstOrDefault() ?? new HinhAnh();

            slidebar_right_1.InnerHtml = slidebar_right_1.InnerHtml.Replace("[URL1]",
                "../../../../../sanpham/" + nameSign1);
            slidebar_right_1.InnerHtml = slidebar_right_1.InnerHtml.Replace("[IMG1]", !string.IsNullOrEmpty(img1.Url) ? img1.Url : "products/single1.jpg");

            slidebar_right_1.InnerHtml = slidebar_right_1.InnerHtml.Replace("[URL2]",
                "../../../../../sanpham/" + nameSign2);
            slidebar_right_1.InnerHtml = slidebar_right_1.InnerHtml.Replace("[IMG2]", !string.IsNullOrEmpty(img2.Url) ? img2.Url : "products/single1.jpg");

            slidebar_right_1.InnerHtml = slidebar_right_1.InnerHtml.Replace("[URL3]",
                "../../../../../sanpham/" + nameSign3);
            slidebar_right_1.InnerHtml = slidebar_right_1.InnerHtml.Replace("[IMG3]", !string.IsNullOrEmpty(img3.Url) ? img3.Url : "products/single1.jpg");


            var r4 = rnd.Next(listAll.Count);
            var r5 = rnd.Next(listAll.Count);
            var r6 = rnd.Next(listAll.Count);
            var nameSign4 = ConvertString.ConvertToUnSign3(listAll[r4].Ten);
            var nameSign5 = ConvertString.ConvertToUnSign3(listAll[r5].Ten);
            var nameSign6 = ConvertString.ConvertToUnSign3(listAll[r6].Ten);
            var img4 = listAll[r4].HinhAnhs.FirstOrDefault() ?? new HinhAnh();
            var img5 = listAll[r5].HinhAnhs.FirstOrDefault() ?? new HinhAnh();
            var img6 = listAll[r6].HinhAnhs.FirstOrDefault() ?? new HinhAnh();

            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[URL1]",
                "../../../../../sanpham/" + nameSign4);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[URL1]",
                "../../../../../sanpham/" + nameSign4);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[IMG1]", !string.IsNullOrEmpty(img4.Url) ? img1.Url : "products/single1.jpg");
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[NAME1]", listAll[r4].Ten);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[PRICE1]", listAll[r4].Gia != null && (int)listAll[r4].Gia.Value > 0 ? ((int)listAll[r4].Gia.Value).ToString("n0") + " đ" : "Thương lượng");

            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[URL2]",
                "../../../../../sanpham/" + nameSign5);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[URL2]",
                "../../../../../sanpham/" + nameSign5);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[IMG2]", !string.IsNullOrEmpty(img5.Url) ? img1.Url : "products/single1.jpg");
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[NAME2]", listAll[r5].Ten);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[PRICE2]", listAll[r5].Gia != null && (int)listAll[r5].Gia.Value > 0 ? ((int)listAll[r5].Gia.Value).ToString("n0") + " đ" : "Thương lượng");

            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[URL3]",
                "../../../../../sanpham/" + nameSign6);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[URL3]",
                "../../../../../sanpham/" + nameSign6);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[IMG3]", !string.IsNullOrEmpty(img6.Url) ? img1.Url : "products/single1.jpg");
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[NAME3]", listAll[r6].Ten);
            slidebar_right_2.InnerHtml = slidebar_right_2.InnerHtml.Replace("[PRICE3]", listAll[r6].Gia != null && (int)listAll[r6].Gia.Value > 0 ? ((int)listAll[r6].Gia.Value).ToString("n0") + " đ" : "Thương lượng");

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