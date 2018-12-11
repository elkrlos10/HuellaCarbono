//controlador angular de personas
(function () {
    //var personas = function ($scope, nombre del servicio) {
    var politicas = function ($scope) {

    }

    //inyectar las dependencias que se esta usando
    politicas.$inject = ["$scope"];
    //para declarar que este es mi controlador
    AngularApp.controller("PoliticasController", politicas);

})()