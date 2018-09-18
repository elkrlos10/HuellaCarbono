
namespace HuellaCarbonoWeb.Controllers
{
    using LogicaNegocio.Logica;
    using Modelo.Datos;
    using Modelo.DTO;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using System.Web;
    using System.Web.Http;

    public class ProyectoController: ApiController
    {
        [HttpPost]
        public async Task<ParametrosDTO> CalculoHuella(ParametrosDTO oParametros)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.CalculoHuella(int.Parse(oParametros.Paramatro1));

                return response;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        [HttpPost]
        public async Task<bool> Guardarcalculo(HuellaDTO oHuella)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.Guardarcalculo(oHuella);

                return response;
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}