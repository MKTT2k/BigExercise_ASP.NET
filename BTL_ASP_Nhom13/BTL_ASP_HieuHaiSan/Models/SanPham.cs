namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietGioHangs = new HashSet<ChiTietGioHang>();
        }

        [Key]
        [DisplayName("Mã sản phẩm")]
        public int ID_SanPham { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống!")]
        [StringLength(100)]
        [DisplayName("Tên sản phẩm")]
        public string TenSanPham { get; set; }

        [Required]
        [StringLength(100)]
        [Column(TypeName = "text")]
        [DisplayName("Hình ảnh")]
        public string HinhAnh { get; set; }

        [Required(ErrorMessage = "Giá gốc không được để trống!")]
        [Column(TypeName = "money")]
        [DisplayName("Giá gốc")]
        public decimal GiaGoc { get; set; }

        [Required(ErrorMessage = "Giá bán không được để trống!")]
        [Column(TypeName = "money")]
        [DisplayName("Giá bán")]
        public decimal GiaBan { get; set; }

        [Required(ErrorMessage = "Mô tả sản phẩm không được để trống!")]
        [Column(TypeName = "ntext")]
        [DisplayName("Mô tả")]
        public string MoTa { get; set; }

        [Required(ErrorMessage = "Số lượng không được để trống!")]
        [DisplayName("Số lượng")]
        public int SoLuong { get; set; }

        [DisplayName("Danh mục")]
        [Required(ErrorMessage = "Danh mục không được để trống!")]
        public int ID_DanhMuc { get; set; }
        public IEnumerable<SelectListItem> CategoryList { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }
    }
}
