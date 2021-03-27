<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cottage Rental</title>

        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cover.css">
    </head>
<body>
<div class="ui inverted vertical center aligned segment">
    <c:import url="header.jsp" charEncoding="utf-8" />
    <div class="ui content container">
        <h1 class="ui inverted header">FIND YOUR PERFECT COTTAGE</h1>
        <p>
            Find your cottage in one of Finland's beautiful landscapes. Here at Cottages Finland, you can find various properties that will suit your individual needs.
        </p>
        <a href="${pageContext.request.contextPath}/cottages" class="ui huge primary button">Reserve NOW!</a>
    </div>
    <footer class="ui inverted vertical segment">
        Made with <a href="http://semantic-ui.com">Semantic-UI</a>
    </footer>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
</body>
</html>