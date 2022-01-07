using BTL_ASP_HieuHaiSan.Common;
using BTL_ASP_HieuHaiSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_ASP_HieuHaiSan.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        HaiSanDB db = new HaiSanDB();
        // GET: GioHang
        public List<ItemGioHang> LayGioHang()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<ItemGioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(int MaSP, string strURL)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.ID_SanPham == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.ID_SanPham == MaSP);
            if (spCheck != null)
            {
                if (sp.SoLuong < spCheck.SoLuong)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.SoLuong * spCheck.DonGia;
                return Redirect(strURL);
            }

            ItemGioHang itemGH = new ItemGioHang(MaSP);
            if (sp.SoLuong < itemGH.SoLuong)
            {
                return View("ThongBao");
            }

            lstGioHang.Add(itemGH);
            return Redirect(strURL);
        }
        private int TinhTongSoLuong()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.SoLuong);
        }

        private int TongSoLoaiSP()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Count();
        }

        public decimal TinhTongTien()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.SoLuong * n.DonGia);
        }

        public ActionResult XemGioHang()
        {
            List<ItemGioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            return View(lstGioHang);
        }

        public ActionResult GioHangPartial()
        {
            if (TinhTongSoLuong() == 0)
            {
                ViewBag.TongSoLuong = 0;
                ViewBag.TongTien = 0;
                ViewBag.TongSoLoaiSP = 0;
                return PartialView();
            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            ViewBag.TongSoLoaiSP = TongSoLoaiSP();
            return PartialView();
        }

        public ActionResult XoaGioHang(int MaSP)
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.ID_SanPham == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.ID_SanPham == MaSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            lstGioHang.Remove(spCheck);
            return RedirectToAction("XemGioHang");
        }

        public ActionResult CapNhatGioHang(int MaSP, FormCollection f)
        {
            List<ItemGioHang> lstGioHang = LayGioHang();
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.ID_SanPham == MaSP);
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.ID_SanPham == MaSP);
            if (spCheck != null)
            {
                spCheck.SoLuong = int.Parse(f["quantity"].ToString());
            }
            if (spCheck.SoLuong > sp.SoLuong)
            {
                return View("ThongBao");
            }
            return RedirectToAction("XemGioHang");
        }

        public ActionResult ThanhToan()
        {
            List<ItemGioHang> lstGioHang = LayGioHang();
            ViewBag.TongTien = TinhTongTien();
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            TaiKhoanDangNhap acc = (TaiKhoanDangNhap)Session[BTL_ASP_HieuHaiSan.Common.CommonConstants.USER_SESSION];
            if (acc == null)
            {
                return RedirectToAction("Dangnhap", "Taikhoans");
            }
            return View(lstGioHang);

        }

        public ActionResult DatHang(FormCollection f)
        {
            DonHang dh = new DonHang();
            TaiKhoanDangNhap acc = (TaiKhoanDangNhap)Session[BTL_ASP_HieuHaiSan.Common.CommonConstants.USER_SESSION];

            List<ItemGioHang> lstGioHang = LayGioHang();
            if (acc != null)
            {
                dh.ID_TaiKhoan = acc.ID_TaiKhoan;
                dh.NguoiNhan = f["txt_cfullname"].ToString();
                dh.SDTNhan = f["txt_nphone"].ToString();
                dh.DiaChiNhan = f["txt_caddress"].ToString();
                dh.EmailNhan = f["txt_cemail"].ToString();
                dh.GhiChu = f["txt_cnote"].ToString();
                int x = int.Parse(f["type_payment"].ToString());
                if (x == 1)
                {
                    dh.PTThanhToan = true;
                }
                else
                {
                    dh.PTThanhToan = false;
                }
                dh.NgayDat =(DateTime) DateTime.Today;
                dh.TrangThai = 1;
                db.DonHangs.Add(dh);
                db.SaveChanges();
                foreach (var item in lstGioHang)
                {
                    SanPham sp = db.SanPhams.SingleOrDefault(n => n.ID_SanPham == item.ID_SanPham);
                    ChiTietDonHang ctdh = new ChiTietDonHang();
                    ctdh.ID_DonHang = dh.ID_DonHang;
                    ctdh.ID_SanPham = item.ID_SanPham;
                    ctdh.SoLuongMua = item.SoLuong;
                    db.ChiTietDonHangs.Add(ctdh);
                    sp.SoLuong -= item.SoLuong;
                }
                db.SaveChanges();
                Session["GioHang"] = null;

                return RedirectToAction("XacNhanDonHang", "GioHang");
            }
            else
                return RedirectToAction("Dangnhap", "Taikhoans");


        }

        public ActionResult XacNhanDonHang()
        {
            return View();
        }
    }
}