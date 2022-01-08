using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_ASP_HieuHaiSan.DAO;
using BTL_ASP_HieuHaiSan.Models;
using PagedList;
namespace BTL_ASP_HieuHaiSan.Areas.Admin.Controllers
{
    public class DonHangsController : Controller
    {
        private HaiSanDB db = new HaiSanDB();
        DonHangDAO dh = new DonHangDAO();
        // GET: Admin/DonHangs
        public ActionResult Index(string sortOrder, string searchStringName, string searchStringPhone,
            string currentFilter1, string currentFilter2, int? page)
        {
            ViewBag.CurrentSort = sortOrder; //Biến lấy yêu cầu sắp xếp hiện tại

            ViewBag.SapTheoID = String.IsNullOrEmpty(sortOrder) ? "id_desc" : "";
            //Lấy giá trị của bộ lọc hiên tại
            if (searchStringName != null && searchStringPhone != null)
            {
                page = 1; //Trang đầu tiên
            }
            else
            {
                searchStringName = currentFilter1;
                searchStringPhone = currentFilter2;
            }
            ViewBag.CurrentFilter1 = searchStringName;
            ViewBag.CurrentFilter2 = searchStringPhone;

            var donHangs = db.DonHangs.Include(d => d.TaiKhoan);
            if (!String.IsNullOrEmpty(searchStringName))
            {
                donHangs = donHangs.Where(p => p.NguoiNhan.ToLower().Contains(searchStringName));
            }
            if (!String.IsNullOrEmpty(searchStringPhone))
            {
                donHangs = donHangs.Where(p => p.SDTNhan.ToLower().Contains(searchStringPhone));
            }

            //Sắp xếp
            switch (sortOrder)
            {
                case "id_desc":
                    donHangs = donHangs.OrderByDescending(s => s.ID_DonHang);
                    break;
                default:
                    donHangs = donHangs.OrderBy(s => s.ID_DonHang);
                    break;
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(donHangs.ToPagedList(pageNumber, pageSize));
            
          
        }

        // GET: Admin/DonHangs/Details/5
        public ActionResult Details(int? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            ViewBag.listSP = dh.findById(id).ToList();
            //foreach (var item in ViewBag.listSP)
            //{
            //    ViewBag.sl = dh.chiTietDonHang(id, item.ID_SanPham).SoLuongMua;
            //}
            if (donHang == null)
            {
                return HttpNotFound();
            }
            return View(donHang);
        }

        // GET: Admin/DonHangs/Create
        public ActionResult Create()
        {
            ViewBag.ID_TaiKhoan = new SelectList(db.TaiKhoans, "ID_TaiKhoan", "Email");
            return View();
        }

        // POST: Admin/DonHangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_DonHang,ID_TaiKhoan,NguoiNhan,SDTNhan,EmailNhan,DiaChiNhan,GhiChu,PTThanhToan,NgayDat,TrangThai")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                db.DonHangs.Add(donHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_TaiKhoan = new SelectList(db.TaiKhoans, "ID_TaiKhoan", "Email", donHang.ID_TaiKhoan);
            return View(donHang);
        }

        // GET: Admin/DonHangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_TaiKhoan = new SelectList(db.TaiKhoans, "ID_TaiKhoan", "Email", donHang.ID_TaiKhoan);
            return View(donHang);
        }

        // POST: Admin/DonHangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_DonHang,ID_TaiKhoan,NguoiNhan,SDTNhan,EmailNhan,DiaChiNhan,GhiChu,PTThanhToan,NgayDat,TrangThai")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_TaiKhoan = new SelectList(db.TaiKhoans, "ID_TaiKhoan", "Email", donHang.ID_TaiKhoan);
            return View(donHang);
        }

        // GET: Admin/DonHangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return HttpNotFound();
            }
            return View(donHang);
        }

        // POST: Admin/DonHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            
            DonHang donHang = db.DonHangs.Find(id);
            var dao = new DonHangDAO();
            dao.delete(id);
            db.DonHangs.Remove(donHang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult Accept(int id)
        {
            DonHang donHang = db.DonHangs.Find(id);
            donHang.TrangThai = 2;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Pass(int id)
        {
            DonHang donHang = db.DonHangs.Find(id);
            donHang.TrangThai = 3;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Cancel(int id)
        {
            DonHang donHang = db.DonHangs.Find(id);
            donHang.TrangThai = 4;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Xoa(int id)
        {
            
            DonHang ct = db.DonHangs.SingleOrDefault(n => n.ID_DonHang == id);
            if (ct == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<ChiTietDonHang> ctdh = (from s in db.ChiTietDonHangs where s.ID_DonHang == id select s).ToList();
            foreach (var item in ctdh)
            {
                db.ChiTietDonHangs.Remove(item);
            }
            db.DonHangs.Remove(ct);
            return RedirectToAction("Index");
        }
    }
}
