<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<jsp:useBean id="pageName" scope="request" class="java.lang.String"/>

<c:set var="maxDay" value="28" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<%@ include file="top.jsp" %>

<%@ include file="bottom.jsp" %>

<!-- 공통 CSS -->
<style>
    img {
        border: 0.1px solid black;
        width: 60px;
        style="background-color:000000;"
    }

    .flex-container {
        display: flex;
        gap: 20px;
        justify-content: space-between;
    }

    .flex-item {
        flex: 1;
    }

    .combo-table {
        border-collapse: collapse;
        width: 100%;
        text-align: center;
        margin-bottom: 20px;
    }
       /* 클릭된 영웅 강조 테두리 */
    .focus-hero {
        border: 3px solid yellow;
        border-radius: 5px;
    }
</style>
