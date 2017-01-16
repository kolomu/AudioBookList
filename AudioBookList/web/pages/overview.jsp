<%
    String username = request.getUserPrincipal().getName();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Overview - Audio Book List</title>
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
            <div class="wrap">
                <div class="row">
                    <h2>Overview</h2>
                    <hr>
                    Welcome, <span> <%= username %></span>
                </div>
            </div>
        </section>

        <!-- FOOTER SECTION -->
        <jsp:include page="/pages/footer.jsp" />

        <script src="js/vendor/jquery.js"></script>
        <script src="js/stickyfooter.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
