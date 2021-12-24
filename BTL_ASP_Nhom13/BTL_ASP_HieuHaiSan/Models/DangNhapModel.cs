using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BTL_ASP_HieuHaiSan.Models
{
    public class DangnhapModel
    {
        [Key]
        [Display(Name = "Email")]
        [Required(ErrorMessage = "Vui lòng nhập tài khoản")]
        public string Email { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string Matkhau { get; set; }
    }
}