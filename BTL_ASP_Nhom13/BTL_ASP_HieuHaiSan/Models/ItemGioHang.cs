using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_ASP_HieuHaiSan.Models
{
    public class ItemGioHang
    {
        HaiSanDB db = new HaiSanDB();
        public int ID_SanPham { get; set; }
        public string TenSanPham { get; set; }
        public string HinhAnh { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }
        public int SoLuong { get; set; }
        public decimal GiaGoc { get; set; }

        public ItemGioHang(int iID_SanPham)
        {
            this.ID_SanPham = iID_SanPham;
            SanPham sp = db.SanPhams.Single(p => p.ID_SanPham == iID_SanPham);
            TenSanPham = sp.TenSanPham;
            HinhAnh = sp.HinhAnh;
            DonGia = sp.GiaBan;
            SoLuong = 1;
            this.ThanhTien = SoLuong * DonGia;
            GiaGoc = sp.GiaGoc;
        }

        public ItemGioHang(int iID_SanPham, int sl)
        {
            this.ID_SanPham = iID_SanPham;
            SanPham sp = db.SanPhams.Single(p => p.ID_SanPham == iID_SanPham);
            TenSanPham = sp.TenSanPham;
            HinhAnh = sp.HinhAnh;
            DonGia = sp.GiaBan;
            SoLuong = sl;
            this.ThanhTien = SoLuong * DonGia;
        }
    }
}