<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Audio Book List</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="stylesheet" href="css/app.css" />
    </head>
    <body>
        <!-- Navigation -->
        <jsp:include page="/pages/navigation.jsp" />

        <!-- HERO SECTION -->
        <section class="hero">
            <div class="wrap">
                <h1>AudioBooksList - Save your AudioBooks </h1>
                <h2>Features:</h2>
                <ul class="square">
                    <li>Save your favorite audiobooks in a list</li>
                    <li>Write reviews about interesting titles</li>
                    <li>Learn more about new audiobooks</li>
                </ul>
            </div>
        </section>

        <!-- MAIN CONTENT -->
        <section class="main">
            <div class="wrap">
                <div class="row">
                    <h2>Top Rated Audiobooks</h2>
                    <hr>
                    <div class="large-4 medium-4 columns" >
                        <div class="audiobookBox">
                            <img src="img/img1.jpg" alt="The Whistler" />
                            <h3 class="text-center">The Whistler</h3>
                            <span class="rating"><span class="stars">5</span><span class="votes">(205)</span></span>
                        </div>
                    </div>
                    <div class="large-4 medium-4 columns">
                        <div class="audiobookBox">
                            <img src="img/img1.jpg" alt="Two by Two" />
                            <h3 class="text-center">Two by Two</h3>
                            <span class="rating"><span class="stars">4,5</span><span class="votes">(99)</span></span>
                        </div>
                    </div>
                    <div class="large-4 medium-4 columns">
                        <div class="audiobookBox">
                            <img src="img/img1.jpg" alt="Small Great Things: A Novel" />
                            <h3 class="text-center">Small Great Things: A Novel</h3>
                            <div class="rating"><span class="stars">3,2</span><span class="votes">(120)</span></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <h2 id="recentAudioBooks">Recent Audio Books</h2>
                    <hr>
                    <div class="large-4 medium-4 columns" >
                        <div class="audiobookBox">
                            <img src="img/img1.jpg" alt="The Chemist" />
                            <h3 class="text-center">The Chemist</h3>
                        </div>
                    </div>
                    <div class="large-4 medium-4 columns">
                        <div class="audiobookBox">
                            <img src="img/img1.jpg" alt="Catalyst (Star Wars): A Rogue One Novel" />
                            <h3 class="text-center">Catalyst (Star Wars): A Rogue One Novel</h3>
                        </div>
                    </div>
                    <div class="large-4 medium-4 columns">
                        <div class="audiobookBox">
                            <img src="img/img1.jpg" alt="A Gentleman in Moscow: A Novel" />
                            <h3 class="text-center">A Gentleman in Moscow: A Novel</h3>
                        </div>
                    </div>
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