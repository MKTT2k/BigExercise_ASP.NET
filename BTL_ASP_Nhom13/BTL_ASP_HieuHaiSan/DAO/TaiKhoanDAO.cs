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
            var ketqua = db.TaiKhoans.FirstOrDefault(x => x.Email == email && x.MatKhau  == matkhau);
            if (ketqua == null)
            {
                return 0;
            }
            else return 1;
            //var ketqua = db.TaiKhoans.SingleOrDefault(x => x.Email == email);
            //if (ketqua == null)
            //{
            //    //Tài khoản không tồn tại
            //    return 0;
            //}
            //else if (ketqua.MatKhau == matkhau)
            //{
            //    if (ketqua.TrangThai == true)
            //    {
            //        //Admin and Mod
            //        return 2;
            //    }
            //    else
            //    {
            //        //MEMBER
            //        return 1;
            //    }

            //}
            //else
            //{
            //    //Sai mật khẩu
            //    return -1;
            //}           
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