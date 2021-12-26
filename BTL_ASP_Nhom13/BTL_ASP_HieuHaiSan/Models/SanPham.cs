namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        [Key]
        public int ID_SanPham { get; set; }

        [Required]
        [StringLength(100)]
        public string TenSanPham { get; set; }

        [Column(TypeName = "text")]
        public string HinhAnh { get; set; }

        [Column(TypeName = "money")]
        public decimal GiaGoc { get; set; }

        [Column(TypeName = "money")]
        public decimal GiaBan { get; set; }

        [Column(TypeName = "ntext")]
        public string MoTa { get; set; }

        public int SoLuong { get; set; }

        public int ID_DanhMuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }
    }
}
