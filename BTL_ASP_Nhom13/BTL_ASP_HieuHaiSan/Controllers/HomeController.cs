using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP_HieuHaiSan.DAO;
using PagedList;

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

        public ActionResult ViewCate(int id)
        {
            var dm = danhMucDAO.findByIdObject(id);
            return View(dm);
        }
        //public ActionResult GetAllProductByCate(int id, string sortOrder, string searchString, string currentFilter, int? page)
        //{
        //    ViewBag.CurrentSort = sortOrder;

        //    ViewBag.SapTheoTenAZ = "ten_asc";
        //    ViewBag.SapTheoTenZA = "ten_desc";
        //    ViewBag.GiaTangDan = "gia_asc";
        //    ViewBag.GiaGiamDan = "gia_desc";

        //    if (searchString != null)
        //    {
        //        page = 1;
        //    }
        //    else
        //    {
        //        searchString = currentFilter;
        //    }
        //    ViewBag.CurrentFilter = searchString;

        //    var model = sanPhamDAO.getAllByCateId(id);

        //    if (!String.IsNullOrEmpty(searchString))
        //    {
        //        model = model.Where(p => p.TenSanPham.ToLower().Contains(searchString.ToLower())).ToList();
        //    }

        //    //Sắp xếp
        //    switch (sortOrder)
        //    {
        //        case "ten_desc":
        //            model = model.OrderByDescending(s => s.TenSanPham).ToList();
        //            break;
        //        case "gia_asc":
        //            model = model.OrderBy(s => s.GiaGoc).ToList();
        //            break;
        //        case "gia_desc":
        //            model = model.OrderByDescending(s => s.GiaGoc).ToList();
        //            break;
        //        default:
        //            model = model.OrderBy(s => s.TenSanPham).ToList();
        //            break;
        //    }
        //    int pageSize = 12;
        //    int pageNumber = (page ?? 1);

        //    return View(model.ToPagedList(pageNumber, pageSize));
        //}
    }
}