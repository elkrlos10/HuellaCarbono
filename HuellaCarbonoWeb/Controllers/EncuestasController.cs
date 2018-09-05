namespace HuellaCarbonoWeb.Controllers
{
    using LogicaNegocio.Logica;
    using Modelo.Datos;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using System.Web;
    using System.Web.Http;

    public class EncuestasController: ApiController
    {
        [HttpPost]
        public async Task<bool> RegristarVehiculos(Vehiculos oVehiculos)
        {
            try
            {
                EncuestaBl oEncuestaBl = new EncuestaBl();
                var response = await oEncuestaBl.RegristarVehiculos(oVehiculos);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpPost]
        public async Task<bool> RegristarMaquinas(Maquinas oMaquinas)
        {
            try
            {
                EncuestaBl oEncuestaBl = new EncuestaBl();
                var response = await oEncuestaBl.RegristarMaquinas(oMaquinas);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpPost]
        public async Task<bool> RegristarResiduos(Residuos oResiduos)
        {
            try
            {
                EncuestaBl oEncuestaBl = new EncuestaBl();
                var response = await oEncuestaBl.RegristarResiduos(oResiduos);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpPost]
        public async Task<bool> RegristarEnergia(Energia oEnergia)
        {
            try
            {
                EncuestaBl oEncuestaBl = new EncuestaBl();
                var response = await oEncuestaBl.RegristarEnergia(oEnergia);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}