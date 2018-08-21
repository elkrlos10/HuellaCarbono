//controlador angular de personas
(function () {
    //var personas = function ($scope, nombre del servicio) {
    var personas = function ($scope) {


    

        $scope.nombre = function () {
            alert("Hola");
        }








    }


    //inyectar las dependencias que se esta usando
    personas.$inject = ["$scope"];
    //para declarar que este es mi controlador
    AngularApp.controller("Prueba2Controller", personas);

})()