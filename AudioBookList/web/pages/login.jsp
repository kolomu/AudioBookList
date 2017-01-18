<!DOCTYPE html>
<html>
    <head>
        <title>Log In - Audio Book List</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../css/foundation.css" />
        <link rel="stylesheet" href="../../css/app.css" />
    </head>
    <body>
        <!-- NAVIGATION -->
      <jsp:include page="navigation.jsp" />

        <!-- MAIN CONTENT -->
        <section class="main">
            <div class="row">
                <div class="medium-6 medium-centered large-4 large-centered columns">

                    <form action="j_security_check" method="POST">
                        <div class="row column log-in-form">
                            <h4 class="text-center">Log in with your email account</h4>
                            <label>Email
                                <input type="text" placeholder="somebody@example.com" name="j_username">
                            </label>
                            <label>Password
                                <input type="password" placeholder="Password" name="j_password">
                            </label>
                            <input id="show-password" type="checkbox"><label for="show-password">Show password</label>
                            <input type="submit" class="button expanded" value="Login">
                            <p class="text-center"><a href="#">Forgot your password?</a></p>   
                        </div>
                    </form>

                </div>
            </div>
        </section>

        <!-- FOOTER SECTION -->
        <jsp:include page="footer.jsp" />

        <script src="../../js/vendor/jquery.js"></script>
        <script src="../../js/stickyfooter.js"></script>
        <script src="../../js/vendor/what-input.js"></script>
        <script src="../../js/vendor/foundation.js"></script>
        <script src="../../js/app.js"></script>
    </body>
</html>
