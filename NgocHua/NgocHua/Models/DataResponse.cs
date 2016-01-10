using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NgocHua.Models
{
    public class DataResponse
    {
        public IEnumerable<Object> List { get; set; }
        public bool IsOk { get; set; }
        public string Message { get; set; }

        public DataResponse()
        {
            List = new List<Object>();
            IsOk = true;
            Message = string.Empty;
        }
    }
}