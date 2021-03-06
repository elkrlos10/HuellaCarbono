namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Maquinas
    {
        [Key]
        public int IdMaquina { get; set; }

        public int IdProyecto { get; set; }

        public int Can_Gasolina { get; set; }

        public double Lts_Gasolina { get; set; }

        public int Can_Diesel { get; set; }

        public double Lts_Diesel { get; set; }

        public int Can_GasNatural { get; set; }

        public double Lts_GasNatural { get; set; }
    }
}
