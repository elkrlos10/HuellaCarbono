//controlador angular de personas
(function () {
    //var personas = function ($scope, nombre del servicio) {
    var encuesta = function ($scope, EncuestaService, $location) {

        $scope.Encuesta = {
            IdEncuesta: "",
            IdProyecto: $location.search().IdProyecto,
            TipoPersona: "",
            TipoTransporte: "",
            KilometrosBicicleta: 0,
            TipoCombustible: "",
            DistanciaAutoMoto: 0,
            DistanciaPublico: "",
            CantidadPersonas: "",
            VuelosNacionales: 0,
            VuelosInternacionales: 0,
            HorasVuelo: 0,
            CantidadCuadernos: "",
            CantidadSobres: "",
            CantidadResmas: "",
            Puntos: "",
            Residuos: "",
            Aviso: "",
            Luz: "",
            Aparatos: "",
            Computador: "",

        };

        $scope.RegistarEncuesta = function () {
            $scope.Encuesta.TipoPersona = $scope.TipoPersona;
            $scope.Encuesta.TipoTransporte = $scope.TipoTransporte;
			$scope.Encuesta.KilometrosDia = $scope.distancia.value;
            $scope.Encuesta.VuelosNacionales = $scope.vuelosNacionales.value;
            $scope.Encuesta.VuelosInternacionales = $scope.vuelosInternacionales.value;
            $scope.Encuesta.HorasVuelo = $scope.horasVuelos.value;
            $scope.Encuesta.CantidadCuadernos = $scope.cuadernos.value;
            $scope.Encuesta.CantidadSobres = $scope.sobres.value;
            $scope.Encuesta.CantidadResmas = $scope.resmas.value;
            $scope.Encuesta.Puntos = $scope.puntos.cb1;
            $scope.Encuesta.Residuos = $scope.residuos.cb1;
            $scope.Encuesta.Aviso = $scope.aviso.cb1;
            EncuestaService.RegistarEncuesta($scope.Encuesta, function (response) {

            });
        };

        window.onload = function () {
            var posX = $(".index").position().left;

            $("html,body").stop(true, true).animate({
                scrollLeft: posX + "px"
            }, 1000, "easeOutExpo")
        }

        $scope.TipoPersona = 0;
        $("#botonPasar").click(function () {
            var enlace = $(this).attr("enlace");
            var posX = $(enlace).position().left;

            $("html,body").stop(true, true).animate({
                scrollLeft: posX + "px"
            }, 1000, "easeOutExpo")

            $scope.TipoPreguntasPapel();
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

			if ($scope.TipoTransporte != "Caminando") {
				if ($scope.TipoTransporte == undefined || $scope.distancia.value == 0) {
					return;
				}
			}

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
		$scope.distancia = {
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
                ceil: 100,
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

        //Checkbox Seleccionar Rol
        $scope.TipoPreguntasPapel = function () {

            if ($scope.TipoPersona == 2) {
                var ocultar = document.getElementById("ocultar");
                var pregunta = document.getElementsByClassName("preguntaPapel")[0];
                var barra = document.getElementsByClassName("barraPapel")[0];
                ocultar.style.display = "none";
                pregunta.style.marginTop = "300px";
                barra.style.top = "46%";
            }

            else {
                var ocultar = document.getElementById("ocultar");
                var pregunta = document.getElementsByClassName("preguntaPapel")[0];
                var barra = document.getElementsByClassName("barraPapel")[0];
                ocultar.style.display = "block";
                pregunta.style.marginTop = "0px";
                barra.style.top = "25%";
            }
        }

        //Checkbox Seleccionar Automovil
        var particular = document.getElementById("particular");
        var publico = document.getElementById("publico");
        var cicla = document.getElementById("cicla");

        cicla.style.display = "none";
        particular.style.display = "none";
        publico.style.display = "none";

        $scope.CambiarTransporte = function () {

            if ($scope.TipoTransporte == "Bicicleta") {

                particular.style.display = "none";
                publico.style.display = "none";
                cicla.style.display = "block";
				$scope.distancia = {
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

            }

            else if ($scope.TipoTransporte == "Automovil") {

                cicla.style.display = "none";
				publico.style.display = "none";
				particular.style.display = "none";

				particular.style.display = "block";
				$(".auto").remove();
				$('<option class="auto" value="0">0</option> \
					<option class= "auto" value = "1" > 1</option > \
					<option class="auto" value = "2" > 2</option> \
					<option class="auto" value ="3"> 3</option> \
					<option class="auto" value = "4"> 4</option> ').appendTo("#personas");
				$(".comb").remove();
				$('<option class="comb" value="Gas">Gas Natural</option>\
					<option class="comb" value = "Gasolina" > Gasolina</option >\
					<option class="comb" value="Diesel">Diesel</option>').appendTo(".medioCombustible");

				$scope.distancia = {
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

			}

			else if ($scope.TipoTransporte == "Motocicleta") {

				cicla.style.display = "none";
				publico.style.display = "none";
				particular.style.display = "none";
				particular.style.display = "block";
				$(".auto").remove();
				$('<option class="auto" value="0">0</option> \
					<option class="auto" value = "1" > 1</option>').appendTo("#personas");
				$(".comb").remove();
				$('<option class="comb" value = "Gasolina" > Gasolina</option >\
					<option class="comb" value="Diesel">Diesel</option>').appendTo(".medioCombustible");
				$scope.distancia = {
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

			}

            else if ($scope.TipoTransporte == "N/A") {

                cicla.style.display = "none";
                particular.style.display = "none";
                publico.style.display = "block";
				$scope.distancia = {
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

            }

            else {
                cicla.style.display = "none";
                particular.style.display = "none";
                publico.style.display = "none";
            }
        }

        //Verificar si seleccionó rol
        $scope.seleccionarRol = function () {
            var boton = document.getElementById("botonPasar");
            boton.style.display = "block";
        }
    }

    //inyectar las dependencias que se esta usando
    encuesta.$inject = ["$scope", "EncuestaService", "$location"];
    //para declarar que este es mi controlador
    AngularApp.controller("EncuestaController", encuesta);

})()