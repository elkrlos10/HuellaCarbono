//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
	var encuesta = function ($scope) {

		$("#botonPasar").click(function () {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true, true).animate({
				scrollLeft: posX + "px"
			}, 1000, "easeOutExpo")
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
				ceil:100,
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

		
	}

    //inyectar las dependencias que se esta usando
	encuesta.$inject = ["$scope"];
//para declarar que este es mi controlador
AngularApp.controller("EncuestaController", encuesta);

}) ()