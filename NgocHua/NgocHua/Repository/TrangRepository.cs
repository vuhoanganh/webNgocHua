using System;
using System.Collections.Generic;
using System.Linq;
using NgocHua.Model;

namespace NgocHua.Repository
{
    public class TrangRepository
    {
        private readonly NgocHuaDataDataContext _dataContext = new NgocHuaDataDataContext();
        
        public string Add(Page item)
        {
            try
            {
                _dataContext.Pages.InsertOnSubmit(item);
                _dataContext.SubmitChanges();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public List<Page> GetAll()
        {
            return _dataContext.Pages.ToList();
        }

        public Page Find(int key)
        {
            return _dataContext.Pages.FirstOrDefault(x => x.Id == key);
        }
        
        public Page Find(string key)
        {
            return _dataContext.Pages.FirstOrDefault(x => x.Name.Contains(key));
        }

        public IQueryable<Page> FindList(string key)
        {
            return _dataContext.Pages.Where(x => x.Name.Contains(key));
        }

        public string Remove(int key)
        {
            try
            {
                var item = Find(key);
                _dataContext.Pages.DeleteOnSubmit(item);
                _dataContext.SubmitChanges();

                return null;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Update(Page item)
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
