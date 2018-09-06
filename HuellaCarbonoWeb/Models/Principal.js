//Inicializamos el modulo de angular e injectamos las dependencias que necesite
var AngularApp = angular.module("HuellaApp", ["ngRoute", "rzModule"]);

//Configuración de las rutas (vistas)
(function () {

    var rutas = function ($routeProvider) {

        $routeProvider.when("/Prueba", {
            templateUrl: "Views/Prueba.html",
            controller: "PersonasController"
        })

		$routeProvider.when("/Encuesta", {
			templateUrl: "Views/Encuesta.html",
			controller: "EncuestaController"
		})
        //Indicamos que cuando copien una ruta que no existe redireccione al index
        $routeProvider.otherwise({ redirecTo: "/" });
    }

    //Injectamos las dependencias que utilizamos
    rutas.$inject = ["$routeProvider"];

    //Indicamos que será configuración de la app
    AngularApp.config(rutas);

})();


    //Funcion para el controlador principal
    (function () {

        var principal = function ($scope, $location) {
            //se declara la funcion
            $scope.AbrirPersonas = function () {
                $location.url("/Prueba");
            };

        }

        principal.$inject = ["$scope", "$location"];

        //indicamos que 'principal' será un controlador de mi módulo de angular 
        AngularApp.controller("PrincipalController", principal);

    })()