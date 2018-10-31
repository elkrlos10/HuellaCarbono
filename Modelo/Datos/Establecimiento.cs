using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.Datos
{
	[Table("Establecimiento")]
	public partial class Establecimiento
	{
		[Key]
		public int IdEstablecimiento { get; set; }
		public int IdProyeto { get; set; }
		public bool? Preparacion { get; set; }
		public bool? Roceria { get; set; }
		public bool? Trazado { get; set; }
		public bool? Plateo { get; set; }
		public bool? Transporte { get; set; }
		public bool? Plantacion { get; set; }
		public bool? Fertilizacion { get; set; }
		public bool? Replantes { get; set; }
		public bool? Cercos { get; set; }

	}
}
