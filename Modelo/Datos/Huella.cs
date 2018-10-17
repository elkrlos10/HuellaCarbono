

namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    [Table("Huella")]
    public partial class Huella
    {
        [Key]
        public int IdHuella { get; set; }
        public int IdProyecto { get; set; }
        public DateTime Fecha { get; set; }
        public string TipoArbol { get; set; }
        public string Zona { get; set; }
        public bool Precisar { get; set; }
        public double Toneledas { get; set; }
        public bool EstadoCompensacion { get; set; }
        public double Cant_arboles { get; set; }
        public double Area { get; set; }
    }
}
