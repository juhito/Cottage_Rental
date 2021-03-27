<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add new cottage</title>

    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
<c:import url="header.jsp" charEncoding="utf-8" />

<div class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column" id="content">
    <div class="ui padded grid">
        <div class="row">
            <h1 class="ui huge dividing header">Add new cottage</h1>
            <form class="ui large form" action="add" method="post">
                <div class="fields">
                    <div class="six wide field">
                        <label>Cottage Name</label>
                        <input type="text" name="name" placeholder="Cottage name" required>
                    </div>
                    <div class="six wide field">
                        <label>Location</label>
                        <input type="text" name="location" placeholder="Cottage location" required>
                    </div>
                </div>
                <div class="fields">
                    <div class="twelve wide field">
                        <label>Description</label>
                        <textarea name="description" rows="2"></textarea>
                    </div>
                </div>
                <div class="fields">
                    <div class="four wide field">
                        <label>Area (m²)</label>
                        <input type="text" name="area" placeholder="200" required>
                    </div>
                    <div class="four wide field">
                        <label>People</label>
                        <input type="text" name="peopleSize" placeholder="5" required>
                    </div>
                    <div class="four wide field">
                        <label>Price</label>
                        <input type="text" name="price" placeholder="100" required>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <button type="submit" class="ui large blue submit button">Add</button>
            </form>
        </div>
    </div>
</div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/js/oma.js"></script>
</body>

</html>