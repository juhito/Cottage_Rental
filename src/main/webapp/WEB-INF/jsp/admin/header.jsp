<%--
  Created by IntelliJ IDEA.
  User: juhi
  Date: 27.11.2020
  Time: 11.10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="ui tablet computer only padded grid">
    <div class="ui inverted borderless top fixed fluid menu">
        <a class="header item">Dashboard</a>
        <div class="right menu">
            <div class="item">
                <div class="ui small input">
                    <input placeholder="Search..." />
                </div>
            </div>
            <a class="item">Settings</a>
            <a class="item">Profile</a>
            <a href="../" class="item">Back to site</a>
        </div>
    </div>
</div>
<div class="ui mobile only padded grid">
    <div class="ui top fixed borderless fluid inverted menu">
        <a class="header item">Dashboard</a>
        <div class="right menu">
            <div class="item">
                <button class="ui icon toggle basic inverted button">
                    <i class="content icon"></i>
                </button>
            </div>
        </div>
        <div class="ui vertical borderless inverted fluid menu">
            <a class="item">Settings</a>
            <a class="item">Profile</a>
            <a href="../" class="item">Back to site</a>
            <div class="ui fitted divider"></div>
            <div class="item">
                <div class="ui small input">
                    <input placeholder="Search..." />
                </div>
            </div>
        </div>
    </div>
</div>
<div class="ui padded grid">
    <div class="three wide tablet only three wide computer only column" id="sidebar">
        <div class="ui vertical borderless fluid text menu">
            <a href="${pageContext.request.contextPath}/admin" class="item">Overview</a>
            <div class="ui divider"></div>
            <a href="${pageContext.request.contextPath}/admin/users" class="item">Users</a>
            <a href="${pageContext.request.contextPath}/admin/reservations" class="item">Reservations</a>
            <div class="ui divider"></div>
            <a href="${pageContext.request.contextPath}/admin/cottages" class="item">Cottages</a>
            <a href="${pageContext.request.contextPath}/admin/cottages/add" class="item">Add Cottage</a>
        </div>
    </div>
</div>
