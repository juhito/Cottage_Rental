<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />
    <div class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column" id="content">
        <div class="ui padded grid">
            <div class="row">
                <h1 class="ui huge dividing header">Recently added items</h1>
            </div>
            <div class="center aligned row">
                <c:forEach var="cot" items="${cottages}">
                    <div class="eight wide mobile four wide tablet four wide computer column">
                        <img class="ui centered small circular image" src="img/cottage.jpg"/>
                        <div class="ui large basic label">${cot.name}</div>
                    </div>
                </c:forEach>
            </div>
            <div class="ui hidden section divider"></div>
            <div class="row">
                <h1 class="ui huge dividing header">Recently registered users</h1>
            </div>
                <div class="center aligned row">
                    <c:forEach var="usr" items="${users}">
                        <div class="eight wide mobile four wide tablet four wide computer column">
                            <img class="ui centered small circular image" src="img/profile.jpg" />
                            <div class="ui large basic label">${usr.username}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/js/oma.js"></script>
</body>
</html>