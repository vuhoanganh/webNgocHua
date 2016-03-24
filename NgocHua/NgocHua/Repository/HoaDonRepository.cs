using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NgocHua.Model;

namespace NgocHua.Repository
{
    public class HoaDonRepository 
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();

        public string Add(HoaDon item)
        {
            try
            {
                item.CreatedDate = DateTime.Now;
                _dataContext.HoaDons.InsertOnSubmit(item);
                _dataContext.SubmitChanges();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public IEnumerable<HoaDon> GetAll()
        {
            return _dataContext.HoaDons.ToList();
        }

        public IEnumerable<HoaDon> GetAllByAdmin()
        {
            return _dataContext.HoaDons.Where(x => !x.TamThoi).OrderByDescending(x => x.Id).ThenBy(x => x.TamThoi).ToList();
        }

        public HoaDon FindByUserAndTamThoi(int key)
        {
            return _dataContext.HoaDons.FirstOrDefault(x => x.TaiKhoanId == key && x.TamThoi);
        }

        public IEnumerable<HoaDon> Find(string key)
        {
            throw new NotImplementedException();
        }

        public HoaDon Find(int key)
        {
            return _dataContext.HoaDons.FirstOrDefault(x => x.Id == key);
        }

        public string Remove(int key)
        {
            try
            {
                var item = Find(key);
                _dataContext.HoaDons.DeleteOnSubmit(item);
                _dataContext.SubmitChanges();

                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Update(HoaDon item)
        {
            try
            {
                var entity = Find(item.Id);
                entity.TamThoi = item.TamThoi;
                entity.XacNhan = item.XacNhan;

                _dataContext.SubmitChanges();
                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public HoaDon CreateNew(int key)
        {
            var item = new HoaDon
            {
                CreatedDate = DateTime.Now,
                TaiKhoanId = key,
                TamThoi = true,
                XacNhan = false,
                TotalAmt = 0
            };
            _dataContext.HoaDons.InsertOnSubmit(item);
            _dataContext.SubmitChanges();

            return item;
        }
    }
}
