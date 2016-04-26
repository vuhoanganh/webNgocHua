using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;
using Telerik.Web.UI;
using System.IO;
using System.Web;

namespace NgocHua.Admin
{
    public partial class HinhSp : System.Web.UI.Page
    {
        private readonly HinhAnhRepository _repo = new HinhAnhRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            var id = url.Split('/')[url.Split('/').Count() - 1];

            if (Page.IsPostBack) return;

            grid.DataSource = _repo.FindList(Convert.ToInt32(id));
            grid.DataBind();
        }
        
        protected void grid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            var id = url.Split('/')[url.Split('/').Count() - 1];

            grid.DataSource = _repo.FindList(Convert.ToInt32(id));
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

        protected void btnImport_Click(object sender, EventArgs e)
        {
            try
            {
                var url = Request.Url.AbsoluteUri;
                var id = Convert.ToInt32(url.Split('/')[url.Split('/').Count() - 1]);

                if (fileImport.HasFiles)
                {
                    var plus = 0;
                    foreach (HttpPostedFile uploadedFile in fileImport.PostedFiles)
                    {
                        var filetype = fileImport.FileName.Split('.')[1];
                        var imgName = "img" + "_" + DateTime.Now.ToString("yyyyMMddhhmmss") + plus + "." + filetype;
                        uploadedFile.SaveAs(Path.Combine(Server.MapPath("~/img/products/"), imgName));

                        var img = new HinhAnh
                        {
                            Url = imgName,
                            Ten = string.Empty,
                            HangHoaId = id
                        };

                        _repo.Add(img);
                        plus++;
                    }
                }

                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }
        
    }
}