namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Vehiculos
    {
        [Key]
        public int IdVehiculos { get; set; }

        public int IdProyecto { get; set; }

        public int Can_Gasolina { get; set; }

        public double Km_Gasolina { get; set; }

        public int Can_Diesel { get; set; }

        public double Km_Diesel { get; set; }

        public int Can_GasNatural { get; set; }

        public double Km_GasNatural { get; set; }
    }
}
