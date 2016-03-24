using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NgocHua.Model;

namespace NgocHua.Models
{
    public class ItemInOrder
    {
        public int Id { get; set; }
        public string Ten { get; set; }
        public string Nhom { get; set; }
        public string SanXuat { get; set; }
        public decimal Gia { get; set; }
        public int SoLuong { get; set; }

        public ItemInOrder() { }

        public ItemInOrder(HangHoa item)
        {
            Id = item.Id;
            Ten = item.Ten;
            Nhom = item.Nhom;
            SanXuat = item.SanXuat;
            Gia = item.Gia ?? 0;
            SoLuong = 0;
        }

        public ItemInOrder(ChiTietHd item)
        {
            Id = item.Id;
            Ten = item.HangHoa.Ten;
            Nhom = item.HangHoa.Nhom;
            SanXuat = item.HangHoa.SanXuat;
            Gia = item.HangHoa.Gia ?? 0;
            SoLuong = item.Quantity;
        }
    }
}