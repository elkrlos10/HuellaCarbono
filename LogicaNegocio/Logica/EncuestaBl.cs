namespace LogicaNegocio.Logica
{
    using Modelo.Datos;
    using Modelo.DTO;
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
            var vehiculo = (from i in entity.Vehiculos
                           where i.IdProyecto == oVehiculos.IdProyecto
                           select i).FirstOrDefault();

            if (vehiculo == null)
            {
                entity.Vehiculos.Add(oVehiculos);
                entity.SaveChanges();
            }
            else
            {
                entity.Vehiculos.Remove(vehiculo);
                entity.Vehiculos.Add(oVehiculos);
                entity.SaveChanges();
            }

            return Task.FromResult<bool>(true);
        }

        public Task<bool> RegristarMaquinas(Maquinas oMaquinas)
        {
            var maquina = (from i in entity.Maquinas
                           where i.IdProyecto == oMaquinas.IdProyecto
                           select i).FirstOrDefault();

            if (maquina == null)
            {
                entity.Maquinas.Add(oMaquinas);
                entity.SaveChanges();
            }
            else
            {
                entity.Maquinas.Remove(maquina);
                entity.Maquinas.Add(oMaquinas);
                entity.SaveChanges();
            }

            return Task.FromResult<bool>(true);
        }

        public Task<bool> RegristarResiduos(Residuos oResiduos)
        {
            var residuo = (from i in entity.Residuos
                           where i.IdProyecto == oResiduos.IdProyecto
                           select i).FirstOrDefault();

            if (residuo == null)
            {
                entity.Residuos.Add(oResiduos);
                entity.SaveChanges();
            }
            else
            {
                entity.Residuos.Remove(residuo);
                entity.Residuos.Add(oResiduos);
                entity.SaveChanges();
            }

            return Task.FromResult<bool>(true);
        }

        public Task<bool> RegristarEnergia(Energia oEnergia)
        {
            var energia = (from i in entity.Energia
                           where i.IdProyecto == oEnergia.IdProyecto
                           select i).FirstOrDefault();

            if (energia == null)
            {
                entity.Energia.Add(oEnergia);
                entity.SaveChanges();
            }
            else
            {
                entity.Energia.Remove(energia);
                entity.Energia.Add(oEnergia);
                entity.SaveChanges();
            }

            return Task.FromResult<bool>(true);
        }

        public Task<bool>RegistarEncuesta(Encuesta oEncuesta)
        {
            //var FactorEmision = (from i in entity.FactorEmision
            //                     select i).FirstOrDefault();

            //if (oEncuesta.TipoTransporte == "Automovil" || oEncuesta.TipoTransporte == "Motocicleta")
            //{
            //    if (oEncuesta.TipoCombustible == "Gas")
            //    {
            //        oEncuesta.FactorAuto = (oEncuesta.DistanciaAutoMoto * FactorEmision.Gas_M3 * 260);
            //    }
            //    else if (oEncuesta.TipoCombustible == "Gasolina")
            //    {
            //        oEncuesta.FactorAuto = (oEncuesta.DistanciaAutoMoto * FactorEmision.Gasolina_Km * 260);
            //    }
            //    else if (oEncuesta.TipoCombustible == "Diesel")
            //    {
            //        oEncuesta.FactorAuto = (oEncuesta.DistanciaAutoMoto * FactorEmision.Diesel_Km * 260);
            //    }
            //}
            //else if (oEncuesta.TipoTransporte == "N/A")
            //{
            //    oEncuesta.FactorAuto = (oEncuesta.DistanciaPublico * FactorEmision.Gas_M3 * 260);
            //}

            //oEncuesta.FactorBicicleta = (oEncuesta.KilometrosBicicleta * 0);
            //oEncuesta.FactorAvion = (())
            var FechaProyecto = (from i in entity.Proyecto
                          where i.IdProyecto == oEncuesta.IdProyecto
                          select i).FirstOrDefault();
            var fecha = FechaProyecto.FechaProyecto.AddDays(15);
            if (fecha < DateTime.Now)
            {
                return Task.FromResult<bool>(false);
            }

            entity.Encuesta.Add(oEncuesta);
            entity.SaveChanges();
            return Task.FromResult<bool>(true);
        }
    }
}
