<%--

  Date: 12/11/2018
  Time: 17:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main"/>

    <script>


        function deleteToast() {
            M.Toast.dismissAll();
        }


        var getTokenAuthenticationURL = "${createLink(action: 'getAccessToken', controller: 'login')}";



        function getToken(callback){

            var username = document.getElementById("j_username").value;
            var password = document.getElementById("j_password").value;
            document.getElementById("username").value = $("#j_username").val();

            if(username && password){

                var data = {
                    username: username,
                    password: password
                };
                $.ajax({
                    url: getTokenAuthenticationURL,
                    type: "post",
                    cache: false,
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        callback()
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        callback()
                    },
                    statusCode: {
                        401: function () {
                            //window.location.href = logOutUrl
                        }
                    }
                });
            }
            else {
                $('#loginSubmit').removeAttr("disabled");
                $('#spinner').css('display','none');
                $('#signIn').css('display','block');
            }
            return false;
        }

        function deleteToast() {
            M.Toast.dismissAll();
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

            $("#loginSubmit").on("click", function () {

                $('#loginSubmit').attr("disabled","disabled");
                $('#spinner').css('display','block');
                $('#signIn').css('display','none');
                var $elie = $("#spinner"), degree = 0, timer;
                rotate();
                function rotate() {

                    $elie.css({ WebkitTransform: 'rotate(' + degree + 'deg)'});
                    $elie.css({ '-moz-transform': 'rotate(' + degree + 'deg)'});
                    timer = setTimeout(function() {
                        ++degree; rotate();
                    },5);
                }

                getToken(function () {
                    $("#loginForm").submit();
                    clearTimeout(timer);
                });
            });


        });
    </script>

</head>

<body>

<g:form name="loginForm" url="[action: 'auth', controller: 'login']">
    <input type="hidden" name="username" id="username" value="">
</g:form>



<div id="page-content-wrapper">

    <div class="grey_box" id="content" style="padding-top: 20px">

        <g:if test="${msg}">
            <div class="alert alert-danger alert-dismissible" align="center" style="background-color: #ff3737" role="alert" id="loginAlert">

                <p>${msg}</p>
            </div>
        </g:if>

        <div style="margin-top: 20px">
            <form class="form-signin" role="form" method='POST'>

                <h4 class="form-signin-heading"><i class="material-icons">lock</i>
                </span>Login</h4>

                <div class="row">
                    <div class="input-field col s12" style="margin-bottom: 0">
                        <input id="j_username" type="text" class="validate">
                        <label for="j_username">Username</label>
                    </div>

                    <div class="input-field col s12">
                        <input id="j_password" type="password" class="validate">
                        <label for="j_password">Password</label>
                    </div>
                </div>

                <a id="loginSubmit" href="#" class="btn btn-lg btn-primary btn-block"><span style="display: block" id="signIn">Sign in</span><i id="spinner" class="fa fa-refresh fa-spin" style="font-size:24px; display: none"></i></a>
            </form>
        </div>

    </div> <!-- /container -->

    <g:form name="loginForm" url="[action: 'auth', controller: 'login']">
        <input type="hidden" name="username" id="username" value="">
    </g:form>

</div>

</body>
</html>