using BTL_ASP_HieuHaiSan.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_ASP_HieuHaiSan.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        TinTucDAO tintuc = new TinTucDAO();
      
        public ActionResult Tintuc()
        {
            var listTinTuc = tintuc.getTintuc();
            ViewBag.getTinTuc = listTinTuc;

            return View();
        }
        public ActionResult Vaobep()
        {
            var listVaoBep = tintuc.getVaobep();
            ViewBag.getVaoBep = listVaoBep;
            return View();
        }
        public ActionResult Details(int id)
        {
            var tt = tintuc.findById(id);
            return View(tt);
        }
        public ActionResult DetailVaoBep(int id)
        {
            var tt = tintuc.findById(id);
            return View(tt);
        }
    }
}