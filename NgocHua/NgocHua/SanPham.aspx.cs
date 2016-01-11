using System;
using System.Linq;
using Repository.Repository;
using Telerik.Web.UI;
using NgocHua.Helper;
using Repository.Model;

namespace NgocHua
{
    public partial class SanPham : System.Web.UI.Page
    {
        private readonly HangHoaRepository _spRepository = new HangHoaRepository();
        private string _type;

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = Request.Url.AbsoluteUri;
            _type = url.Split('/')[url.Split('/').Count() - 1];

            if (Page.IsPostBack) return;

            var list = _spRepository.GetAll().Select(x => x.Nhom).Distinct().OrderBy(x => x).ToList();
            var header = list.FirstOrDefault(x => ConvertString.ConvertToUnSign3(x) == _type);
            lbHeader.Text = header;

            var source = _spRepository.GetAll().Where(x => ConvertString.ConvertToUnSign3(x.Nhom) == _type).ToList();
            source = source.Any() ? source : _spRepository.GetAll().ToList();
            listView.DataSource = source.Select(x => new JsonHangHoa(x)).ToList();
            listView.DataBind();
        }

        protected void listView_OnNeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
        {
            var source = _spRepository.GetAll().Where(x => ConvertString.ConvertToUnSign3(x.Nhom) == _type).ToList();
            source = source.Any() ? source : _spRepository.GetAll().ToList();
            listView.DataSource = source.Select(x => new JsonHangHoa(x)).ToList();
        }
    }

    public class JsonHangHoa
    {
        public string Img { get; set; }
        public string Link { get; set; }
        public string Ten { get; set; }
        public string Gia { get; set; }

        public JsonHangHoa()
        {
            Img = "../../img/products/single1.jpg";
        }

        public JsonHangHoa(HangHoa item)
            :this()
        {
            Link = "../ChiTiet/" + item.Id + "/" + ConvertString.ConvertToUnSign3(item.Ten);
            Ten = item.Ten;
            Gia = item.Gia != null && item.Gia > 0 ? ((int) item.Gia.Value).ToString("n0") + " đ" : "Thương lượng";
        }
    }
}