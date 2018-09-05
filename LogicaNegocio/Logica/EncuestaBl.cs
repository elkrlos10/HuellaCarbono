namespace LogicaNegocio.Logica
{
    using Modelo.Datos;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    public class EncuestaBl
    {
        Model1 entity = new Model1();

        public Task<bool> RegristarVehiculos(Vehiculos oVehiculos)
        {
            entity.Vehiculos.Add(oVehiculos);
            entity.SaveChanges();

            return Task.FromResult<bool>(true);
        }

        public Task<bool> RegristarMaquinas(Maquinas oMaquinas)
        {
            entity.Maquinas.Add(oMaquinas);
            entity.SaveChanges();

            return Task.FromResult<bool>(true);
        }

        public Task<bool> RegristarResiduos(Residuos oResiduos)
        {
            entity.Residuos.Add(oResiduos);
            entity.SaveChanges();

            return Task.FromResult<bool>(true);
        }

        public Task<bool> RegristarEnergia(Energia oEnergia)
        {
            entity.Energia.Add(oEnergia);
            entity.SaveChanges();

            return Task.FromResult<bool>(true);
        }
    }
}
