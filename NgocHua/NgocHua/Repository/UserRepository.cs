using System;
using System.Collections.Generic;
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

        public List<TaiKhoan> GetAll()
        {
            return _dataContext.TaiKhoans.ToList();
        }

        public TaiKhoan FindById(int id)
        {
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Id == id);
        }

        public TaiKhoan FindByName(string name)
        {
            return _dataContext.TaiKhoans.FirstOrDefault(x => x.Username == name);
        }

        public string Remove(int key)
        {
            try
            {
                var item = FindById(key);
                _dataContext.TaiKhoans.DeleteOnSubmit(item);
                _dataContext.SubmitChanges();

                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
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

        public string Update(TaiKhoan item)
        {
            try
            {
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
