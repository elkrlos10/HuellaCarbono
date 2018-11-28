namespace LogicaNegocio.Logica
{
	using Modelo.Datos;
	using Modelo.DTO;
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Reflection;
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
            oProyecto.TipoEmpresa = empresa.TipoEmpresa;

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
				Cant_arboles = oHuella.Cant_arboles,
				DensidadArbolHectarea = oHuella.DensidadArbolHectarea
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

			var detalles = (from i in entity.DetalleHuella
							join h in entity.Huella on i.IdHuella equals h.IdHuella
							join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
							where p.IdEmpresa == IdEmpresa && i.Estado != false
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
									Estado1 = d.Estado == null ? "Pendiente" : "En ejecución",
									EstadoCompensacion = h.EstadoCompensacion
								}).ToList();

				foreach (var item1 in proyecto.Select((value, i) => new { i, value }))
				{
					var index = item1.i;
					proyecto[index].NumCompensacion = index + 1;
					sumaPorcentaje = item1.value.Porcentaje + sumaPorcentaje;
					if (item1.value.Estado == false)
					{
						proyecto[index].Estado1 = "Cancelado";
					}
					if (item1.value.Estado == true)
					{
						proyecto[index].Estado1 = "En ejecución";
					}
					if (item1.value.Estado == null)
					{
						proyecto[index].Estado1 = "Pendiente";
					}
				}
				if (proyecto.Count > 1)
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
				//Estado = false
			};

			var proye = (from i in entity.Huella
						 where i.IdProyecto == oHuella.IdProyecto
						 select i).FirstOrDefault();

			var empresa = (from i in entity.Proyecto
						   where i.IdProyecto == oHuella.IdProyecto
						   select i.IdEmpresa).FirstOrDefault();

			proye.EstadoCompensacion = false;

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

		public Tuple<List<HuellaDTO>, int, int> ProyectosDashboard()
		{
			var proyectos = (from h in entity.Huella
							 join d in entity.DetalleHuella on h.IdHuella equals d.IdHuella
							 join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
							 join e in entity.Empresa on p.IdEmpresa equals e.IdEmpresa
							 orderby p.IdProyecto
							 where d.Estado == null
							 select new HuellaDTO
							 {
								 IdHuella = h.IdHuella,
								 IdProyecto = h.IdProyecto,
								 IdDetalle= d.IdDetalle,
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
								 IdEmpresa = e.IdEmpresa,
								 DensidadArbolHectarea = h.DensidadArbolHectarea
							 }).ToList();

			var totalProyecto = (from i in entity.DetalleHuella
								 select i).ToList();

			var Cancelados = totalProyecto.Where(x => x.Estado == false).Count();
			var EnProceso = totalProyecto.Where(x => x.Estado == true).Count();

			var PorcentajeList = proyectos.Where(x => x.Estado1 == "En ejecución").ToList();

			foreach (var item1 in proyectos.Select((value, i) => new { i, value }))
			{
				var index = item1.i;
				proyectos[index].PorcentajeDashboard = Porcentaje(item1.value.IdProyecto);
				var pruebaPor =  Porcentaje(item1.value.IdProyecto);

			}

			return new Tuple<List<HuellaDTO>, int, int>(proyectos, Cancelados, EnProceso);
		}

		public Empresa DatosEmpresa(int idEmpresa)
		{
			var empresa = (from e in entity.Empresa
						   where e.IdEmpresa == idEmpresa
						   select e).FirstOrDefault();
			return empresa;
		}

		public bool CambiarEstadoProyecto(int IdDetalle, bool? estado)
		{
			var proyecto = (from h in entity.Huella
							join d in entity.DetalleHuella on h.IdHuella equals d.IdHuella
							where d.IdDetalle == IdDetalle
							select d).FirstOrDefault();

			proyecto.Estado = estado;
			entity.SaveChanges();

			return true;
		}

		public List<HuellaDTO> FiltroProyectos(bool? estado)
		{
			var proyectos = (from h in entity.Huella
							 join d in entity.DetalleHuella on h.IdHuella equals d.IdHuella
							 join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
							 join e in entity.Empresa on p.IdEmpresa equals e.IdEmpresa
							 orderby p.IdProyecto
							 where d.Estado == estado
							 select new HuellaDTO
							 {
								 IdHuella = h.IdHuella,
								 IdProyecto = h.IdProyecto,
								 IdDetalle=d.IdDetalle,
								 Fecha = h.Fecha,
								 TipoArbol = h.TipoArbol,
								 Zona = h.Zona,
								 Precisar = h.Precisar,
								 Toneledas = h.Toneledas,
								 Porcentaje = d.Porcentaje,
								 Estado = d.Estado,
								 Area = h.Area,
								 Cant_arboles = h.Cant_arboles,
								 IdEmpresa = e.IdEmpresa,
								 DensidadArbolHectarea = h.DensidadArbolHectarea
							 }).ToList();

			foreach (var item1 in proyectos.Select((value, i) => new { i, value }))
			{
				var index = item1.i;
				proyectos[index].PorcentajeDashboard = Porcentaje(item1.value.IdDetalle);

			}

			return proyectos;

		}

		public Establecimiento GuardarEstablecimiento(Establecimiento oEstablecimiento)
		{

			var idEstablecimiento = (from e in entity.Establecimiento
									 where e.IdDetalleHuella == oEstablecimiento.IdDetalleHuella
									 select e).FirstOrDefault();
			if (idEstablecimiento != null)
			{
				entity.Establecimiento.Remove(idEstablecimiento);
				entity.SaveChanges();
			}


			entity.Establecimiento.Add(oEstablecimiento);
			entity.SaveChanges();

			return oEstablecimiento;

		}

		public Establecimiento ConsultarEstablecimiento(int IdDetalleHuella)
		{
			var idEstablecimiento = (from e in entity.Establecimiento
									 where e.IdDetalleHuella == IdDetalleHuella
									 select e).FirstOrDefault();


			return idEstablecimiento;

		}

		public Mantenimiento2 GuardarMantenimiento2(Mantenimiento2 oMantenimiento2)
		{

			var IdMantenimiento2 = (from m in entity.Mantenimiento2
									where m.IdDetalleHuella == oMantenimiento2.IdDetalleHuella
									&& m.Etapa == oMantenimiento2.Etapa
									select m).FirstOrDefault();
			if (IdMantenimiento2 != null)
			{
				entity.Mantenimiento2.Remove(IdMantenimiento2);
				entity.SaveChanges();
			}

			entity.Mantenimiento2.Add(oMantenimiento2);
			entity.SaveChanges();
			return oMantenimiento2;
		}

		public Mantenimiento2 ConsultarMantenimiento2(int IdDetalleHuella, int Etapa)
		{
			var IdMantenimiento2 = (from m in entity.Mantenimiento2
									where m.IdDetalleHuella == IdDetalleHuella
									&& m.Etapa == Etapa
									select m).FirstOrDefault();
			return IdMantenimiento2;

		}

		public Mantenimiento3 GuardarMantenimiento3(Mantenimiento3 oMantenimiento3)
		{

			var IdMantenimiento3 = (from m in entity.Mantenimiento3
									where m.IdDetalleHuella == oMantenimiento3.IdDetalleHuella
									&& m.Etapa == oMantenimiento3.Etapa
									select m).FirstOrDefault();
			if (IdMantenimiento3 != null)
			{
				entity.Mantenimiento3.Remove(IdMantenimiento3);
				entity.SaveChanges();
			}

			entity.Mantenimiento3.Add(oMantenimiento3);
			entity.SaveChanges();
			return oMantenimiento3;
		}

		public Mantenimiento3 ConsultarMantenimiento3(int IdDetalleHuella, int Etapa)
		{
			var IdMantenimiento3 = (from m in entity.Mantenimiento3
									where m.IdDetalleHuella == IdDetalleHuella
									&& m.Etapa == Etapa
									select m).FirstOrDefault();
			return IdMantenimiento3;

		}

		public List<Dasometria> GuardarDasometria(Dasometria oDasometria)
		{
		
			oDasometria.Fecha = DateTime.Now;
			entity.Dasometria.Add(oDasometria);
			entity.SaveChanges();

			var IdDetalleHuella = oDasometria.IdDetalleHuella;
			var Etapa = oDasometria.Etapa;
			var dasometria = (from d in entity.Dasometria
							  where d.IdDetalleHuella == IdDetalleHuella
							  && d.Etapa == Etapa
							  orderby d.Fecha
							  select d).ToList();

			return dasometria;
		}

		public List<Dasometria> ConsultarDasometria(int IdDetalleHuella, int Etapa)
		{
			var dasometria = (from d in entity.Dasometria
							  where d.IdDetalleHuella == IdDetalleHuella
							  && d.Etapa == Etapa
							  select d).ToList();

			return dasometria;
		}

		public double Porcentaje(int IdDetalleHuella)
		{
			double totalPorcentaje = 0;
			var Establecimiento = (from e in entity.Establecimiento
								   where e.IdDetalleHuella == IdDetalleHuella
								   select e).FirstOrDefault();

			if (Establecimiento != null)
			{
				foreach (PropertyInfo propiedad in Establecimiento.GetType().GetProperties())
				{
					if (propiedad.Name != "IdEstablecimiento")
					{
						if (propiedad.Name != "IdDetalleHuella")
						{
							if (propiedad.GetValue(Establecimiento) != null)
							{
								var valorPropiedad = bool.Parse(propiedad.GetValue(Establecimiento).ToString());
								if (valorPropiedad == true)
								{
									totalPorcentaje += 2.2222;
								}
							}
						}
					}

				}
			}

			var Mantenimiento2 = (from e in entity.Mantenimiento2
								  where e.IdDetalleHuella == IdDetalleHuella
								  && e.Etapa == 2
								  select e).FirstOrDefault();

			if (Mantenimiento2 != null)
			{
				foreach (PropertyInfo propiedad in Mantenimiento2.GetType().GetProperties())
				{
					if (propiedad.Name != "IdMantenimiento2")
					{
						if (propiedad.Name != "IdDetalleHuella")
						{
							if (propiedad.Name != "Etapa")
							{
								if (propiedad.GetValue(Mantenimiento2) != null)
								{
									var valorPropiedad = bool.Parse(propiedad.GetValue(Mantenimiento2).ToString());
									if (valorPropiedad == true)
									{
										totalPorcentaje += 2.2222;
									}
								}
							}
						}
					}
				}
			}
			var Mantenimiento3 = (from e in entity.Mantenimiento2
								  where e.IdDetalleHuella == IdDetalleHuella
								  && e.Etapa == 3
								  select e).FirstOrDefault();

			if (Mantenimiento3 != null)
			{
				foreach (PropertyInfo propiedad in Mantenimiento3.GetType().GetProperties())
				{
					if (propiedad.Name != "IdMantenimiento2")
					{
						if (propiedad.Name != "IdDetalleHuella")
						{
							if (propiedad.Name != "Etapa")
							{
								if (propiedad.GetValue(Mantenimiento3) != null)
								{
									var valorPropiedad = bool.Parse(propiedad.GetValue(Mantenimiento3).ToString());
									if (valorPropiedad == true)
									{
										totalPorcentaje += 2.2222;
									}
								}
							}
						}
					}
				}
			}
			var Mantenimiento4 = (from e in entity.Mantenimiento3
								  where e.IdDetalleHuella == IdDetalleHuella
								  && e.Etapa == 4
								  select e).FirstOrDefault();

			if (Mantenimiento4 != null)
			{
				foreach (PropertyInfo propiedad in Mantenimiento4.GetType().GetProperties())
				{
					if (propiedad.Name != "IdMantenimiento3")
					{
						if (propiedad.Name != "IdDetalleHuella")
						{
							if (propiedad.Name != "Etapa")
							{
								if (propiedad.GetValue(Mantenimiento4) != null)
								{
									var valorPropiedad = bool.Parse(propiedad.GetValue(Mantenimiento4).ToString());
									if (valorPropiedad == true)
									{
										totalPorcentaje += 2.85714;
									}
								}
							}
						}
					}
				}
			}
			var Mantenimiento5 = (from e in entity.Mantenimiento3
								  where e.IdDetalleHuella == IdDetalleHuella
								  && e.Etapa == 5
								  select e).FirstOrDefault();

			if (Mantenimiento5 != null)
			{
				foreach (PropertyInfo propiedad in Mantenimiento5.GetType().GetProperties())
				{
					if (propiedad.Name != "IdMantenimiento3")
					{
						if (propiedad.Name != "IdDetalleHuella")
						{
							if (propiedad.Name != "Etapa")
							{
								if (propiedad.GetValue(Mantenimiento5) != null)
								{
									var valorPropiedad = bool.Parse(propiedad.GetValue(Mantenimiento5).ToString());
									if (valorPropiedad == true)
									{
										totalPorcentaje += 2.85714;
									}
								}
							}
						}
					}
				}
			}

			return Math.Round((totalPorcentaje), 2);

		}

		public string ConsultarEmpresa(int IdDetalleHuella)
		{
			var empresa = (from d in entity.DetalleHuella
						   join h in entity.Huella on d.IdHuella equals h.IdHuella
						   join p in entity.Proyecto on h.IdProyecto equals p.IdProyecto
						   join e in entity.Empresa on p.IdEmpresa equals e.IdEmpresa
						   where d.IdDetalle == IdDetalleHuella
						   select e.NombreEmpresa).FirstOrDefault();

			return empresa;
		}

	}
}
