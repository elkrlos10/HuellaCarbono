
namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Encuesta")]
    public partial class Encuesta
    {
        [Key]
        public int IdEncuesta { get; set; }

        public int IdProyecto { get; set; }

        public int TipoPersona { get; set; }

        public string TipoTransporte { get; set; }
     
        public string TipoCombustible { get; set; }

        public int Km { get; set; }

        public int Nun_Acopanantes { get; set; }

        public int VuelosNacionales { get; set; }

        public int VuelosInternacionales { get; set; }

        public int HorasVuelo { get; set; }

        public int CantidadCuadernos { get; set; }

        public int CantidadSobres { get; set; }

        public int CantidadResmas { get; set; }

        public bool Puntos_Eco { get; set; }

        public bool Residuos { get; set; }

        public bool Aviso { get; set; }

        public string Luz { get; set; }

        public string Aparatos { get; set; }

        public string Computador { get; set; }
       
    }
}
