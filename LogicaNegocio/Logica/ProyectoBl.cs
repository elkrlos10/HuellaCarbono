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

        public Task<ProyectoDTO> CrearProyecto(ProyectoDTO oProyecto)
        {
            var empresa = (from e in entity.Empresa
                           where e.IdEmpresa == oProyecto.IdEmpresa
                           select e).FirstOrDefault();

            var proyecto = new Proyecto
            {
                IdEmpresa = oProyecto.IdEmpresa,
                FechaProyecto = oProyecto.FechaProyecto,
                Etapa = oProyecto.Etapa,
            };

            entity.Proyecto.Add(proyecto);
            entity.SaveChanges();
            oProyecto.NombreEmpresa = empresa.NombreEmpresa;
            oProyecto.IdProyecto = proyecto.IdProyecto;

            return Task.FromResult<ProyectoDTO>(oProyecto);
        }

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
            var huellaVehiculosGasolina = (vehiculos.Can_Gasolina * vehiculos.Km_Gasolina * factores.Gasolina_Km) * 52;

            //var vehiculosDiesel_Km = vehiculos.Can_Diesel *
            var huellaVehiculosDiesel = (vehiculos.Can_Diesel * vehiculos.Km_Diesel * factores.Diesel_Km) * 52;

            //var vehiculosGas_Km = vehiculos.Can_GasNatural * ;
            var huellaVehiculosGas = (vehiculos.Can_GasNatural * vehiculos.Km_GasNatural * factores.Gas_M3) * 52;

            //var maquinasGasolina = maquinas.Can_Gasolina * maquinas.Lts_Gasolina;
            var huellaMaquinasGasolina = (maquinas.Can_Gasolina * maquinas.Lts_Gasolina * factores.Gasolina_Ltr) * 52;

            //var maquinasDiesel = maquinas.Can_Diesel * maquinas.Lts_Diesel;
            var huellaMaquinasDiesel = (maquinas.Can_Diesel * maquinas.Lts_Diesel * factores.Diesel_Ltr) * 52;

            //var maquinasGas = maquinas.Can_GasNatural * maquinas.Lts_GasNatural;
            var huellamaquinasGas = (maquinas.Can_GasNatural * maquinas.Lts_GasNatural * factores.Gas_M3) * 52;

            var residuosSolidos = residuos.Can_ResiduosSolidos * 1000;
            var huellaresiduosSolidos = (residuosSolidos * factores.ResiduoSolido) * 12;

            var huellaEnergia = (energia.EnergiaKwh * factores.Energia) * 12;

            var huellaGas = (energia.Gas * factores.Gas_M3) * 12;

            var totalHuella = (huellaVehiculosGasolina + huellaVehiculosDiesel + huellaVehiculosGas + huellaMaquinasGasolina +
                              huellaMaquinasDiesel + huellamaquinasGas + huellaresiduosSolidos + huellaEnergia + huellaGas);
            var oparametros = new ParametrosDTO
            {
                Paramatro1 = Math.Round((totalHuella), 0).ToString()

            };

            return Task.FromResult<ParametrosDTO>(oparametros);
        }

        public Task<ParametrosDTO> CalculoHuellaTransporte(int IdProyecto)
        {
            var vehiculos = (from i in entity.Vehiculos
                             where i.IdProyecto == IdProyecto
                             select i).FirstOrDefault();

            var factores = (from i in entity.FactorEmision
                            select i).FirstOrDefault();


            //var vehiculosGasolina_Km = vehiculos.Can_Gasolina * ;
            var huellaVehiculosGasolina = (vehiculos.Can_Gasolina * vehiculos.Km_Gasolina * factores.Gasolina_Km) * 52;

            //var vehiculosDiesel_Km = vehiculos.Can_Diesel *
            var huellaVehiculosDiesel = (vehiculos.Can_Diesel * vehiculos.Km_Diesel * factores.Diesel_Km) * 52;

            //var vehiculosGas_Km = vehiculos.Can_GasNatural * ;
            var huellaVehiculosGas = (vehiculos.Can_GasNatural * vehiculos.Km_GasNatural * factores.Gas_M3) * 52;



            var totalHuella = (huellaVehiculosGasolina + huellaVehiculosDiesel + huellaVehiculosGas);
            var oparametros = new ParametrosDTO
            {
                Paramatro1 = Math.Round((totalHuella), 0).ToString()

            };

            return Task.FromResult<ParametrosDTO>(oparametros);
        }

        public Task<bool> Guardarcalculo(HuellaDTO oHuella)
        {
            var huella = new Huella
            {
                IdProyecto = oHuella.IdProyecto,
                Toneledas = oHuella.Toneledas,
                Fecha = oHuella.Fecha,
                Precisar = oHuella.Precisar,
                TipoArbol = oHuella.TipoArbol,
                Zona = oHuella.Zona,
                EstadoCompensacion = false,
                Area = oHuella.Area,
                Cant_arboles = oHuella.Cant_arboles
            };

            entity.Huella.Add(huella);
            entity.SaveChanges();

            var detalle = new DetalleHuella
            {
                IdHuella = huella.IdHuella,
                Porcentaje = oHuella.Porcentaje,
                //Estado = oHuella.Estado
            };

            entity.DetalleHuella.Add(detalle);
            entity.SaveChanges();

            return Task.FromResult<bool>(true);
        }

        public Task<List<HuellaDTO>> ListaProyectos(int IdEmpresa)
        {
            //var Proyectos = (from d in entity.DetalleHuella
            //                 join h in entity.Huella on d.IdHuella equals h.IdHuella
            //                 join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
            //                 where p.IdEmpresa == IdEmpresa
            //                 select new HuellaDTO
            //                 {
            //                     IdHuella = h.IdHuella,
            //                     IdProyecto = h.IdProyecto,
            //                     Fecha = h.Fecha,
            //                     TipoArbol = h.TipoArbol,
            //                     Zona = h.Zona,
            //                     Precisar = h.Precisar,
            //                     Toneledas = h.Toneledas,
            //                     Porcentaje = d.Porcentaje,
            //                     Estado = d.Estado,
            //                     Estado1= d.Estado == false ? "Pendiente" : "En ejecución",
            //                     EstadoCompensacion=h.EstadoCompensacion
            //                 }).ToList();

            var detalles = (from i in entity.DetalleHuella
                            join h in entity.Huella on i.IdHuella equals h.IdHuella
                            join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
                            where p.IdEmpresa == IdEmpresa
                            select i.IdHuella).Distinct();

            var Proyectos = new List<HuellaDTO>();
          
            foreach (var item in detalles)
            {
                double sumaPorcentaje = 0;
                var proyecto = (from d in entity.DetalleHuella
                                join h in entity.Huella on d.IdHuella equals h.IdHuella
                                where d.IdHuella == item
                                orderby d.IdHuella
                                select new HuellaDTO
                                {
                                    IdHuella = h.IdHuella,
                                    IdProyecto = h.IdProyecto,
                                    Fecha = h.Fecha,
                                    TipoArbol = h.TipoArbol,
                                    Zona = h.Zona,
                                    Precisar = h.Precisar,
                                    Toneledas = h.Toneledas,
                                    Porcentaje = d.Porcentaje,
                                    Estado = d.Estado,
                                    Estado1 = d.Estado == false ? "Pendiente" : "En ejecución",
                                    EstadoCompensacion = h.EstadoCompensacion
                                }).ToList();

                foreach (var item1 in proyecto.Select((value, i) => new { i, value }))
                {
                    var index = item1.i;
                    proyecto[index].NumCompensacion = index + 1;
                    sumaPorcentaje = item1.value.Porcentaje + sumaPorcentaje;

                }
                if (proyecto.Count>1)
                {
                    proyecto[0].sumaPorcentaje = sumaPorcentaje;
                    proyecto[1].sumaPorcentaje = sumaPorcentaje;
                }
                else
                {
                    proyecto[0].sumaPorcentaje = sumaPorcentaje;
                }
               
                Proyectos.AddRange(proyecto);
            }


            foreach (var item in Proyectos.Select((value, i) => new { i, value }))
            {
                var value = item.value;
                var index = item.i;

                if (index > 0)
                {
                    if (value.IdHuella == Proyectos[index - 1].IdHuella)
                    {
                        Proyectos[index].Index = Proyectos[index - 1].Index;

                    }
                    else
                    {
                        Proyectos[index].Index = index + 1;

                    }
                }
                else
                {
                    Proyectos[index].Index = index + 1;

                }
            }

            return Task.FromResult<List<HuellaDTO>>(Proyectos);

        }

        public Task<List<HuellaDTO>> CompletarCompensacion(HuellaDTO oHuella)
        {
            var huella = (from i in entity.DetalleHuella
                          join h in entity.Huella on i.IdHuella equals h.IdHuella
                          join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
                          where p.IdProyecto == oHuella.IdProyecto
                          select i).FirstOrDefault();


            var detalle = new DetalleHuella
            {
                IdHuella = huella.IdHuella,
                Porcentaje = 100 - huella.Porcentaje,
                Estado = oHuella.Estado
            };

            var proye = (from i in entity.Huella
                         where i.IdProyecto == oHuella.IdProyecto
                         select i).FirstOrDefault();

            var empresa = (from i in entity.Proyecto
                           where i.IdProyecto == oHuella.IdProyecto
                           select i.IdEmpresa).FirstOrDefault();

            proye.EstadoCompensacion = true;

            entity.DetalleHuella.Add(detalle);
            entity.SaveChanges();

            return ListaProyectos(empresa);
        }

        public async Task<ParametrosDTO> PrecisarCalculoHuella(int IdProyecto)
        {
            ParametrosDTO Huella = await CalculoHuella(IdProyecto);
            var total_huella = double.Parse(Huella.Paramatro1);

            var Encuestas = (from i in entity.Encuesta
                             where i.IdProyecto == IdProyecto
                             select i).ToList();

            var factores = (from i in entity.FactorEmision
                            select i).FirstOrDefault();

            foreach (var item in Encuestas)
            {
                if (item.TipoTransporte == "N/A")
                {
                    var HuellaExtra = (item.Km * factores.Gas_M3) * 52;
                    total_huella = total_huella + HuellaExtra;
                }
                if (item.TipoTransporte == "Automovil" || item.TipoTransporte == "Motocicleta")
                {

                    if (item.TipoCombustible == "Gasolina")
                    {
                        var HuellaExtra = (item.Km * factores.Gasolina_Km) * 52;
                        total_huella = total_huella + HuellaExtra;
                    }
                    if (item.TipoCombustible == "Gas")
                    {
                        var HuellaExtra = (item.Km * factores.Gas_M3) * 52;
                        total_huella = total_huella + HuellaExtra;
                    }
                    if (item.TipoCombustible == "Diesel")
                    {
                        var HuellaExtra = (item.Km * factores.Diesel_Km) * 52;
                        total_huella = total_huella + HuellaExtra;
                    }
                }
            }
            var oparametros = new ParametrosDTO
            {
                Paramatro1 = Math.Round((total_huella), 0).ToString()

            };

            return await Task.FromResult<ParametrosDTO>(oparametros);
        }

		//public Task<List<HuellaDTO>> ListaProyectos1(int IdEmpresa)
		//{
		//    var huellas = (from p in entity.Proyecto
		//                     join h in entity.Huella on p.IdProyecto equals h.IdProyecto
		//                     where p.IdEmpresa == IdEmpresa
		//                     select h).ToList();

		//    double sumaPorcentaje = 0;
		//    foreach (var item in huellas)
		//    {
		//        var proyecto = (from d in entity.DetalleHuella
		//                        join h in entity.Huella on d.IdHuella equals h.IdHuella
		//                        where d.IdHuella == item.IdHuella
		//                        orderby d.IdHuella
		//                        select new HuellaDTO
		//                        {
		//                            IdHuella = h.IdHuella,
		//                            IdProyecto = h.IdProyecto,
		//                            Fecha = h.Fecha,
		//                            TipoArbol = h.TipoArbol,
		//                            Zona = h.Zona,
		//                            Precisar = h.Precisar,
		//                            Toneledas = h.Toneledas,
		//                            Porcentaje = d.Porcentaje,
		//                            Estado = d.Estado,
		//                            Estado1 = d.Estado == false ? "Pendiente" : "En ejecución",
		//                            EstadoCompensacion = h.EstadoCompensacion
		//                        }).ToList();

		//        foreach (var item1 in proyecto)
		//        {
		//           sumaPorcentaje = item1.Porcentaje + sumaPorcentaje;
		//        }
		//    }


		//    return Task.FromResult<List<HuellaDTO>>(Proyectos);

		//}

		public List<HuellaDTO> ProyectosDashboard()
		{
			var proyectos = (from h in entity.Huella
							 join d in entity.DetalleHuella on h.IdHuella equals d.IdHuella
							 join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
							 join e in entity.Empresa on p.IdEmpresa equals e.IdEmpresa
							 select new HuellaDTO
							 {
								 IdHuella = h.IdHuella,
								 IdProyecto = h.IdProyecto,
								 Fecha = h.Fecha,
								 TipoArbol = h.TipoArbol,
								 Zona = h.Zona,
								 Precisar = h.Precisar,
								 Toneledas = h.Toneledas,
								 Porcentaje = d.Porcentaje,
								 Estado = d.Estado,
								 Estado1 = d.Estado == false ? "Pendiente" : "En ejecución",
								 EstadoCompensacion = h.EstadoCompensacion,
								 Area = h.Area,
								 Cant_arboles = h.Cant_arboles,
								 IdEmpresa = e.IdEmpresa
							 }).ToList();

			return proyectos;
		}

		public Empresa DatosEmpresa(int idEmpresa)
		{
			var empresa = (from e in entity.Empresa
						   where e.IdEmpresa == idEmpresa
						   select e).FirstOrDefault();
			return empresa;
		}

		public bool CambiarEstadoProyecto(int idProyecto, bool? estado)
		{
			var proyecto = (from h in entity.Huella
							join d in entity.DetalleHuella on h.IdHuella equals d.IdHuella
							where h.IdProyecto == idProyecto
							select d).FirstOrDefault();

			proyecto.Estado = estado;
			entity.SaveChanges();

			return true;
		}



	}
}
