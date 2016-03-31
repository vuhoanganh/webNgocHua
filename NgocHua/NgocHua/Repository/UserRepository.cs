using System;
using System.Linq;
using NgocHua.Model;

namespace NgocHua.Repository
{
    public class UserRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();

        public TaiKhoan Login(string name, string pass, bool isAdmin)
        {
            name = name.ToLower();
            pass = pass.ToLower();
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Username == name && x.Password == pass && x.IsAdmin == isAdmin);
        }

        public TaiKhoan FindById(int id)
        {
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Id == id);
        }

        public TaiKhoan FindByName(string name)
        {
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Username == name);
        }

        public string Add(TaiKhoan item)
        {
            try
            {
                _dataContext.TaiKhoans.InsertOnSubmit(item);
                _dataContext.SubmitChanges();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

    }
}
