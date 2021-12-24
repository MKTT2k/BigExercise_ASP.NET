﻿namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMuc")]
    public partial class DanhMuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DanhMuc()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        [Required(ErrorMessage = "Mã danh mục không được để trống!")]
        [DisplayName("ID danh mục")]
        public int ID_DanhMuc { get; set; }

        [Required(ErrorMessage = "Tên danh mục không được để trống!")]
        [StringLength(50)]
        [DisplayName("Tên danh mục")]
        public string TenDanhMuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
