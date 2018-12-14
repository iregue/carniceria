<%--
  Created by IntelliJ IDEA.
  Date: 12/11/2018
  Time: 17:54
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Productos - Carniceria Riesco</title>

    <script>
        var getProductDescription= "${createLink(action: 'getDescription',controller: 'productos')}";

        $(document).ready(function () {
            console.log("start");
            console.log("${categoria}");
            console.log("${calidad}");

            $("#selectCategoria").val("${categoria}");
            $("#selectCalidad").val("${calidad}");

            $(document).on("click",".filterButton", function () {

                var e = document.getElementById("selectCategoria");
                var selectedCategoriaValue = e.options[e.selectedIndex].value;

                e = document.getElementById("selectCalidad");
                var selectedCalidadValue = e.options[e.selectedIndex].value;
                console.log('Calidad: '+selectedCalidadValue);
                console.log('Categoria: '+selectedCategoriaValue);

                $("#categorySelection").val(selectedCategoriaValue);
                $("#qualitySelection").val(selectedCalidadValue);

                e = document.getElementById("filtrar");
                e.submit();
                return false;
            });

            $(document).on("click",".descriptionButton", function () {
                console.log("start");
                var id = $(this).attr("id");
                var sList = id.split("@@");
                var productId = sList[1];

                var body = {productId:productId};
                console.log(body);
                document.getElementById("productNameShow").disabled = false;
                document.getElementById("productDescripcionShow").disabled = false;
                document.getElementById("productCategoriaShow").disabled = false;
                document.getElementById("productCalidadShow").disabled = false;
                $.ajax({
                    type:"POST",
                    url:getProductDescription,
                    cache: false,
                    data: JSON.stringify(body),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        console.log(data);
                        $("#productNameShow").val(data.name);
                        $("#productDescripcionShow").val(data.description_large);
                        $("#productCategoriaShow").val(data.categoria);
                        $("#productCalidadShow").val(data.calidad);
                        Materialize.updateTextFields();

                    }
                });
                Materialize.updateTextFields();
                $("#modal1").modal('open');

                return false;
            });

        });

    </script>
</head>

<body>

<g:form id="filtrar" name="filtrar" url="[action:'filterProducts',controller:'productos']">
    <input type="hidden" id="categorySelection" name="categorySelection">
    <input type="hidden" id="qualitySelection" name="qualitySelection">
</g:form>

<div class="grey_box">
    <div class="row first-row">

        <div class="col m10 offset-m1 s12">

            <div class="row">
                <h4 align="center" class="page_title">
                    Productos
                </h4>
            </div>

            <div class="row">

                <div class="input-field col s4 offset-s1">
                    <select id="selectCategoria" name="selectCategoria" style="padding-top: 10px">
                        <option value="" disabled selected>Selecciona categoría</option>
                        <option value="Cerdo">Productos de cerdo</option>
                        <option value="Pollo">Productos de pollo</option>
                        <option value="Ternera">Productos de Ternera</option>
                    </select>
                    <label class="filterSelect" for="selectCategoria">Productos por categoría</label>
                </div>
                <div class="input-field col s4 offset-s2">
                    <select id="selectCalidad" name="selectCalidad" style="padding-top: 10px">
                        <option value="" disabled selected>Seleccione calidad</option>
                        <option value="Alta">Alta</option>
                        <option value="Media">Media</option>
                        <option value="Baja" disabled>Baja</option>
                    </select>
                    <label class="filterSelect" for="selectCalidad">Productos por calidad</label>
                </div>
                <div class="input-field col s12" align="center">
                    <a id="filterButton" class="filterButton waves-effect waves-light btn">Filtrar</a>
                </div>
            </div>

            <div class="row">

                <table id="validationTable" class="highlight responsive-table">
                    <thead>
                    <tr>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:each in="${productList}" var="product">
                        <tr>
                            <td class="long_word"><img class="responsive-img" src="${product.image}" style="max-height: 100px; max-width: 100px"></td>
                            <td class="long_word">${product.name}</td>
                            <td class="long_word">${product.price}</td>
                            <td>
                                <a id="descriptionButton@@${product.id}" class="descriptionButton waves-effect waves-light btn modal-trigger" href="#modal1">Descripción</a>
                            </td>
                            <td>
                                <a class="waves-effect waves-light btn"><i class="material-icons left">shopping_cart</i>Comprar</a>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>

        </div>

    </div>
</div>

<!-- Modal Structure -->
<div id="modal1" class="modal">
    <div class="modal-content">

        <h4 class="form-signin-heading">
            <i class="material-icons">info_outline</i> Información del producto
        </h4>

        <div class="modal_body row">
            <form role="form" method='POST'>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="productNameShow" type="text" class="validate">
                        <label for="productNameShow">Name</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="productDescripcionShow" type="text" class="validate">
                        <label for="productDescripcionShow">Descripción</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="productCategoriaShow" type="text" class="validate">
                        <label for="productCategoriaShow">Categoría</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="productCalidadShow" type="text" class="validate">
                        <label for="productCalidadShow">Calidad</label>
                    </div>

                </div>

                <div align="right">
                    <a id="closeModal" class="modal-close btn btn-lg waves-effect waves-light btn-primary">Cerrar</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>