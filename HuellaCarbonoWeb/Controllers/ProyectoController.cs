
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
        public async Task<ProyectoDTO> CrearProyecto(ProyectoDTO oProyecto)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.CrearProyecto(oProyecto);

                return response;
            }
            catch (Exception e)
            {
                return null;
            }
        }

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
        public async Task<ParametrosDTO> CalculoHuellaTransporte(ParametrosDTO oParametros)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.CalculoHuellaTransporte(int.Parse(oParametros.Paramatro1));

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

        [HttpGet]
        public async Task<List<HuellaDTO>> ConsultarProyectos(int id)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.ListaProyectos(id);

                return response;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        [HttpPost]
        public async Task<List<HuellaDTO>> CompletarCompensacion(HuellaDTO oHuella)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.CompletarCompensacion(oHuella);

                return response;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        [HttpPost]
        public async Task<ParametrosDTO> PrecisarCalculoHuella(ParametrosDTO oParametros)
        {
            try
            {
                ProyectoBl oProyectoBl = new ProyectoBl();
                var response = await oProyectoBl.PrecisarCalculoHuella(int.Parse(oParametros.Paramatro1));

                return response;
            }
            catch (Exception e)
            {
                throw;
            }
        }

      
    }
}