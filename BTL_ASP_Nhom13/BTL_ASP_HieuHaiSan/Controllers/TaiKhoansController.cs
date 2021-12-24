using BTL_ASP_HieuHaiSan.Common;
using BTL_ASP_HieuHaiSan.DAO;
using BTL_ASP_HieuHaiSan.Models;
using System.Security.Cryptography;
using System.Text;
using System.Web.Mvc;

namespace BTL_ASP_HieuHaiSan.Controllers
{
    public class TaiKhoansController : Controller
    {
        private HaiSanDB db = new HaiSanDB();

        // GET: TaiKhoans
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Dangky()
        {
            return View(new DangkyModel());
        }

        [HttpPost]
        public ActionResult Dangky(DangkyModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new TaiKhoanDAO();
                if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã được sử dụng!");
                }
                else
                {
                    var tk = new TaiKhoan();
                    tk.Email = model.Email;
                    tk.MatKhau = model.MatKhau;
                    tk.HoTen = model.HoTen;
                    tk.GioiTinh = model.GioiTinh;
                    tk.SDT = model.SDT;
                    tk.DiaChi = model.DiaChi;
                    tk.TrangThai = true;
                    var ketqua = dao.Insert(tk);
                    if (ketqua > 0)
                    {
                        ViewBag.Sucess = "Đăng ký thành công";
                        ModelState.Clear();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }
            }
            return View();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View(new DangnhapModel());
        }

        [HttpPost]
        public ActionResult Dangnhap(DangnhapModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new TaiKhoanDAO();
                var ketqua = dao.Login(model.Email, model.Matkhau);
                if (ketqua == 0)
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không chính xác.");
                }
                else if (ketqua == 1)
                {
                    var tk = dao.Laytaikhoan(model.Email);
                    var userSession = new TaikhoanDangnhap();
                    userSession.ID_TaiKhoan = tk.ID_TaiKhoan;
                    userSession.Email = tk.Email;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/Home/Index");
                }
            }
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session.Clear();
            return RedirectToAction("Dangnhap");
        }

        //mã hóa password MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;
            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");
            }
            return byte2String;
        }
    }
}
