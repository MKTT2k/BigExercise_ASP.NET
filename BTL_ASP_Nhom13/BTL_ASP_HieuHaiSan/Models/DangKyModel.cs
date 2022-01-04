using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BTL_ASP_HieuHaiSan.Models
{
    public class DangkyModel
    {
        [Key]
        public int ID_TaiKhoan { get; set; }

        [Display(Name = " ")]
        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage = "Vui lòng nhập đúng định dạng")]
        public string Email { get; set; }

        [Display(Name = " ")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [StringLength(30, MinimumLength = 6, ErrorMessage = "Mật khẩu tối thiểu 6 ký tự")]
        public string MatKhau { get; set; }

        [Display(Name = " ")]
        [Required(ErrorMessage = "Vui lòng xác nhận lại mật khẩu")]
        [Compare("MatKhau", ErrorMessage = "Xác nhận mật khẩu không đúng")]
        public string NhapLaiMatKhau { get; set; }

        [Display(Name = " ")]
        [StringLength(150, ErrorMessage = "Tên quá dài.")]
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public string HoTen { get; set; }

        [Display(Name = " ")]
        [Required(ErrorMessage = "Vui lòng chọn giới tính")]
        public bool GioiTinh { get; set; }

        [Display(Name = " ")]
        [Phone(ErrorMessage = "Vui lòng nhập đúng định dạng")]
        [MinLength(5, ErrorMessage = "Số điện thoại quá ngắn")]
        [MaxLength(15, ErrorMessage = "Số điện thoại quá dài")]
        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        public string SDT { get; set; }

        [Display(Name = " ")]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string DiaChi { get; set; }

    }
}
