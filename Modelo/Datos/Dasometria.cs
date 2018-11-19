using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.Datos
{

	[Table("Dasometria")]
	public partial class Dasometria
	{
		[Key]
		public int IdDasometria { get; set; }
		public int IdDetalleHuella { get; set; }
		public DateTime Fecha { get; set; }
		public double Altura { get; set; }
		public double Dap { get; set; }
		public double Perimetro { get; set; }
		public double Diametro { get; set; }
		[StringLength(500)]
		public string Observaciones { get; set; }
		public int Etapa { get; set; }
	}
	
}
