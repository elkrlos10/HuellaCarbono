namespace LogicaNegocio.Logica
{
    using Modelo.Datos;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class ProyectoBl
    {
        Model1 entity = new Model1();

        public Task<double> CalculoHuella(int IdProyecto)
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

            var vehiculosGasolina_Km = vehiculos.Can_Gasolina * vehiculos.Km_Gasolina;
            var huellaVehiculosGasolina = vehiculosGasolina_Km * 7.62;

            var vehiculosDiesel_Km = vehiculos.Can_Diesel * vehiculos.Km_Diesel;
            var huellaVehiculosDiesel = vehiculosDiesel_Km * 10.28;

            var vehiculosGas_Km = vehiculos.Can_GasNatural * vehiculos.Km_GasNatural;
            var huellaVehiculosGas = vehiculosGas_Km * 1.98;

            var maquinasGasolina = maquinas.Can_Gasolina* maquinas.Lts_Gasolina;
            var huellaMaquinasGasolina = maquinasGasolina * 7.62;

            var maquinasDiesel = maquinas.Can_Diesel * maquinas.Lts_Diesel;
            var huellaMaquinasDiesel = maquinasDiesel * 10.28;

            var maquinasGas = maquinas.Can_GasNatural * maquinas.Lts_GasNatural;
            var huellamaquinasGas = maquinasGas * 1.98;

            var residuosSolidos = residuos.Can_ResiduosSolidos * 1000;
            var huellaresiduosSolidos = residuosSolidos * 2.84;
          
            var huellaEnergia = energia.EnergiaKwh * 0.2;
            
            var huellaGas = energia.Gas * 1.98;

            var totalHuella = (huellaVehiculosGasolina + huellaVehiculosDiesel + huellaVehiculosGas + huellaMaquinasGasolina +
                              huellaMaquinasDiesel + huellamaquinasGas + huellaresiduosSolidos + huellaEnergia + huellaGas)/1000;


            return Task.FromResult<double>(totalHuella);
        }
    }
}
