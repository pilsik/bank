<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<html>
<header>
    <title>
        <jsp:invoke fragment="title"/>
    </title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</header>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Bank</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="${pageContext.servletContext.contextPath}/client">Client</a>
            <a class="nav-item nav-link" href="${pageContext.servletContext.contextPath}/city">City</a>
            <a class="nav-item nav-link" href="${pageContext.servletContext.contextPath}/citizenship">Citizenship</a>
            <a class="nav-item nav-link" href="${pageContext.servletContext.contextPath}/disability">Disability</a>
            <a class="nav-item nav-link" href="${pageContext.servletContext.contextPath}/marital_status">Marital status</a>
        </div>
    </div>
</nav>
<div id="body">
    <jsp:doBody/>
</div>
<div id="pagefooter">
    <jsp:invoke fragment="footer"/>
</div>
</body>
</html>