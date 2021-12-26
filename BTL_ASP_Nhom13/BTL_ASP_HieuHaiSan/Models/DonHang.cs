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
        public int ID_DonHang { get; set; }

        public int ID_TaiKhoan { get; set; }

        [Required]
        [StringLength(200)]
        public string NguoiNhan { get; set; }

        [Required]
        [StringLength(10)]
        public string SDTNhan { get; set; }

        [Required]
        [StringLength(200)]
        public string EmailNhan { get; set; }

        [Required]
        [StringLength(500)]
        public string DiaChiNhan { get; set; }

        [Column(TypeName = "ntext")]
        public string GhiChu { get; set; }

        public bool PTThanhToan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
