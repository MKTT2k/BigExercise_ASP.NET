using BTL_ASP_HieuHaiSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_ASP_HieuHaiSan.DAO
{
    public class DonHangDAO
    {
        private HaiSanDB db = new HaiSanDB();
        public List<SanPham> findById(int ?id)
        {
            List<SanPham> sp = (from s in db.ChiTietDonHangs  
                                 join s3 in db.SanPhams on s.ID_SanPham equals s3.ID_SanPham
                                where s.ID_DonHang == id 
                                select s3).ToList();
            return sp;
        }
        public ChiTietDonHang chiTietDonHang(int id_dh, int id_sp)
        {
            ChiTietDonHang ct = (from s in db.ChiTietDonHangs where s.ID_DonHang == id_dh && s.ID_SanPham == id_sp select s).FirstOrDefault();
            return ct;
        }
        public void delete(int id)
        {
            List<ChiTietDonHang> ctdh = db.ChiTietDonHangs.Where(x => x.ID_DonHang == id).ToList();
            foreach (ChiTietDonHang c in ctdh)
            {
                db.ChiTietDonHangs.Remove(c);
                db.SaveChanges();
            }
        }
    }
}   