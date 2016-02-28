using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Model;

namespace Repository.IRepository
{
    public interface IChiTietHdRepository
    {
        string Add(ChiTietHd item);
        string Update(ChiTietHd item);
        IEnumerable<ChiTietHd> FindByHd(int key);
    }
}
