namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [Key]
        public int ID_HoaDon { get; set; }

        public int ID_GioHang { get; set; }

        [Required]
        [StringLength(50)]
        public string MoTaHD { get; set; }

        [Required]
        [StringLength(100)]
        public string PTThanhToan { get; set; }

        public DateTime NgayTao { get; set; }

        public virtual GioHang GioHang { get; set; }
    }
}
