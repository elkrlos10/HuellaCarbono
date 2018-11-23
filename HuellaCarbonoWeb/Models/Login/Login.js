//controlador angular de personas
(function () {
    //var personas = function ($scope, nombre del servicio) {
    var login = function ($scope, $rootScope, LoginService, $cookies, $cookieStore, $location) {

        $scope.Usuario = {
            NombreUsuario: "",
            Password: "",
        };

        $scope.ConsultarUsuario = function () {
            if ($scope.Usuario.NombreUsuario == null || $scope.Usuario.NombreUsuario == "") {
                alert("Necesita ingresar el campo de Usuario");

                return false;

            } else if ($scope.Usuario.Password == null || $scope.Usuario.Password == "") {
                alert("Necesita ingresar el campo de contraseña");

                return false;
            } else {
                var hash = CryptoJS.MD5($scope.Usuario.Password);
                $scope.Usuario.Password = hash.toString();
              
                LoginService.ConsultarUsuario($scope.Usuario).then(function (response) {
                    if (response.data.user) {
                        if (response.data.usuario.TipoUsuario !=3) {

                            alert("el usuario no tiene permisos");
                            return;
                        }
                        if (response.data.usuario != null) {

                            $rootScope.globals = {
                                currentUser: {
                                    id: response.data.usuario.IdUsuario,
                                    nombre: response.data.usuario.NombreUsuario ,
                                    tipousuario: response.data.usuario.TipoUsuario,
                                }
                            };
                            $cookies.putObject("username", $rootScope.globals);
                            $location.url('/Dashboard');

                        }
                    } else {

                        alert("El usuario o la contraseña es incorrecta");
                    }
                });
            }
        }

    }
    //inyectar las dependencias que se esta usando
    login.$inject = ["$scope", "$rootScope", "LoginService", "$cookies", "$cookieStore", "$location"];
    //para declarar que este es mi controlador
    AngularApp.controller("LoginController", login);

})()