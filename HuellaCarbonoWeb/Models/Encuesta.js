//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
	var encuesta = function ($scope) {

		window.onload = function () {
			var posX = $(".index").position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		}

		$scope.TipoPersona = 0;
		$("#botonPasar").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")

			$scope.TipoPreguntasPapel();
		})

		//Transporte
		$("#ant1").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		$("#sig1").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		//Vuelos
		$("#ant2").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		$("#sig2").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		//Papel
		$("#ant3").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		$("#sig3").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		////Conciencia1

		$("#ant4").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		$("#sig4").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		//conciencia 2
		$("#ant5").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		$("#botonTerminar").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
		})

		//Vuelve inicio
		$(".enlaceLogo").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")

			location.reload();
		})

		//Mover Barra
		var vm = this;

		//Bicicleta
		$scope.bici = {
			value: 0,
			options: {
				floor: 0,
				ceil: 200,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Publico
		$scope.publico = {
			value: 0,
			options: {
				floor: 0,
				ceil: 200,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//particular
		$scope.particular = {
			value: 0,
			options: {
				floor: 0,
				ceil: 200,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Vuelos Nacionales
		$scope.vuelosNacionales = {
			value: 0,
			options: {
				floor: 0,
				ceil: 100,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Vuelos Internacionales
		$scope.vuelosInternacionales = {
			value: 0,
			options: {
				floor: 0,
				ceil: 100,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Horas Promedio
		$scope.horasVuelos = {
			value: 0,
			options: {
				floor: 0,
				ceil: 100,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Resmas
		$scope.resmas = {
			value: 0,
			options: {
				floor: 0,
				ceil: 100,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Sobres
		$scope.sobres = {
			value: 0,
			options: {
				floor: 0,
				ceil: 100,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Cuadernos
		$scope.cuadernos = {
			value: 0,
			options: {
				floor: 0,
				ceil: 100,
				showSelectionBar: true,
				selectionBarGradient: {
					from: '#FFAA3B',
					to: '#FF5A19'
				}
			}
		}

		//Switch
		$scope.puntos = {
			cb1: false,
		};

		$scope.residuos = {
			cb1: false,
		};

		$scope.aviso = {
			cb1: false,
		};

		//Checkbox Seleccionar Rol
		$scope.TipoPreguntasPapel = function () {

			if ($scope.TipoPersona == 2) {
				var ocultar = document.getElementById("ocultar");
				var pregunta = document.getElementsByClassName("preguntaPapel")[0];
				var barra = document.getElementsByClassName("barraPapel")[0];
				ocultar.style.display = "none";
				pregunta.style.marginTop = "300px";
				barra.style.top = "46%";
			}

			else {
				var ocultar = document.getElementById("ocultar");
				var pregunta = document.getElementsByClassName("preguntaPapel")[0];
				var barra = document.getElementsByClassName("barraPapel")[0];
				ocultar.style.display = "block";
				pregunta.style.marginTop = "0px";
				barra.style.top = "25%";
			}
		}

		//Checkbox Seleccionar Automovil
		var particular = document.getElementById("particular");
		var publico = document.getElementById("publico");
		var cicla = document.getElementById("cicla");

		cicla.style.display = "none";
		particular.style.display = "none";
		publico.style.display = "none";

		$scope.CambiarTransporte = function () {
			
			if ($scope.TipoTransporte == "Bicicleta") {

				particular.style.display = "none";
				publico.style.display = "none";
				cicla.style.display = "block";
				$scope.publico = { value: 0 };
				$scope.particular = { value: 0 };
				$scope.bici = {
					value: 0,
					options: {
						floor: 0,
						ceil: 200,
						showSelectionBar: true,
						selectionBarGradient: {
							from: '#FFAA3B',
							to: '#FF5A19'
						}
					}
				}

			}

			else if ($scope.TipoTransporte == "Automovil" || $scope.TipoTransporte == "Motocicleta") {

				cicla.style.display = "none";
				publico.style.display = "none";
				particular.style.display = "block";
				$scope.bici = { value: 0 };
				$scope.publico = { value: 0 };
				$scope.particular = {
					value: 0,
					options: {
						floor: 0,
						ceil: 200,
						showSelectionBar: true,
						selectionBarGradient: {
							from: '#FFAA3B',
							to: '#FF5A19'
						}
					}
				}

			}

			else if ($scope.TipoTransporte == "N/A") {

				cicla.style.display = "none";
				particular.style.display = "none";
				publico.style.display = "block";
				$scope.bici = { value: 0 };
				$scope.particular = { value: 0 };
				$scope.publico = {
					value: 0,
					options: {
						floor: 0,
						ceil: 200,
						showSelectionBar: true,
						selectionBarGradient: {
							from: '#FFAA3B',
							to: '#FF5A19'
						}
					}
				}

			}

			else {
				cicla.style.display = "none";
				particular.style.display = "none";
				publico.style.display = "none";
			}
		}

		//Verificar si seleccionó rol
		$scope.seleccionarRol = function () {
			var boton = document.getElementById("botonPasar");
			boton.style.display = "block";
		}
	}

    //inyectar las dependencias que se esta usando
	encuesta.$inject = ["$scope"];
//para declarar que este es mi controlador
AngularApp.controller("EncuestaController", encuesta);

}) ()