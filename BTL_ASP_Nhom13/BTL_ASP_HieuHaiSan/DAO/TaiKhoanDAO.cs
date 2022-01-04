using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_ASP_HieuHaiSan.Models;

namespace BTL_ASP_HieuHaiSan.DAO
{
    public class TaiKhoanDAO
    {
        private HaiSanDB db = new HaiSanDB();
        public TaiKhoanDAO()
        {
            db = new HaiSanDB();
        }

        public long Insert(TaiKhoan tk)
        {
            db.TaiKhoans.Add(tk);
            db.SaveChanges();
            return tk.ID_TaiKhoan;
        }

        public int Login(string email, string matkhau)
        {
            var ketqua = db.TaiKhoans.FirstOrDefault(x => x.Email == email && x.MatKhau == matkhau);
            if (ketqua != null)
            {
                if (ketqua.TrangThai == true) return 1; // user
                else return 2; // admin  
            }
            else
                return 0;
        }


        public TaiKhoan Laytaikhoan(String email)
        {
            return db.TaiKhoans.SingleOrDefault(x => x.Email == email);
        }

        public bool CheckEmail(string email)
        {
            return db.TaiKhoans.Count(x => x.Email == email) > 0;
        }

    }
}