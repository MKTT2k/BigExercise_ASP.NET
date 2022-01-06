using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using BTL_ASP_HieuHaiSan.DAO;

namespace BTL_ASP_HieuHaiSan.Controllers
{
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        public ActionResult Index(int? page, string currentString)
        {
            string searchString = Request["SearchString"];
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentString;
            }
            ViewBag.CurrentString = searchString;
            var dao = new SanPhamDAO();
            var model = dao.GetAll();

            if (!String.IsNullOrEmpty(searchString))
            {
                model = model.Where(p => p.TenSanPham.Contains(searchString)).ToList();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            int pageSize = 12;
            int pageNumber = (page ?? 1);

            return View(model.ToPagedList(pageNumber, pageSize));
        }
    }


}