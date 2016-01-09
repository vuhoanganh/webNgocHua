using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NgocHua.Models
{
    public class ExcelItem
    {
        public int Id { get; set; }
        public int Stt { get; set; }
        public string Nhom  { get; set; }
        public string Ten { get; set; }
        public string DonVi { get; set; }
        public string SanXuat { get; set; }
        public decimal Gia { get; set; }

        public ExcelItem() { }
    }
}