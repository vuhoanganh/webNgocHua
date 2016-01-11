using System;
using System.Collections.Generic;
using System.Linq;
using Repository.Model;

namespace Repository.Repository
{
    public class HangHoaRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();
        public void Import(List<HangHoa> items)
        {
            _dataContext.HangHoas.DeleteAllOnSubmit(_dataContext.HangHoas);
            _dataContext.HangHoas.InsertAllOnSubmit(items);
            _dataContext.SubmitChanges();
        }

        public string Add(HangHoa item)
        {
            try
            {
                item.CreatedDate = DateTime.Now;
                _dataContext.HangHoas.InsertOnSubmit(item);
                _dataContext.SubmitChanges();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public IEnumerable<HangHoa> GetAll()
        {
            return _dataContext.HangHoas.ToList();
        }

        public IEnumerable<HangHoa> GetByNew()
        {
            return _dataContext.HangHoas.OrderByDescending(x => x.Id).ToList();
        }

        public IEnumerable<HangHoa> GetByHot()
        {
            var source = _dataContext.HangHoas.Where(x => x.IsHot == true).Take(8).ToList();
            return source.Any() ? source : GetAll().Take(8);
        }

        public IEnumerable<HangHoa> GetBySale()
        {
            var source = _dataContext.HangHoas.Where(x => x.IsSale == true).Take(8).ToList();
            return source.Any() ? source : GetByNew().Take(8);
        }

        public IEnumerable<HangHoa> Find(string key)
        {
            var source = _dataContext.HangHoas.Where(x => x.Ten.Contains(key) || x.Nhom.Contains(key) || x.SanXuat.Contains(key));
            return source.Any() ? source : GetAll();
        }

        public HangHoa Find(int key)
        {
            return _dataContext.HangHoas.FirstOrDefault(x => x.Id == key);
        }

        public string Remove(int key)
        {
            try
            {
                var item = Find(key);
                _dataContext.HangHoas.DeleteOnSubmit(item);
                _dataContext.SubmitChanges();

                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Update(HangHoa item)
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

        public IEnumerable<HangHoa> FindByType(string key)
        {
            var source = _dataContext.HangHoas.Where(x => x.Nhom == key).ToList();
            return source.Any() ? source : GetAll();
        }

        public IEnumerable<HangHoa> FindByType(string type, string key)
        {
            key = key.ToLower();
            return FindByType(key).Where(x => x.Stt.ToString().Contains(key) || x.Ten.ToLower().Contains(key) 
            || x.Nhom.ToLower().Contains(key) || x.SanXuat.ToLower().Contains(key)).ToList();
        }
    }
}
