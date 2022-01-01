using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_ASP_HieuHaiSan.Models;
using PagedList;
namespace BTL_ASP_HieuHaiSan.Areas.Admin.Controllers
{
    public class SanPhamsController : Controller
    {
        private HaiSanDB db = new HaiSanDB();

        public ActionResult Display(string sortOrder, string searchTenSP, string currentFilterTenSP, int ?page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.SapTheoDM = sortOrder == "dm" ? "dm_desc" : "dm";
            ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
            ViewBag.SapTheoGia = sortOrder == "gia" ? "gia_desc" : "gia";

            if(searchTenSP != null)
            {
                page = 1;
            }else
            {
                searchTenSP = currentFilterTenSP;
            }
            ViewBag.CurrentFilterTenSP = searchTenSP;

            var sanpham = db.SanPhams.Select(s => s);

            if (!String.IsNullOrEmpty(searchTenSP))
            {
                sanpham = sanpham.Where(p=>p.TenSanPham.Contains(searchTenSP));
            }
            switch (sortOrder)
            {
                case "dm":
                    sanpham = sanpham.OrderBy(s => s.DanhMuc.TenDanhMuc);
                    break;
                case "dm_desc":
                    sanpham = sanpham.OrderByDescending(s => s.DanhMuc.TenDanhMuc);
                    break;
                case "gia":
                    sanpham = sanpham.OrderBy(s => s.GiaBan);
                    break;
                case "gia_desc":
                    sanpham = sanpham.OrderByDescending(s => s.GiaBan);
                    break;
                case "ten_desc":
                    sanpham = sanpham.OrderByDescending(s => s.TenSanPham);
                    break;
                default:
                    sanpham = sanpham.OrderBy(s => s.TenSanPham);
                    break;
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(sanpham.ToPagedList(pageNumber, pageSize));
        }
        // GET: Admin/SanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.ID_DanhMuc = new SelectList(db.DanhMucs, "ID_DanhMuc", "TenDanhMuc");
            return View();
        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_SanPham,TenSanPham,HinhAnh,GiaGoc,GiaBan,MoTa,SoLuong,ID_DanhMuc")] SanPham sanPham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    sanPham.HinhAnh = "";
                    var f = Request.Files["a"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/Assets/Client/datafiles/setone/" + FileName);
                        f.SaveAs(UploadPath);
                        sanPham.HinhAnh = FileName;
                    }
                    db.SanPhams.Add(sanPham);
                    db.SaveChanges();
                    return RedirectToAction("Display");
                }
                ViewBag.ID_DanhMuc = new SelectList(db.DanhMucs, "ID_DanhMuc", "TenDanhMuc", sanPham.ID_DanhMuc);
                return View(sanPham);
            }
            catch (Exception e)
            {
                ViewBag.Error = "Lỗi thêm sản phẩm mới! " + e.Message;
                ViewBag.ID_DanhMuc = new SelectList(db.DanhMucs, "ID_DanhMuc", "TenDanhMuc", sanPham.ID_DanhMuc);
                return View(sanPham);
            }
        }

        // GET: Admin/SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_DanhMuc = new SelectList(db.DanhMucs, "ID_DanhMuc", "TenDanhMuc", sanPham.ID_DanhMuc);
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_SanPham,TenSanPham,HinhAnh,GiaGoc,GiaBan,MoTa,SoLuong,ID_DanhMuc")] SanPham sanPham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    sanPham.HinhAnh = "";
                    var f = Request.Files["a"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/Assets/Client/datafiles/setone/" + FileName);
                        f.SaveAs(UploadPath);
                        sanPham.HinhAnh = FileName;
                    }
                    db.Entry(sanPham).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Display");
                }
                return View(sanPham);
            }
            catch (Exception e)
            {
                ViewBag.Error = "Lỗi sửa sản phẩm! " + e.Message;
                ViewBag.ID_DanhMuc = new SelectList(db.DanhMucs, "ID_DanhMuc", "TenDanhMuc", sanPham.ID_DanhMuc);
                return View(sanPham);
            }
            
        }

        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Display");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
