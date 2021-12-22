using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP_HieuHaiSan.DAO;

namespace BTL_ASP_HieuHaiSan.Controllers
{
    public class HomeController : Controller
    {
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        
        public ActionResult Index()
        {
            var listSp = sanPhamDAO.getAll();
            ViewBag.getall = listSp;

            var listTop4 = sanPhamDAO.getTop4(4);
            ViewBag.productTop4 = listTop4;

            var listSpInCateTom = sanPhamDAO.getAllByCateName("Tôm");
            ViewBag.proTom = listSpInCateTom;

            var listSpInCateCa = sanPhamDAO.getAllByCateName("Cá tươi sống");
            ViewBag.proCa = listSpInCateCa;

            var listSpInCateCG = sanPhamDAO.getAllByCateName("Cua - Ghẹ");
            ViewBag.proCG = listSpInCateCG;

            var listSpInCateNSO = sanPhamDAO.getAllByCateName("Ngao - Sò - Ốc");
            ViewBag.proNSO = listSpInCateNSO;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}