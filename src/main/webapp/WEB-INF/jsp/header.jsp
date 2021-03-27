<%--
  Created by IntelliJ IDEA.
  User: juhi
  Date: 15.11.2020
  Time: 12.55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="ui fixed inverted menu">
    <div class="ui container">
        <a class="item" href="${pageContext.request.contextPath}/">Home</a>
        <a class="item" href="${pageContext.request.contextPath}/cottages">Cottages</a>
        <div class="right menu">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name == null}">
                <div class="item">
                    <a href="${pageContext.request.contextPath}/login" class="">Sign in</a>
                </div>
                <div class="item">
                    <a href="${pageContext.request.contextPath}/register" class="">Sign up</a>
                </div>
            </c:when>
            <c:when test="${pageContext.request.isUserInRole('ADMIN')}">
                <a class="item" href="${pageContext.request.contextPath}/admin">
                    Admin Panel
                </a>
                <a onclick="document.getElementById('logout-form').submit();" class="item">Logout</a>
                <form id="logout-form" action="${pageContext.request.contextPath}/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </c:when>
            <c:otherwise>
                <a class="item" href="${pageContext.request.contextPath}/user/${pageContext.request.userPrincipal.name}">
                    Profile
                </a>
                <a onclick="document.getElementById('logout-form').submit();" class="item">Logout</a>
                <form id="logout-form" action="${pageContext.request.contextPath}/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </c:otherwise>
        </c:choose>
        </div>
    </div>
</div>
