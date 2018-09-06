namespace Modelo.Datos
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Empresa> Empresa { get; set; }
        public virtual DbSet<Energia> Energia { get; set; }
        public virtual DbSet<Maquinas> Maquinas { get; set; }
        public virtual DbSet<Proyecto> Proyecto { get; set; }
        public virtual DbSet<Residuos> Residuos { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Vehiculos> Vehiculos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Empresa>()
            //    .Property(e => e.NombreEmpresa)
            //    .IsUnicode(false);

            //modelBuilder.Entity<Empresa>()
            //    .Property(e => e.Nit)
            //    .IsUnicode(false);

            //modelBuilder.Entity<Empresa>()
            //    .Property(e => e.Email)
            //    .IsUnicode(false);

            //modelBuilder.Entity<Empresa>()
            //    .Property(e => e.Direccion)
            //    .IsUnicode(false);

            //modelBuilder.Entity<Usuario>()
            //    .Property(e => e.NombreUsuario)
            //    .IsUnicode(false);

            //modelBuilder.Entity<Usuario>()
            //    .Property(e => e.Password)
            //    .IsUnicode(false);
        }
    }
}
