using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.Datos
{
    [Table("FactorEmision")]
    public partial class FactorEmision
    {
        [Key]
        public int IdFactor { get; set; }
        public double Gasolina_Km { get; set; }
        public double Diesel_Km { get; set; }
        public double Gas_M3 { get; set; }
        public double Gasolina_Ltr { get; set; }
        public double Diesel_Ltr { get; set; }
        public double ResiduoSolido { get; set; }
        public double Energia { get; set; }
        public double EmisionAvion { get; set; }
    }
}
