<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
    .tab-container {
        display: flex;
        background: #f1f1f1;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    .tab {
        padding: 10px 20px;
        margin-right: 10px;
        background: #e0e0e0;
        cursor: pointer;
        border-radius: 4px;
        text-decoration: none;
        color: black;
    }

    .tab.active {
        background: #4285f4;
        color: white;
        font-weight: bold;
    }
</style>

<div class="tab-container">
    <a href="${pageContext.request.contextPath}/tab1"
       class="tab ${pageName eq 'tab1' ? 'active' : ''}">조합확인</a>
    <a href="${pageContext.request.contextPath}/tab2"
       class="tab ${pageName eq 'tab2' ? 'active' : ''}">영웅세팅</a>
    <a href="${pageContext.request.contextPath}/tab3"
       class="tab ${pageName eq 'tab3' ? 'active' : ''}">아레나</a>
</div>
