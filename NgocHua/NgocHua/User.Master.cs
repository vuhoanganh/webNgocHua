using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NgocHua.Helper;
using Repository.Repository;

namespace NgocHua
{
    public partial class User : System.Web.UI.MasterPage
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private string _type;

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            _type = url.Split('/')[url.Split('/').Count() - 1];

            if (Page.IsPostBack) return;

            PrepareMenuRight();
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
    }
}