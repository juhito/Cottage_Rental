<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />

<div class="ui container" style="padding-top: 7em;">
    <div class="ui segment">
        <h1 class="ui huge dividing header">Account Information</h1>
        <h3><i>Name: </i></h3><p style="display: inline">${user.name}</p>
        <h3><i>Username: </i></h3><p style="display: inline">${user.username}</p>
        <h3><i>Email: </i></h3><p style="display: inline">${user.email}</p>

        <div class="ui hidden divider"></div>

        <h1 class="ui huge dividing header">Your Reservations</h1>
        <table class="ui compact celled sortable table">
            <thead class="full-width">
            <tr>
                <th>Cottage</th>
                <th>Reservation Date</th>
                <th>Reservation End</th>
                <th>Price</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="r" items="${user.reservationsByUserId}" varStatus="status">
                <tr>
                    <td>${r.cottageByCottageId.name}</td>
                    <td>${r.startingDate}</td>
                    <td>${r.endingDate}</td>
                    <td>${r.price}</td>
                    <td class="collapsing">
                        <jsp:useBean id="today" class="java.util.Date" />
                        <fmt:parseDate value="${r.endingDate}" pattern="yyyy-MM-d" var="endingDate" type="date"/>
                        <c:choose>
                            <c:when test="${today ge endingDate}">
                                <p>Paid</p>
                            </c:when>
                            <c:otherwise>
                                <button onclick="document.getElementById('delete-reservation-form-${status.index}').submit();"
                                        class="ui fitted red button">Cancel</button>
                                <form style="display: none" id="delete-reservation-form-${status.index}" action="delete-reservation" method="post">
                                    <input type="hidden" name="deleteReservationId" value="${r.reservationId}" />
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
</body>
</html>