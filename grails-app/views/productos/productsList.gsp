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
        $(document).ready(function () {

            $(document).on("click",".edit-product", function () {
                var idElement = $(this).attr("id");
                var sList = idElement.split("@@");
                var productId = sList[1];

                $("#certificateId").val(productId);
                console.log("product id: " + productId);
                return false;
            });

            $(document).on("click",".delete-product", function () {
                var idElement = $(this).attr("id");
                var sList = idElement.split("@@");
                var productId = sList[1];

                $("#idDelete").val(productId);
                console.log("product id: " + productId);
                return false;
            });

            $(document).on("click","#confirmDeleteButton", function () {
                $("#deleteProductForm").submit();
                return false;
            });

        });

    </script>
</head>

<body>

<div class="grey_box">
    <div class="row first-row">

        <div class="col m10 offset-m1 s12">

            <div class="row">
                <h4 align="center" class="page_title">
                    Lista de Productos
                </h4>
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
                                <a class="waves-effect waves-light btn">Descripción</a>
                            </td>
                            <td>
                                <a class="waves-effect waves-light btn"><i class="material-icons left">shopping_cart</i>Comprar</a>
                            </td>
                            %{--<td>
                                <a id="productLink@@${product.activoId}" href="#modal1" class="edit-product modal-trigger btn btn-lg btn-block btn-edit">Edit</a>
                            </td>
                            <td>
                                <a id="productLink@@${product.activoId}" href="#modal2" class="delete-product modal-trigger btn btn-lg btn-block btn-terciary">Delete</a>
                            </td>--}%

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
            <i class="material-icons">edit</i> Edit
        </h4>

        <div class="modal_body row">
            <form role="form" method='POST'>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="productNameEdit" type="text" class="validate">
                        <label for="productNameEdit">Name</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="productBarCodeEdit" type="text" class="validate">
                        <label for="productBarCodeEdit">Barcode</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="productURLEdit" type="text" class="validate">
                        <label for="productURLEdit">URL</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="productDescriptionEdit" type="text" class="validate">
                        <label for="productDescriptionEdit">Description</label>
                    </div>

                </div>

                <div align="right">
                    <a id="editProductButton" class="btn btn-lg waves-effect waves-light btn-primary">Edit</a>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="modal2" class="modal">
    <div class="modal-content">

        <h5 class="form-signin-heading">
            <i class="material-icons">delete</i> Are you sure?
        </h5>

        <div class="modal_body row">
            <form role="form" method='POST'>

                <div align="right">
                    <a id="confirmDeleteButton" class="btn btn-lg waves-effect waves-light btn-confirm">Confirm</a>
                    <a id="noDeleteButton" class="modal-close btn btn-lg waves-effect waves-light btn-cancel">Cancel</a>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>