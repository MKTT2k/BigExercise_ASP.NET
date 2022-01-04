using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_ASP_HieuHaiSan.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if(Session["ADMIN_SESSION"] == null || Session["ADMIN_SESSION"].ToString() == null)
                return RedirectToAction("DangNhap", "TaiKhoans");
            return View();
        }
    }
}