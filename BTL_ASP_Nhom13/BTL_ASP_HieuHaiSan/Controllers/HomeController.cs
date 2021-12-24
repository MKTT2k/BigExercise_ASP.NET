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
        DanhMucDAO danhMucDAO = new DanhMucDAO();
        
        public ActionResult Index()
        {
            var listSp = sanPhamDAO.getAll();
            ViewBag.getall = listSp;

            var listTop4 = sanPhamDAO.getTop4(4);
            ViewBag.productTop4 = listTop4;

            var listDm = danhMucDAO.getAll();
            ViewBag.listDm = listDm; 
            
            var listDm8 = danhMucDAO.getAllTake(8);
            ViewBag.listDm8 = listDm8;
            return View();
        }
        
        public ActionResult Details(int id)
        {
            var sp = sanPhamDAO.findById(id);
            return View(sp);
        }
    }
}