using System.Linq;
using NgocHua.Model;

namespace NgocHua.Repository
{
    public class UserRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();

        public TaiKhoan Login(string name, string pass)
        {
            name = name.ToLower();
            pass = pass.ToLower();
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Username.ToLower() == name && x.Password == pass && x.IsAdmin == true);
        }

        public TaiKhoan FindById(int id)
        {
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Id == id);
        }
    }
}
