namespace Modelo.Datos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Residuos
    {
        [Key]
        public int IdResiduo { get; set; }

        public int IdProyecto { get; set; }

        public bool SeparacionResiduos { get; set; }

        public bool ProgramaReciclaje { get; set; }

        public bool Compostaje { get; set; }

        public double Can_ResiduosSolidos { get; set; }

        public double Can_RediduosRecicla { get; set; }
    }
}
