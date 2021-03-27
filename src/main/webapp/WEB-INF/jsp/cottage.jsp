<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />
<div class="ui hidden divider"></div>

<div class="ui container" style="padding-top: 7em;">
    <c:choose>
       <c:when test="${errors != null}">
           <div class="ui error message">
               <c:choose>
                   <c:when test="${errors.class.name == 'java.lang.String'}">
                       <div class="header">Your reservation didn't go through!</div>
                       <p>${errors}</p>
                   </c:when>
                   <c:otherwise>
                       <div class="header">${errors.fieldErrors.get(0).code}</div>
                       <p>${errors.class.name}</p>
                       <p>${errors.fieldErrors.get(0).defaultMessage}</p>
                   </c:otherwise>
               </c:choose>

           </div>
       </c:when>
        <c:when test="${success != null}">
            <div class="ui success message">
                <div class="header">Success!</div>
                <p>${success}</p>
            </div>
        </c:when>
    </c:choose>
    <img class="ui fluid rounded image" src="${pageContext.request.contextPath}/img/cottage.jpg"  alt=""/>
    <div class="ui text container" style="padding-top: 30px;">
        <div class="content">
            <h2 class="ui header">${cottage.name}</h2>
            <div class="ui hidden divider"></div>
            <div class="description">
                Description
                <p>
                    <br />
                    ${cottage.description}
                </p>
            </div>
            <div class="ui hidden divider"></div>
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <form class="ui form" action="${cottage.cottageId}/book" method="post" autocomplete="off">
                        <div class="two fields">
                            <div class="field">
                                <label>Booking date</label>
                                <div class="ui calendar" id="rangestart">
                                    <div class="ui input left icon">
                                        <i class="calendar icon"></i>
                                        <input type="text" name="startingDate" placeholder="Start Date" required  />
                                    </div>
                                </div>
                            </div>
                            <div class="field">
                                <label>End Date</label>
                                <div class="ui calendar" id="rangeend">
                                    <div class="ui input left icon">
                                        <i class="calendar icon"></i>
                                        <input type="text" name="endingDate" placeholder="End Date" required  />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p>Current Price: <span id="pricetag"></span></p>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input id="price" type="hidden" name="price" readonly>
                        <button type="submit" class="ui blue submit button">Book</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="ui hidden divider"></div>
                    You must <a href="${pageContext.request.contextPath}/login">Sign in</a> or <a href="${pageContext.request.contextPath}/register">Register</a>
                    an account if you want to rent cottages.
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>

<script>

    const today = new Date();
    let price = ${cottage.price};
    let bookingStartDate = 0, bookingEndDate = 0;

    $('#rangestart').calendar({
        type: 'date',
        minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
        disabledDates: [
            <c:forEach items="${reservation_data}" varStatus="outerStatus" var="l">
                <c:forEach items="${l}" varStatus="status" var="d">
                    {
                        date: new Date(${d.year}, ${d.monthValue - 1}, ${d.dayOfMonth}),
                        message: 'Cottage already booked'
                    }<c:if test="${!status.last}">,</c:if></c:forEach><c:if test="${!outerStatus.last}">,</c:if>
            </c:forEach>
        ],
        endCalendar: $('#rangeend'),
        formatter: {
            date: function(date, settings) {
                if(!date) return '';
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                return year + '-' + month + '-' + day;
            }
        },
        onSelect: function (date, mode) {
            if(mode === "day") {
                bookingStartDate = date;
            }
        }
    });

    $('#rangeend').calendar({
        type: 'date',
        minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1),
        disabledDates: [
            <c:forEach items="${reservation_data}" varStatus="outerStatus" var="l">
                <c:forEach items="${l}" varStatus="status" var="d">
                    {
                        date: new Date(${d.year}, ${d.monthValue - 1}, ${d.dayOfMonth}),
                        message: 'Cottage already booked'
                    }<c:if test="${!status.last}">,</c:if></c:forEach><c:if test="${!outerStatus.last}">,</c:if>
            </c:forEach>
        ],
        startCalendar: $('#rangestart'),
        formatter: {
            date: function(date, settings) {
                if(!date) return '';
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                return year + '-' + month + '-' + day;
            }
        },
        onSelect: function (date, mode) {
            if(bookingStartDate !== 0 && mode === "day") {
                bookingEndDate = date;
                let diff = Math.round((bookingEndDate.getTime() - bookingStartDate.getTime()) / (1000 * 3600 * 24)) + 1;
                $('#pricetag').html(price * diff + "e, ${cottage.price}e/night");
                $('#price').val(diff * price)
            }
        },
        onShow: function() {
            $('#rangeend').calendar('set minDate', new Date(bookingStartDate.getFullYear(), bookingStartDate.getMonth(), bookingStartDate.getDate() + 1));
        }
    });

    $('input[name="startingDate"]').keypress(function(e) { e.preventDefault(); });
    $('input[name="endingDate"]').keypress(function(e) { e.preventDefault(); });

</script>
</body>

</html>