namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        [Key]
        [Display(Name = "ID")]
        public int ID_DonHang { get; set; }
        [Display(Name = "Tài khoản")]
        public int ID_TaiKhoan { get; set; }

        [Required]
        [StringLength(200)]
        [Display(Name = "Người nhận")]
        public string NguoiNhan { get; set; }

        [Required]
        [StringLength(10)]
        [Display(Name = "SĐT Nhận")]
        public string SDTNhan { get; set; }

        [Required]
        [StringLength(200)]
        [Display(Name = "Email Nhận")]
        public string EmailNhan { get; set; }

        [Required]
        [StringLength(500)]
        [Display(Name = "Địa chỉ")]
        public string DiaChiNhan { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
        [Display(Name = "PTTT")]
        public bool PTThanhToan { get; set; }
        [Display(Name = "Ngày đặt")]
        public DateTime NgayDat { get; set; }
        [Display(Name = "Trạng thái")]
        public int? TrangThai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
