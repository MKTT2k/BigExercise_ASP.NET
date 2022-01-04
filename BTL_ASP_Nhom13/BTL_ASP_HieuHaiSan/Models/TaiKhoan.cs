namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            DonHangs = new HashSet<DonHang>();
        }

        [Key]
        public int ID_TaiKhoan { get; set; }

        [Required]
        [Display(Name = "Email")]
        [StringLength(50)]
        [EmailAddress(ErrorMessage = "Vui lòng nhập đúng định dạng")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Mật khẩu")]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [Required]
        [Display(Name = "Họ tên")]
        [StringLength(50)]
        public string HoTen { get; set; }

        [Display(Name = "Giới tính")]
        public bool GioiTinh { get; set; }

        [Required]
        [Display(Name = "Điện thoại")]
        [StringLength(13)]
        [Phone(ErrorMessage = "Vui lòng nhập đúng định dạng")]
        public string SDT { get; set; }

        [Required]
        [Display(Name = "Địa chỉ")]
        [StringLength(200)]
        public string DiaChi { get; set; }


        public bool TrangThai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHangs { get; set; }
    }
}
