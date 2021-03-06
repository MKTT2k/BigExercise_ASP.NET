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
    public class TinTucVaoBepController : Controller
    {
        private HaiSanDB db = new HaiSanDB();

        // GET: Admin/TinTucVaoBep
        public ActionResult Index()
        {

            return View(db.TinTuc_VaoBep.ToList());
        }
        public ActionResult Display(string searchStringName, string currentFilter, int? page)
        {
            if (Session["ADMIN_SESSION"] == null || Session["ADMIN_SESSION"].ToString() == null)
                return RedirectToAction("DangNhap", "TaiKhoans");
            if (searchStringName != null)
            {
                page = 1; //Trang đầu tiên
            }
            else
            {
                searchStringName = currentFilter;
            }
            ViewBag.CurrentFilter = searchStringName;
            var tintuc = db.TinTuc_VaoBep.Select(s => s);
            if (!String.IsNullOrEmpty(searchStringName))
            {
                tintuc = tintuc.Where(p => p.TieuDe.ToLower().Contains(searchStringName));
            }
            tintuc = tintuc.OrderBy(s => s.ID_TinTuc);
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(tintuc.ToPagedList(pageNumber, pageSize));

        }
        // GET: Admin/TinTucVaoBep/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc_VaoBep tinTuc_VaoBep = db.TinTuc_VaoBep.Find(id);
            System.Diagnostics.Debug.WriteLine(tinTuc_VaoBep.NoiDung);
            if (tinTuc_VaoBep == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc_VaoBep);
        }

        // GET: Admin/TinTucVaoBep/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TinTucVaoBep/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID_TinTuc,TieuDe,HinhAnh,NgayTao,NoiDung,Status")] TinTuc_VaoBep tinTuc_VaoBep, FormCollection fo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    tinTuc_VaoBep.HinhAnh = "";
                    var f = Request.Files["a"];
                    var noidung = fo["NoiDung"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/Assets/Client/datafiles/tintuc/" + FileName);
                        f.SaveAs(UploadPath);
                        tinTuc_VaoBep.HinhAnh = FileName;
                    }
                    tinTuc_VaoBep.NoiDung = noidung;
                    db.TinTuc_VaoBep.Add(tinTuc_VaoBep);
                    db.SaveChanges();
                }
                return RedirectToAction("Display");
            }
            catch (Exception)
            {
                ViewBag.Error = "Lỗi thêm tin tức!";
                return View(tinTuc_VaoBep);
            }



        }

        // GET: Admin/TinTucVaoBep/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc_VaoBep tinTuc_VaoBep = db.TinTuc_VaoBep.Find(id);
            if (tinTuc_VaoBep == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc_VaoBep);
        }

        // POST: Admin/TinTucVaoBep/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID_TinTuc,TieuDe,HinhAnh,NoiDung,NgayTao,Status")] TinTuc_VaoBep tinTuc_VaoBep, FormCollection fo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    tinTuc_VaoBep.HinhAnh = Request["img"];
                    var f = Request.Files["a"];
                    var Noidung = fo["NoiDung"];
                    System.Diagnostics.Debug.WriteLine(Noidung);
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UpLoadPath = Server.MapPath("~/Assets/Client/datafiles/tintuc/" + FileName);
                        f.SaveAs(UpLoadPath);
                        tinTuc_VaoBep.HinhAnh = FileName;

                    }
                    tinTuc_VaoBep.NoiDung = Noidung;
                    db.Entry(tinTuc_VaoBep).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("Display");
            }
            catch (Exception)
            {
                ViewBag.Error = "Lỗi không sửa được tin tức";
                return View(tinTuc_VaoBep);
            }


        }

        // GET: Admin/TinTucVaoBep/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc_VaoBep tinTuc_VaoBep = db.TinTuc_VaoBep.Find(id);
            if (tinTuc_VaoBep == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc_VaoBep);
        }

        // POST: Admin/TinTucVaoBep/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TinTuc_VaoBep tinTuc_VaoBep = db.TinTuc_VaoBep.Find(id);
            db.TinTuc_VaoBep.Remove(tinTuc_VaoBep);
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