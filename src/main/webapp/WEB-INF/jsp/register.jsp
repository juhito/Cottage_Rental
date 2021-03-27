<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />

<div class="ui container" style="padding-top: 7em;">
    <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui black header">
                <div class="content">
                    Register a new account
                </div>
            </h2>
            <form class="ui large form" action="register" method="post" autocomplete="off">
                <div class="ui stacked segment">
                    <c:if test="${errors.hasErrors()}">
                        <div class="ui error message" style="display: block">
                            <div class="header">${errors.fieldErrors.get(0).code}</div>
                            <p>${errors.fieldErrors.get(0).defaultMessage}</p>
                        </div>
                    </c:if>
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="address card outline icon"></i>
                            <input type="text" name="name" placeholder="Name" required>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="user icon"></i>
                            <input type="text" name="username" placeholder="Username" required>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="lock icon"></i>
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="lock icon"></i>
                            <input type="password" name="confirmPassword" placeholder="Password again" required>
                        </div>
                    </div>

                    <div class="field">
                        <div class="ui left icon input">
                            <i class="mail icon"></i>
                            <input type="email" name="email" placeholder="Email" required>
                        </div>
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="ui fluid large blue submit button">Register</button>
                </div>
            </form>

            <div class="ui message">
                Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in!</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
</body>
</html>