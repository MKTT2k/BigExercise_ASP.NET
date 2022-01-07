using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using BTL_ASP_HieuHaiSan.Models;

namespace BTL_ASP_HieuHaiSan.DAO
{
    public class SanPhamDAO
    {
        private HaiSanDB db = new HaiSanDB();

        public dynamic getAll()
        {
            var products = (from s in db.SanPhams select s).ToList();
            return products;
        }

        public List<SanPham> GetAll()
        {
            var model = from c in db.SanPhams
                        select c;
            return model.GroupBy(x => x.ID_SanPham).Select(x => x.FirstOrDefault()).ToList();
        }


        public List<SanPham> getTop4(int id)
        {
            List<SanPham> products = (from t in db.SanPhams where t.ID_DanhMuc == id orderby t.SoLuong select t).Take(4).ToList();
            return products;
        }
        public List<SanPham> getTop8()
        {
            List<SanPham> products = (from t in db.SanPhams orderby t.SoLuong select t).Take(8).ToList();
            return products;
        }
        public dynamic findById(int id)
        {
            var product = (from s in db.SanPhams where s.ID_SanPham == id select s).FirstOrDefault();
            return product;
        }
        public List<SanPham> getAllByCateId(int id)
        {
            List<SanPham> products = (from p in db.SanPhams
                           join c in db.DanhMucs on p.ID_DanhMuc equals c.ID_DanhMuc
                           where c.ID_DanhMuc == id
                           select p).ToList();
            return products;
        }
        public List<SanPham> get8ByCateId(int id)
        {
            List<SanPham> products = (from p in db.SanPhams
                                      join c in db.DanhMucs on p.ID_DanhMuc equals c.ID_DanhMuc
                                      where c.ID_DanhMuc == id
                                      select p).Take(8).ToList();
            return products;
        }

        public void updateById(int id, SanPham sp)
        {
            SanPham spFind = db.SanPhams.Where(s => s.ID_SanPham == id).FirstOrDefault();
            spFind.TenSanPham = sp.TenSanPham;
            spFind.HinhAnh = sp.HinhAnh;
            spFind.GiaGoc = sp.GiaGoc;
            spFind.GiaBan = sp.GiaBan;
            spFind.MoTa = sp.MoTa;
            spFind.SoLuong = sp.SoLuong;
            if (spFind.ID_DanhMuc != sp.ID_DanhMuc)
            {
                spFind.ID_DanhMuc = sp.ID_DanhMuc;
            }

            System.Diagnostics.Debug.WriteLine(spFind.ToString());
            db.SaveChanges();
        }
        public void deleteById(int id)
        {
            var delete = (from s in db.SanPhams
                          where s.ID_SanPham == id
                          select s).First();
            db.SanPhams.Remove(delete);
            db.SaveChanges();
        }
        public void delete(int id)
        {
            List<SanPham> products = db.SanPhams.Where(x=>x.ID_DanhMuc == id).ToList();
            foreach (SanPham product in products)
            {
                db.SanPhams.Remove(product);
                db.SaveChanges();
            }
        }

        public int SoLuongSP(int id)
        {
            SanPham spFind = db.SanPhams.Where(s => s.ID_SanPham == id).FirstOrDefault();

            return spFind.SoLuong;
        }
    }
}