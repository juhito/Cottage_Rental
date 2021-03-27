<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cottages</title>

        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    </head>
<body>
    <c:import url="header.jsp" charEncoding="utf-8" />
    <div class="ui hidden divider"></div>
    <div class="ui container" style="padding-top: 7em;">
        <div class="ui link three stackable cards">
            <c:forEach var="b" items="${cottages}">
                <div class="ui card">
                    <a href="cottages/${b.cottageId}" class="image">
                        <img src="${pageContext.request.contextPath}/img/cottage.jpg" />
                    </a>
                    <div class="content">
                        <div class="header">${b.name}</div>
                        <div class="meta">
                            <a>${b.price}€/night</a>
                        </div>
                        <div class="description">
                            ${fn:substring(b.description, 0, 40)}...
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">
                                ${b.location}
                        </span>
                        <span>
                            <i class="user icon"></i>
                            ${b.peopleSize}
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
</body>

</html>