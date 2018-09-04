namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Energia")]
    public partial class Energia
    {
        [Key]
        public int IdEnergia { get; set; }

        public int IdProyecto { get; set; }

        public double EnergiaKwh { get; set; }

        public double Gas { get; set; }

        public bool EnergiaRenovable { get; set; }
    }
}
