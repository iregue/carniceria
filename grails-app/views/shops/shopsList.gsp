<%--
  Created by IntelliJ IDEA.
  Date: 12/11/2018
  Time: 17:54
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Tiendas - Carniceria Riesco</title>

    <script>
        $(document).ready(function () {

        });

    </script>
</head>

<body>

<div class="grey_box">
    <div class="row first-row">

        <div class="col m10 offset-m1 s12">

            <div class="row">
                <h4 align="center" class="page_title">
                    Tiendas Riesco
                </h4>
            </div>

            <div class="row">



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