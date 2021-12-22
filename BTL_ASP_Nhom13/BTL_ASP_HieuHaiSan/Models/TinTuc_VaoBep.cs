namespace BTL_ASP_HieuHaiSan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TinTuc_VaoBep
    {
        [Key]
        public int ID_TinTuc { get; set; }

        [Required]
        [StringLength(100)]
        public string TieuDe { get; set; }

        [Required]
        [StringLength(100)]
        public string HinhAnh { get; set; }

        public DateTime NgayTao { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string NoiDung { get; set; }

        public bool Status { get; set; }
    }
}
