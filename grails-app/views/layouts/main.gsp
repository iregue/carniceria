<%@ page contentType="text/html;charset=UTF-8" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Carniceria Riesco"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="icon" href="${resource(dir: 'images', file: 'logo_riesco.png')}">

	<link rel="stylesheet" href="${resource(dir: 'css', file: 'materialize.min.css')}">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'carniceria_look.css')}">

	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-3.2.1.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'materialize.min.js')}"></script>


	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<script>

        function deleteToast() {
            M.Toast.dismissAll();
        }


        function showMainLoader() {

            $('#loading_marker').css('display','block');
            return false;
        }

        $(document).ready(function () {


            <g:if test="${msgOk}">
            var toastHTML = '<span>${msgOk}</span><button onclick="deleteToast()" class="btn-flat toast-action"><i class="material-icons left">clear</i></button>';
            M.toast({html: toastHTML, displayLength : 10000});
            </g:if>

            <g:if test="${msgError}">
            var toastHTML = '<span>${msgError}</span><button onclick="deleteToast()" class="btn-flat toast-action"><i class="material-icons left">clear</i></button>';
            M.toast({html: toastHTML, displayLength : 10000});
            </g:if>


            $('.sidenav').sidenav();

            $('select').formSelect();


            $('.datepicker').datepicker({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 100, // Creates a dropdown of 15 years to control year,
                today: 'Today',
                clear: 'Clear',
                close: 'Ok',
                format: "dd/mm/yyyy",
                closeOnSelect: false // Close upon selecting a date,
            });


            $('.modal').modal({
                    dismissible: true, // Modal can be dismissed by clicking outside of the modal
                    opacity: .85, // Opacity of modal background
                    inDuration: 300, // Transition in duration
                    outDuration: 300, // Transition out duration
                    startingTop: '80%', // Starting top style attribute
                    endingTop: '10%' // Ending top style attribute

                    /*ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                     alert("Ready");
                     console.log(modal, trigger);
                     },
                     complete: function() { alert('Closed'); } // Callback for Modal close*/
                }
            );


            var urlPage = window.location.href;

            if (urlPage.indexOf("/shops/index") >= 0) {
                $("#shopListLink").addClass("active");
                $("#mobileShopListLink").addClass("active");
            }

            else if (urlPage.indexOf("login/auth") >= 0) {
                $("#loginLink").addClass("active");
                $("#mobiileloginLink").addClass("active");
            }
            else if (urlPage.indexOf("/carniceria/") >= 0) {
                $("#productListLink").addClass("active");
                $("#mobileproductListLink").addClass("active");
            }


        });


	</script>
	<g:layoutHead/>

</head>
<body>

<div id="wrapper" class="toggled">

	<nav class="navbar">

		<div class="nav-wrapper">
			<a href="#" class="brand-logo">
				<g:img dir="images" file="logo_riesco.png" class="avatar-img img-responsive" />
				<!--<img class="avatar-img img-responsive" alt="Responsive image" src=>-->
			</a>
			<a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
				<li id="productListLink">
					<a onclick="showMainLoader()" href="${createLink(action: 'index', controller: 'productos')}">
						<i class="material-icons left">add</i>
						Lista de Productos
					</a>
				</li>
				<li id="shopListLink">
					<a onclick="showMainLoader()" href="${createLink(action: 'index', controller: 'shops')}">
						<i class="material-icons left">list</i>
						Tiendas
					</a>
				</li>
				<li id="loginLink">
					<a onclick="showMainLoader()" href="${createLink(action: 'auth', controller: 'login')}">
						<i class="material-icons left">exit_to_app</i>
						Iniciar Sesion
					</a>
				</li>
			</ul>

			<ul class="sidenav" id="mobile-demo">
				<li id="mobileproductListLink" class="mobile_link"><a class="mobile_link" href="${createLink(action: 'index', controller: 'productos')}"><i class="material-icons left">add</i> Lista Productos</a></li>
				<li id="mobileShopListLink" class="mobile_link"><a class="mobile_link" href="${createLink(action: 'index', controller: 'shops')}"><i class="material-icons left">list</i> Tiendas</a></li>
				<li id="mobiileloginLink" class="mobile_link"><a class="mobile_link" href="${createLink(action: 'auth', controller: 'login')}"><i class="material-icons left">exit_to_app</i> Iniciar sesión</a></li>
			</ul>
		</div>

	</nav>

	<div id="loading_marker" style="display: none" class="progress">
		<div class="indeterminate"></div>
	</div>

	<div id="page-content-wrapper">
		<g:layoutBody/>
	</div>

</div>

</body>
</html>
