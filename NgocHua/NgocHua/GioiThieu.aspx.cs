using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NgocHua.Model;
using NgocHua.Repository;

namespace NgocHua
{
    public partial class GioiThieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            var repo = new TrangRepository();

            var url = Request.Url.AbsoluteUri;
            var queryId = url.Split('/')[url.Split('/').Count() - 1];

            int id;
            int.TryParse(queryId, out id);

            if (id == 0) return;

            var page = repo.Find(id) ?? new Model.Page();
            contentGT.InnerHtml = page.Content;
        }
    }
}