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
            ChiTietGioHangs = new HashSet<ChiTietGioHang>();
        }

        [Key]
        [Display(Name = "Mã sản phẩm")]
        public int ID_SanPham { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống!")]
        [StringLength(100)]
        [Display(Name = "Tên sản phẩm")]
        public string TenSanPham { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Hình ảnh")]
        public string HinhAnh { get; set; }

        [Required(ErrorMessage = "Giá gốc không được để trống!")]
        [Column(TypeName = "money")]
        [Display(Name = "Giá gốc")]
        public decimal GiaGoc { get; set; }

        [Required(ErrorMessage = "Giá bán không được để trống!")]
        [Column(TypeName = "money")]
        [Display(Name = "Giá bán")]
        public decimal GiaBan { get; set; }

        [Required(ErrorMessage = "Chưa nhập mô tả!")]
        [Column(TypeName = "ntext")]
        [Display(Name = "Mô tả")]
        public string MoTa { get; set; }

        [Required(ErrorMessage = "Thiếu số lượng!")]
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }

        [Required(ErrorMessage = "Danh mục không được để trống!")]
        [Display(Name = "Danh mục")]
        public int ID_DanhMuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }
    }
}
