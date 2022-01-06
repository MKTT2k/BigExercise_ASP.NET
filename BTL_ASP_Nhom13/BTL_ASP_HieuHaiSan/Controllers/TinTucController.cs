using BTL_ASP_HieuHaiSan.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP_HieuHaiSan.Models;
using PagedList;

namespace BTL_ASP_HieuHaiSan.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        TinTucDAO tintuc = new TinTucDAO();
        private HaiSanDB db = new HaiSanDB();

        public ActionResult Tintuc(int? page)
        {
            var listTinTuc = db.TinTuc_VaoBep.Where(s=>s.Status==true).Select(s => s);
            listTinTuc = listTinTuc.OrderBy(s => s.ID_TinTuc);
            int pageSize = 8;
            int pageNumber = (page ?? 1);

            return View(listTinTuc.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Vaobep(int? page)
        {
            var listVaoBep = db.TinTuc_VaoBep.Where(s => s.Status == false).Select(s => s);
            listVaoBep = listVaoBep.OrderBy(s => s.ID_TinTuc);
            int pageSize = 8;
            int pageNumber = (page ?? 1);

            return View(listVaoBep.ToPagedList(pageNumber, pageSize));
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