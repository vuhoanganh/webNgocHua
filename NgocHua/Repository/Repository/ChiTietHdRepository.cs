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

        public string Update(ChiTietHd item)
        {
            try
            {
                var entity = Find(item.Id);
                entity.Quantity = item.Quantity;
                entity.TotalAmt = item.TotalAmt;
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

        public ChiTietHd Find(int key)
        {
            return _dataContext.ChiTietHds.FirstOrDefault(x => x.Id == key);
        }

        public string Remove(int key)
        {
            try
            {
                var item = Find(key);
                _dataContext.ChiTietHds.DeleteOnSubmit(item);
                _dataContext.SubmitChanges();

                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

    }
}
