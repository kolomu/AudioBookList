<!DOCTYPE html>
<html>
    <head>
        <title>Log In - Audio Book List</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/foundation.css" />
        <link rel="stylesheet" href="../css/app.css" />
    </head>
    <body>
        <!-- NAVIGATION -->
      <jsp:include page="navigation.jsp" />

        <!-- MAIN CONTENT -->
        <section class="main">
            <div class="row">
                <div class="medium-6 medium-centered large-4 large-centered columns">

                    <form>
                        <div class="row column log-in-form">
                            <h4 class="text-center">Log in with your email account</h4>
                            <label>Email
                                <input type="text" placeholder="somebody@example.com">
                            </label>
                            <label>Password
                                <input type="text" placeholder="Password">
                            </label>
                            <input id="show-password" type="checkbox"><label for="show-password">Show password</label>
                            <p><a type="submit" class="button expanded">Log In</a></p>
                            <p class="text-center"><a href="#">Forgot your password?</a></p>   
                        </div>
                    </form>

                </div>
            </div>
        </section>

        <!-- FOOTER SECTION -->
        <jsp:include page="footer.jsp" />

        <script src="../js/vendor/jquery.js"></script>
        <script src="../js/stickyfooter.js"></script>
        <script src="../js/vendor/what-input.js"></script>
        <script src="../js/vendor/foundation.js"></script>
        <script src="../js/app.js"></script>
    </body>
</html>
