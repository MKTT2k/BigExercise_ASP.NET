using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_ASP_HieuHaiSan.Models;
using BTL_ASP_HieuHaiSan.DAO;
using PagedList;

namespace BTL_ASP_HieuHaiSan.Areas.Admin.Controllers
{

    public class DanhMucsController : Controller
    {
        DanhMucDAO danhMucDAO = new DanhMucDAO();
        private HaiSanDB db = new HaiSanDB();

        // GET: Admin/DanhMucs
        public ActionResult Index(string sortOrder, string searchName, string currentFilter, int? page)
        {
            if (Session["ADMIN_SESSION"] == null || Session["ADMIN_SESSION"].ToString() == null)
                return RedirectToAction("DangNhap", "TaiKhoans");
            ViewBag.CurrentSort = sortOrder;
            ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
            ViewBag.SapTheoMa = sortOrder == "id" ? "id_desc" : "id";

            if (searchName != null)
            {
                page = 1;
            }
            else
            {
                searchName = currentFilter;
            }
            ViewBag.CurrentFilter = searchName;
            var danhMucs = db.DanhMucs.Select(p => p);

            if (!String.IsNullOrEmpty(searchName))
            {
                danhMucs = danhMucs.Where(p => p.TenDanhMuc.Contains(searchName));
            }
            switch (sortOrder)
            {
                case "id":
                    danhMucs = danhMucs.OrderBy(s => s.ID_DanhMuc);
                    break;
                case "id_desc":
                    danhMucs = danhMucs.OrderByDescending(s => s.ID_DanhMuc);
                    break;
                case "ten_desc":
                    danhMucs = danhMucs.OrderByDescending(s => s.TenDanhMuc);
                    break;
                default:
                    danhMucs = danhMucs.OrderBy(s => s.TenDanhMuc);
                    break;
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(danhMucs.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/DanhMucs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                return HttpNotFound();
            }
            return View(danhMuc);
        }

        // GET: Admin/DanhMucs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/DanhMucs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_DanhMuc,TenDanhMuc")] DanhMuc danhMuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (danhMucDAO.check(danhMuc.TenDanhMuc))
                    {
                        ModelState.AddModelError("", "Tên danh mục đã tồn tại!");
                    }
                    else
                    {
                        db.DanhMucs.Add(danhMuc);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                }
                return View(danhMuc);
            }
            catch (Exception e)
            {
                ViewBag.Error = "Lỗi không thêm được danh mục! " + e.Message;
                return View(danhMuc);
            }
        }

        // GET: Admin/DanhMucs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                return HttpNotFound();
            }
            return View(danhMuc);
        }

        // POST: Admin/DanhMucs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_DanhMuc,TenDanhMuc")] DanhMuc danhMuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(danhMuc).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(danhMuc);
            }
            catch (Exception e)
            {
                ViewBag.Error = "Lỗi không sửa được danh mục! " + e.Message;
                return View(danhMuc);
            }

        }

        // GET: Admin/DanhMucs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                return HttpNotFound();
            }
            return View(danhMuc);
        }

        // POST: Admin/DanhMucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var products = new SanPhamDAO();
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            try
            {
                products.delete(id);
                db.DanhMucs.Remove(danhMuc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ViewBag.Error = "Lỗi không xóa được danh mục! " + e.Message;
                return View("Delete", danhMuc);
            }
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
