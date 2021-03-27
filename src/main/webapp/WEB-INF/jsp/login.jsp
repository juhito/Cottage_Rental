<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

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
                    Log-in to your account
                </div>
            </h2>
            <form class="ui large form" action="perform_login" method="post">
                <div class="ui stacked segment">
                    <c:if test="${param.error != null}">
                        <div class="ui error message" style="display: block">
                            <div class="header">Your login attempt was not successful</div>
                            <p>${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
                        </div>
                    </c:if>
                    <div class="field">
                        ${error}
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
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="ui fluid large blue submit button">login</button>
                </div>
            </form>

            <div class="ui message">
                New to us? <a href="${pageContext.request.contextPath}/register">Sign up</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
</body>
</html>