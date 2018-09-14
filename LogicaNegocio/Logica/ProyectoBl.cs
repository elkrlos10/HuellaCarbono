namespace LogicaNegocio.Logica
{
    using Modelo.Datos;
    using Modelo.DTO;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class ProyectoBl
    {
        Model1 entity = new Model1();

        public Task<ParametrosDTO> CalculoHuella(int IdProyecto)
        {
            var vehiculos = (from i in entity.Vehiculos
                            where i.IdProyecto == IdProyecto
                            select i).FirstOrDefault();

            var maquinas = (from i in entity.Maquinas
                            where i.IdProyecto == IdProyecto
                            select i).FirstOrDefault();

            var residuos = (from i in entity.Residuos
                            where i.IdProyecto == IdProyecto
                            select i).FirstOrDefault();

            var energia = (from i in entity.Energia
                            where i.IdProyecto == IdProyecto
                            select i).FirstOrDefault();

            var factores = (from i in entity.FactorEmision
                           select i).FirstOrDefault();


            //var vehiculosGasolina_Km = vehiculos.Can_Gasolina * ;
            var huellaVehiculosGasolina = vehiculos.Km_Gasolina * factores.Gasolina_Km; 

            //var vehiculosDiesel_Km = vehiculos.Can_Diesel *
            var huellaVehiculosDiesel = vehiculos.Km_Diesel * factores.Diesel_Km;

            //var vehiculosGas_Km = vehiculos.Can_GasNatural * ;
            var huellaVehiculosGas = vehiculos.Km_GasNatural * factores.Gas_M3;

            //var maquinasGasolina = maquinas.Can_Gasolina * maquinas.Lts_Gasolina;
            var huellaMaquinasGasolina = maquinas.Lts_Gasolina * 7.62;

            //var maquinasDiesel = maquinas.Can_Diesel * maquinas.Lts_Diesel;
            var huellaMaquinasDiesel = maquinas.Lts_Diesel * 10.28;

            //var maquinasGas = maquinas.Can_GasNatural * maquinas.Lts_GasNatural;
            var huellamaquinasGas = maquinas.Lts_GasNatural * 1.98;

            var residuosSolidos = residuos.Can_ResiduosSolidos * 1000;
            var huellaresiduosSolidos = residuosSolidos * factores.ResiduoSolido;
          
            var huellaEnergia = energia.EnergiaKwh * factores.Energia;
            
            var huellaGas = energia.Gas * factores.Gas_M3;

            var totalHuella = (huellaVehiculosGasolina + huellaVehiculosDiesel + huellaVehiculosGas + huellaMaquinasGasolina +
                              huellaMaquinasDiesel + huellamaquinasGas + huellaresiduosSolidos + huellaEnergia + huellaGas)/1000;
            var oparametros = new ParametrosDTO
            {
                Paramatro1= totalHuella.ToString(),
            }; 

            return Task.FromResult<ParametrosDTO>(oparametros);
        }
    }
}
