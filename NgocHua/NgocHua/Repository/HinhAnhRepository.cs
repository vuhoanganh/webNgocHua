using System;
using System.Linq;
using NgocHua.Model;

namespace NgocHua.Repository
{
    public class HinhAnhRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();
        
        public string Add(HinhAnh item)
        {
            try
            {
                _dataContext.HinhAnhs.InsertOnSubmit(item);
                _dataContext.SubmitChanges();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        
        public HinhAnh Find(int key)
        {
            return _dataContext.HinhAnhs.FirstOrDefault(x => x.HangHoaId == key);
        }

        public string Remove(int key)
        {
            try
            {
                var item = Find(key);
                _dataContext.HinhAnhs.DeleteOnSubmit(item);
                _dataContext.SubmitChanges();

                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Update(HinhAnh item)
        {
            try
            {
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
