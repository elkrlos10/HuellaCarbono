
namespace HuellaCarbonoWeb.Controllers
{
    using LogicaNegocio.Logica;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using System.Web;
    using System.Web.Http;

    public class ProyectoController: ApiController
    {
        [HttpPost]
        public async Task<double> RegristarVehiculos(int IdProyecto)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.CalculoHuella(IdProyecto);

                return response;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}