using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_ASP_HieuHaiSan.Models;
using PagedList;

namespace BTL_ASP_HieuHaiSan.DAO
{
    public class DanhMucDAO
    {
        private HaiSanDB db = new HaiSanDB();
        public List<DanhMuc> getAll()
        {
            List<DanhMuc> category = (from s in db.DanhMucs select s).ToList();
            return category;
        }
        public List<DanhMuc> getAllTake(int take)
        {
            List<DanhMuc> category = (from s in db.DanhMucs select s).Take(take).ToList();
            return category;
        }

        public dynamic getAllWithPage()
        {
            var category = db.DanhMucs.Select(s => s);
            category = category.OrderBy(s => s.ID_DanhMuc);
            return category;
        }

        public DanhMuc findByName(string name)
        {
            var category = (from s in db.DanhMucs where s.TenDanhMuc == name select s).FirstOrDefault();
            return category;
        }

        public DanhMuc findByIdObject(int id)
        {
            var category = (from s in db.DanhMucs where s.ID_DanhMuc == id select s).FirstOrDefault();
            return category;
        }


        public dynamic findById(int id)
        {
            var category = (from s in db.DanhMucs where s.ID_DanhMuc == id select s).FirstOrDefault();
            return category;
        }

        public void updateById(int id, DanhMuc danhMuc)
        {
            DanhMuc danhMucFind = db.DanhMucs.Where(s => s.ID_DanhMuc == id).FirstOrDefault();
            danhMucFind.TenDanhMuc = danhMuc.TenDanhMuc;
            System.Diagnostics.Debug.WriteLine(danhMucFind.ToString());
            db.SaveChanges();
        }

        public void deleteById(int id)
        {
            var delete = (from s in db.DanhMucs
                          where s.ID_DanhMuc == id
                          select s).First();
            db.DanhMucs.Remove(delete);
            db.SaveChanges();

        }
    }
}