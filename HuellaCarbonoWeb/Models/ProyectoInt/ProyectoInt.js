(function () {
	//var personas = function ($scope, nombre del servicio) {
	var proyectoInt = function ($scope) {
		$scope.directive('showtab',
			function () {
				return {
					link: function (scope, element, attrs) {
						element.click(function (e) {
							e.preventDefault();
							$(element).tab('show');
						});
					}
				};
			});
	}
	//inyectar las dependencias que se esta usando
	proyectoInt.$inject = ["$scope"];
	//para declarar que este es mi controlador
	AngularApp.controller("ProyectoIntController", proyectoInt);

})()