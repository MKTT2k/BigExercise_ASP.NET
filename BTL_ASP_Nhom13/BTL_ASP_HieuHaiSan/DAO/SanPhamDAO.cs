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

        public dynamic getTop4(int id)
        {
            var products = (from t in db.SanPhams where t.ID_DanhMuc == id orderby t.SoLuong select t).Take(4);
            return products;
        }
        public dynamic findById(int id)
        {
            var product = (from s in db.SanPhams where s.ID_SanPham == id select s).FirstOrDefault();
            return product;
        }
        public dynamic getAllByCateName(string ten)
        {
            var products = from p in db.SanPhams
                           join c in db.DanhMucs on p.ID_DanhMuc equals c.ID_DanhMuc
                           where c.TenDanhMuc == ten
                           select p;
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
    }
}