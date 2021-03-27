<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin | Users</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />
    <div class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column" id="content">
        <div class="ui padded grid">
            <div class="row">
                <h1 class="ui huge dividing header">Active Users</h1>
                <table class="ui compact celled table">
                    <thead class="full-width">
                    <tr>
                        <th>Username</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Enabled</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="formCount" value="0" scope="session"></c:set>
                    <c:forEach var="r" items="${users}" varStatus="status">
                        <tr>
                            <td>${r.username}</td>
                            <td>${r.name}</td>
                            <td>${r.email}</td>
                            <td>${r.userRoleByUserId.rolesByRoleId.role}</td>
                            <td>${r.enabled}</td>
                            <td class="collapsing">
                                <c:choose>
                                    <c:when test="${r.enabled == 1}">
                                        <button onclick="document.getElementById('toggle-user-form-${formCount}').submit();"
                                                class="ui fitted yellow button">Disable</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button onclick="document.getElementById('toggle-user-form-${formCount}').submit();"
                                                class="ui fitted green button">Enable</button>
                                    </c:otherwise>
                                </c:choose>
                                <form style="display: none" id="toggle-user-form-${formCount}" action="users/toggle" method="post">
                                    <input type="hidden" name="userId" value="${r.userId}" />
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                                <button onclick="document.getElementById('delete-user-form-${formCount}').submit();"
                                        class="ui fitted red button">Delete</button>
                                <form style="display: none" id="delete-user-form-${formCount}" action="users/delete" method="post">
                                    <input type="hidden" name="deleteUserId" value="${r.userId}" />
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </td>
                        </tr>
                        <c:set var="formCount" value="${formCount + 1}" scope="session"></c:set>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/js/oma.js"></script>
</body>
</html>