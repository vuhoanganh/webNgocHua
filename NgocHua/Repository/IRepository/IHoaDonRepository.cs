using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Model;

namespace Repository.IRepository
{
    public interface IHoaDonRepository
    {
        string Add(HoaDon item);
        IEnumerable<HoaDon> GetAll();
        HoaDon FindByUserAndTamThoi(int key);
        IEnumerable<HoaDon> Find(string key);
        HoaDon Find(int key);
        string Remove(int key);
        string Update(HoaDon item);

        HoaDon CreateNew(int key);
    }
}
