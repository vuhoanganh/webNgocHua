using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.IRepository;
using Repository.Model;

namespace Repository.Repository
{
    public class ChiTietHdRepository : IChiTietHdRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();
        public string Add(ChiTietHd item)
        {
            try
            {
                _dataContext.ChiTietHds.InsertOnSubmit(item);
                _dataContext.SubmitChanges();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public IEnumerable<ChiTietHd> FindByHd(int key)
        {
            return _dataContext.ChiTietHds.Where(x => x.HoaDonId == key).ToList();
        }
    }
}
