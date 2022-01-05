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
using BTL_ASP_HieuHaiSan.Common;

namespace BTL_ASP_HieuHaiSan.Areas.Admin.Controllers
{
    public class TaiKhoansController : Controller
    {
        private HaiSanDB db = new HaiSanDB();

        // GET: Admin/TaiKhoans
        public ActionResult Index(string sortOrder, string searchStringName, string searchStringPhone,
            string currentFilter1, string currentFilter2, int? page)
        {
            //if (Session["ADMIN_SESSION"] == null || Session["ADMIN_SESSION"].ToString() == null)
            //    return RedirectToAction("DangNhap", "TaiKhoans");
            ViewBag.CurrentSort = sortOrder; //Biến lấy yêu cầu sắp xếp hiện tại

            ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
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

            //Lấy danh sách tài khoản
            var users = db.TaiKhoans.Where(s => s.TrangThai == true);
            //Lọc 
            if (!String.IsNullOrEmpty(searchStringName))
            {
                users = users.Where(p => p.HoTen.ToLower().Contains(searchStringName));
            }
            if (!String.IsNullOrEmpty(searchStringPhone))
            {
                users = users.Where(p => p.SDT.ToLower().Contains(searchStringPhone));
            }

            //Sắp xếp
            switch (sortOrder)
            {
                case "ten_desc":
                    users = users.OrderByDescending(s => s.HoTen);
                    break;
                default:
                    users = users.OrderBy(s => s.HoTen);
                    break;
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(users.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/TaiKhoans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);

            if (taiKhoan == null) //chi hien thi tai khoan user
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoans/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TaiKhoans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_TaiKhoan,Email,MatKhau,HoTen,GioiTinh,SDT,DiaChi,TrangThai")] TaiKhoan taiKhoan)
        {
            if (ModelState.IsValid)
            {
                var dao = new TaiKhoanDAO();
                if (dao.CheckEmail(taiKhoan.Email))
                {
                    ViewBag.UserName = "Email đã tồn tại.";
                }
                else
                {
                    taiKhoan.MatKhau = Encyptor.MD5Hash(taiKhoan.MatKhau);
                    db.TaiKhoans.Add(taiKhoan);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Admin/TaiKhoans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_TaiKhoan,Email,MatKhau,HoTen,GioiTinh,SDT,DiaChi,TrangThai")] TaiKhoan taiKhoan)
        {
            if (ModelState.IsValid)
            {
                taiKhoan.MatKhau = Encyptor.MD5Hash(taiKhoan.MatKhau);
                db.Entry(taiKhoan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Admin/TaiKhoans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            db.TaiKhoans.Remove(taiKhoan);
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
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            //if (ModelState.IsValid)
            //{
            //    var dao = new TaiKhoanDAO();
            //    var ketqua = dao.Login(model.Email, Encyptor.MD5Hash(model.Matkhau));
            //    if (ketqua == 2)
            //    {
            //        var tk = dao.Laytaikhoan(model.Email);
            //        var userSession = new TaiKhoanDangNhap();
            //        userSession.ID_TaiKhoan = tk.ID_TaiKhoan;
            //        userSession.Email = tk.Email;
            //        userSession.HoTen = tk.HoTen;
            //        Session.Add(CommonConstants.USER_SESSION, userSession);
            //        return Redirect("Admin/Home/Index");
            //    }
            //    else 
            //    {
            //        ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không chính xác.");
            //    }

            //}
            //return View();

            var email = collection["Email"];
            var matkhau = Encyptor.MD5Hash(collection["MatKhau"]);
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi1"] = "Chưa nhập email";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi1"] = "Chưa nhập mật khẩu";
            }
            else
            {
                TaiKhoan tk = db.TaiKhoans.SingleOrDefault(a => a.Email == email && a.MatKhau == matkhau);
                if (tk != null && tk.TrangThai == false)
                {
                    var adminSession = new TaiKhoanDangNhap();
                    adminSession.ID_TaiKhoan = tk.ID_TaiKhoan;
                    adminSession.Email = tk.Email;
                    adminSession.HoTen = tk.HoTen;
                    Session["ADMIN_SESSION"] = tk;
                    Session.Add(CommonConstants.ADMIN_SESSION, adminSession);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session.Clear();
            return RedirectToAction("DangNhap");
        }
    }
}
