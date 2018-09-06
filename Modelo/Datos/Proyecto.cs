namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Proyecto")]
    public partial class Proyecto
    {
        [Key]
        public int IdProyecto { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaProyecto { get; set; }

        public int IdEmpresa { get; set; }

        public int Etapa { get; set; }

    }
}
