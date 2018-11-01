using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.Datos
{
    [Table("Mantenimiento3")]
    public partial class Mantenimiento3
    {
        [Key]
        public int IdMantenimiento3 { get; set; }
        public int IdProyecto { get; set; }
        public bool? Planteos { get; set; }
        public bool? Fertilizacion { get; set; }
        public bool? Plagas { get; set; }
        public bool? Caminos { get; set; }
        public bool? Cercos { get; set; }
        public bool? Incendios { get; set; }
        public bool? Raleo { get; set; }
        public int Etapa { get; set; }

    }
}
