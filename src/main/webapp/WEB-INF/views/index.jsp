<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
</head>
<body>

    <!-- 상단 탭 헤더 -->
    <jsp:include page="common/header.jsp" />

    <!-- 탭 내용 -->
    <div style="padding:20px;">
        <c:choose>
            <c:when test="${pageName eq 'tab1'}">
                <jsp:include page="tab1.jsp" />
            </c:when>
            <c:when test="${pageName eq 'tab2'}">
                <jsp:include page="tab2.jsp" />
            </c:when>
        </c:choose>
    </div>

</body>
</html>
