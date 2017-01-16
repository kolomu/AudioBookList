<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${sessionScope.username != null}">
    <nav class="top-bar nav-desktop">
            <div class="wrap">
                <div class="top-bar-title">
                    <span data-responsive-toggle="responsive-menu" data-hide-for="medium">
                        <button class="menu-icon" type="button" data-toggle></button>
                    </span>
                    <strong><a href="<%=request.getContextPath()%>/index.jsp">Audio Book List</a></strong>
                </div>
                <div id="responsive-menu">
                    <div class="top-bar-left">
                        <ul class="dropdown menu" data-dropdown-menu>
                            <li>
                                <a href="#">Audio Books Categories</a>
                                <ul class="menu vertical">
                                    <li><a href="#">Mysteries & Thrillers</a></li>
                                    <li><a href="#">Romance</a></li>
                                    <li><a href="#">Sci-Fi & Fantasy</a></li>
                                    <li><a href="#">Fiction</a></li>
                                    <li><a href="#">History</a></li>
                                    <li><a href="#">Teens</a></li>
                                    <li><a href="#">Science & Technology</a></li>
                                    <li><a href="#">Kids</a></li>
                                    <li><a href="#">Classics</a></li>
                                    <li><a href="#">Nonfiction</a></li>
                                    <li><a href="#">Bios & Memoirs</a></li>
                                    <li><a href="#">Comedy</a></li>
                                    <li><a href="#">Business</a></li>
                                    <li><a href="#">Foreign Language</a></li>
                                    <li><a href="#">Self Development</a></li>
                                    <li><a href="#">More Categories</a></li>
                                </ul>
                            </li>
                            <li><input type="search" placeholder="Search"></li>
                            <li><button type="button" class="button">Search</button></li>
                        </ul>
                    </div>
                    <div class="top-bar-right">
                        <ul class="menu">
                            <li><a href="<%=request.getContextPath()%>/pages/signout.jsp">Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </c:when> 
    <c:otherwise>
        <nav class="top-bar nav-desktop">
            <div class="wrap">
                <div class="top-bar-title">
                    <span data-responsive-toggle="responsive-menu" data-hide-for="medium">
                        <button class="menu-icon" type="button" data-toggle></button>
                    </span>
                    <strong><a href="<%=request.getContextPath()%>/index.jsp">Audio Book List</a></strong>
                </div>
                <div id="responsive-menu">
                    <div class="top-bar-left">
                        <ul class="dropdown menu" data-dropdown-menu>
                            <li>
                                <a href="#">Audio Books Categories</a>
                                <ul class="menu vertical">
                                    <li><a href="#">Mysteries & Thrillers</a></li>
                                    <li><a href="#">Romance</a></li>
                                    <li><a href="#">Sci-Fi & Fantasy</a></li>
                                    <li><a href="#">Fiction</a></li>
                                    <li><a href="#">History</a></li>
                                    <li><a href="#">Teens</a></li>
                                    <li><a href="#">Science & Technology</a></li>
                                    <li><a href="#">Kids</a></li>
                                    <li><a href="#">Classics</a></li>
                                    <li><a href="#">Nonfiction</a></li>
                                    <li><a href="#">Bios & Memoirs</a></li>
                                    <li><a href="#">Comedy</a></li>
                                    <li><a href="#">Business</a></li>
                                    <li><a href="#">Foreign Language</a></li>
                                    <li><a href="#">Self Development</a></li>
                                    <li><a href="#">More Categories</a></li>
                                </ul>
                            </li>
                            <li><input type="search" placeholder="Search"></li>
                            <li><button type="button" class="button">Search</button></li>
                        </ul>
                    </div>
                    <div class="top-bar-right">
                        <ul class="menu">
                            <li><a href="<%=request.getContextPath()%>/pages/register.jsp">Register</a></li>
                            <li><a href="<%=request.getContextPath()%>/pages/login.jsp">Sign In</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </c:otherwise>
</c:choose>

