<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecting...</title>
        <meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>/MvcController?event=login" />
    </head>
    <body>
        <p><a href="<%=request.getContextPath()%>/MvcController?event=login">Redirecting, click here if it doesn't work automatically.</a></p>
    </body>
</html>
