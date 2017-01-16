<!DOCTYPE html>
<html>
    <head>
        <title>Signed Out - Audio Book List</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="3; url=<%=request.getContextPath()%>/" />
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

                    <h1>Signed Out!</h1>

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
