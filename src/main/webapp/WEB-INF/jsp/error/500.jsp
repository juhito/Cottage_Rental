<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>OMG! 500</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
</head>
<body>

<div class="ui grid middle aligned segment blue inverted" style="height: 100%; margin: 0;">
    <div class="ui column center aligned">
        <div class="ui inverted statistic">
            <div class="value">500</div>
            <div class="label">Internal Server Error</div>
            <div class="ui hidden divider"></div>
            <a href="${pageContext.request.contextPath}/" class="ui primary basic inverted labeled icon button">
                <i class="left arrow icon"></i>
                Go back
            </a>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
</body>
</html>