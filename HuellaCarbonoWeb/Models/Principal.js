//Inicializamos el modulo de angular e injectamos las dependencias que necesite
var AngularApp = angular.module("HuellaApp", ["ngRoute", "rzModule", "ngMaterial", "ui.knob", "ngCookies", "ngValidate"]);

//Configuración de las rutas (vistas)
(function () {

    var rutas = function ($routeProvider, $locationProvider) {

        $routeProvider.when("/Encuesta", {
            templateUrl: "Views/Encuesta.html",
            controller: "EncuestaController"
        })

        $routeProvider.when("/Login", {
            templateUrl: "Views/Login.html",
            controller: "LoginController"
        })

        $routeProvider.when("/Dashboard", {
            templateUrl: "Views/Dashboard.html",
            controller: "DashboardController"
        })

        $routeProvider.when("/ProyectoInt", {
            templateUrl: "Views/ProyectoInt.html",
            controller: "ProyectoIntController"
        })
            .otherwise({
                redirecTo: "/"
            });
        $locationProvider.html5Mode({
            enabled: true,
            requireBase: false
        });
    }

    //Injectamos las dependencias que utilizamos
    rutas.$inject = ["$routeProvider","$locationProvider"];


    //Indicamos que será configuración de la app
    AngularApp.config(rutas);


    //var directives = angular.module('directives');

    AngularApp.directive('showtab',
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
})();


(function () {
    var run = function ($rootScope, $location, $cookies, $cookieStore, $http, $templateCache) {
        $rootScope.$on('$locationChangeStart', function (event, next, current) {

            $rootScope.globals = $cookieStore.get('username');
          

            if ($location.path() == "/Encuesta") {
                return false;
            }

            if ($rootScope.globals == undefined) {
                $location.url("/Login");
                return false;
            } else {
                if ($location.path() == "/Login" && $rootScope.globals.currentUser.tipousuario == 3) {
                    $location.url("/Dashboard");

                    return false;
                }

                else if ($location.path() == "/Dashboard" && $rootScope.Id != undefined) {
                    $location.url("/ProyectoInt");
                    
                }
            }

        });
    };
    run.$inject = ['$rootScope', '$location', '$cookies', '$cookieStore', '$http', '$templateCache'];
    AngularApp.run(run);
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