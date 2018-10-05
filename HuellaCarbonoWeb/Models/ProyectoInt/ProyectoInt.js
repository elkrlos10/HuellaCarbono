(function () {
	//var personas = function ($scope, nombre del servicio) {
	var proyectoInt = function ($scope) {

		//$(".nav-item").click(function () {
		//	var href = $(this).attr("href");
		//	href.removeClass("fade");  
		//})
			
	}
	//inyectar las dependencias que se esta usando
	proyectoInt.$inject = ["$scope"];
	//para declarar que este es mi controlador
	AngularApp.controller("ProyectoIntController", proyectoInt);

})()