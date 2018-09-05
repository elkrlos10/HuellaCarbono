namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Empresa")]
    public partial class Empresa
    {
        [Key]
        public int IdEmpresa { get; set; }

        [Required]
        [StringLength(150)]
        public string NombreEmpresa { get; set; }

        [Required]
        [StringLength(20)]
        public string Nit { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(50)]
        public string Direccion { get; set; }

        public int TipoEmpresa { get; set; }

        public int IdUsuario { get; set; }
    }
}
