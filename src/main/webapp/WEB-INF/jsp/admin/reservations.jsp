<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin | Reservations</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />
    <div class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column" id="content">
        <div class="ui padded grid">
            <div class="row">
                <h1 class="ui huge dividing header">Active Reservations</h1>

                <table class="ui compact celled sortable table">
                    <thead class="full-width">
                        <tr>
                            <th>Cottage</th>
                            <th>Reserver</th>
                            <th>Reservation Date</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="r" items="${reservations}" varStatus="status">
                        <tr>
                            <td>${r.cottageByCottageId.name}</td>
                            <td>${r.userByUserId.name}</td>
                            <td>${r.startingDate}</td>
                            <td>${r.price}</td>
                            <td class="collapsing">
                                <button onclick="document.getElementById('delete-reservation-form-${status.index}').submit();"
                                        class="ui fitted red button">Delete</button>
                                <form style="display: none" id="delete-reservation-form-${status.index}" action="reservations/delete" method="post">
                                    <input type="hidden" name="deleteReservationId" value="${r.reservationId}" />
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/js/tablesort.js"></script>
<script src="${pageContext.request.contextPath}/js/oma.js"></script>

</body>
</html>