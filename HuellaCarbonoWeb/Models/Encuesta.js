//controlador angular de personas
(function () {
    //var personas = function ($scope, nombre del servicio) {
	var encuesta = function ($scope) {

	}


    //inyectar las dependencias que se esta usando
	encuesta.$inject = ["$scope"];
    //para declarar que este es mi controlador
	AngularApp.controller("EncuestaController", encuesta);

})()