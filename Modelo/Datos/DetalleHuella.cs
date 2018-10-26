namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    [Table("DetalleHuella")]
    public partial class DetalleHuella
    {
        [Key]
        public int IdDetalle { get; set; }

        public int IdHuella { get; set; }

        public double Porcentaje { get; set; }

        public bool ? Estado { get; set; }
    }
}
