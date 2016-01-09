using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.IRepository;
using Repository.Model;

namespace Repository.Repository
{
    public class HangHoaRepository : IHangHoaRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();
        public void Import(List<HangHoa> items)
        {
            _dataContext.HangHoas.InsertAllOnSubmit(items);
            _dataContext.SubmitChanges();
        }

        public void Add(HangHoa item)
        {
            _dataContext.HangHoas.InsertOnSubmit(item);
            _dataContext.SubmitChanges();
        }

        public IEnumerable<HangHoa> GetAll()
        {
            return _dataContext.HangHoas.ToList();
        }

        public IEnumerable<HangHoa> Find(string key)
        {
            return _dataContext.HangHoas.Where(x => x.Ten.Contains(key) || x.Nhom.Contains(key) || x.SanXuat.Contains(key));
        }

        public HangHoa Find(int key)
        {
            return _dataContext.HangHoas.FirstOrDefault(x => x.Id == key);
        }

        public void Remove(int key)
        {
            var item = Find(key);
            _dataContext.HangHoas.DeleteOnSubmit(item);
            _dataContext.SubmitChanges();
        }

        public void Update(HangHoa item)
        {
            _dataContext.SubmitChanges();
        }
    }
}
