//controlador angular de personas
(function () {
    //var personas = function ($scope, nombre del servicio) {
	var encuesta = function ($scope) {

		$("#botonPasar").click(function() {
			var enlace = $(this).attr("enlace");
			var posX = $(enlace).position().left;

			$("html,body").stop(true,true).animate({
				scrollLeft:posX+"px"
			},1000, "easeOutExpo")
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

	}
	


    //inyectar las dependencias que se esta usando
	encuesta.$inject = ["$scope"];
    //para declarar que este es mi controlador
	AngularApp.controller("EncuestaController", encuesta);

})()