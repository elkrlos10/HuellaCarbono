using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.DTO
{
    public class HuellaDTO
    {
        public int Index { get; set; }
        public int IdHuella { get; set; }
        public int IdProyecto { get; set; }
		public int IdEmpresa { get; set; }
		public DateTime Fecha { get; set; }
        public string TipoArbol { get; set; }
        public string Zona { get; set; }
        public bool Precisar { get; set; }
        public double Toneledas { get; set; }
        public double Porcentaje { get; set; }
        public bool Estado { get; set; }
        public string Estado1 { get; set; }
        public int NumCompensacion { get; set; }
        public bool EstadoCompensacion { get; set; }
		public double ? Cant_arboles { get; set; }
		public double ? Area { get; set; }
		public double sumaPorcentaje { get; set; }
    }
}
