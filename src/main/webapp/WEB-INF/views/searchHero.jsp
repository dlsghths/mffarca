<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>영웅 검색</title>
    <style>
        .search-box {
            margin: 20px;
        }

        .hero-card {
            width: 300px;
            padding: 15px;
            margin: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            display: flex;
            align-items: center;
        }

        .hero-card img {
            width: 80px;
            height: 80px;
            border-radius: 6px;
            margin-right: 15px;
            border: 1px solid #ccc;
        }

        .hero-info {
            font-size: 14px;
        }

        .edit-btn {
            margin-top: 5px;
            padding: 5px 12px;
            background: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="search-box">
    <form action="${pageContext.request.contextPath}/hero/search" method="GET">
        <input type="text" name="keyword" id="keywordInput" placeholder="영웅 이름 검색" style="width:200px; height:25px;"
               value="${param.keyword != null ? param.keyword : ''}">
        <button type="submit">검색</button>
    </form>
</div>

<hr>
	<c:if test="${not empty heroList}">
	   <c:forEach var="hero" items="${heroList}">
	       <div class="hero-card" style="width: 30%;">
	           <img src="${ctx}/resources/images/hero/${hero.name_eng}.png"
	                        style="width:50px;height:50px;background-color:#${hero.color};" />
				<div>현재 CTP: <b>${hero.ctp_name != null ? hero.ctp_name : '없음'}</b></div>
				<div style="width: 50px;"></div>
	           <div class="hero-info">
	           <div><b>${hero.name_kor}</b> (${hero.name_eng})</div>
	
	           <form action="${pageContext.request.contextPath}/hero/updateCtp" method="POST">
	               <input type="hidden" name="heroId" value="${hero.id}">
	               <input type="hidden" name="keyword" value="${param.keyword}">
	               
	               <select name="ctpId" style="width:150px; height:28px;">
	                   <c:forEach var="ctp" items="${ctpList}">
	                       <option value="${ctp.id}" ${ctp.id == hero.ctp_id ? 'selected' : ''}>
	                           ${ctp.name}
	                       </option>
	                   </c:forEach>
	               </select>
	
	               <button type="submit" class="edit-btn">저장</button>
	           </form>
	       </div>
	       </div>
	   </c:forEach>
	</c:if>
</body>

</html>
<script>
    // 페이지 로드 후 검색창에 자동 포커스
    window.onload = function() {
        var input = document.getElementById("keywordInput");
        if(input) {
            input.focus();
            input.select(); // 기존 내용 선택
        }
    };
</script>
