using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Model;

namespace Repository.IRepository
{
    public interface IHangHoaRepository
    {
        void Import(List<HangHoa> items);
        void Add(HangHoa item);
        IEnumerable<HangHoa> GetAll();
        IEnumerable<HangHoa> Find(string key);
        HangHoa Find(int key);
        void Remove(int key);
        void Update(HangHoa item);
    }
}
