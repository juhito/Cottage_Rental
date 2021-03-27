<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin | Cottages</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">


</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />
    <div class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column" id="content">
        <div class="ui padded grid">
            <div class="row">
                <h1 class="ui huge dividing header">Active Cottages</h1>
                <div class="ui link cards">
                    <c:forEach var="b" items="${cottages}" varStatus="status">
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
                                <div class="ui divider"></div>
                                <a onclick="document.getElementById('delete-cottage-form-${status.index}').submit();" class="ui red button">Delete</a>
                                <form id="delete-cottage-form-${status.index}" action="cottages/delete-cottage" method="post">
                                    <input type="hidden" name="cottageId" value="${b.cottageId}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/js/oma.js"></script>

</body>
</html>