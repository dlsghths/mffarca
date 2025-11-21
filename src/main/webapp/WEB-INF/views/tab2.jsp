<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<jsp:useBean id="pageName" scope="request" class="java.lang.String"/>
<% request.setAttribute("pageName", "tab2"); %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<h2>영웅 그룹 사용 횟수</h2>

<form method="get" action="">
    <!-- 숨겨진 sort 값 (기본: name) -->
    <input type="hidden" name="sort" id="sortInput" value="${param.sort != null ? param.sort : 'name'}" />

    <!-- 정렬 버튼 -->
    <button type="button" class="sort-btn ${param.sort == 'name' || param.sort == null ? 'sort-selected' : ''}"
            onclick="setSort('name', event)">한글 이름 순</button>
    <button type="button" class="sort-btn ${param.sort == 'count' ? 'sort-selected' : ''}"
            onclick="setSort('count', event)">사용 횟수 순</button>

    <!-- CTP 체크박스 -->
    <div style="margin-top:10px;">
        <label>CTP 선택:</label><br/>
        <div style="display:flex; gap:10px; flex-wrap:wrap; margin-top:5px;">
            <c:set var="ctpList" value="${param.ctpList}" />

            <label>
                <input type="checkbox" name="ctpList" value="전체" id="ctpAll"
                    <c:if test="${ctpList == null || fn:contains(ctpList, '전체')}">checked</c:if>>
                전체
            </label>

            <label><input type="checkbox" name="ctpList" value="경쟁" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '경쟁')}">checked</c:if>>경쟁</label>
            <label><input type="checkbox" name="ctpList" value="분노" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '분노')}">checked</c:if>>분노</label>
            <label><input type="checkbox" name="ctpList" value="통찰" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '통찰')}">checked</c:if>>통찰</label>
            <label><input type="checkbox" name="ctpList" value="격동" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '격동')}">checked</c:if>>격동</label>
            <label><input type="checkbox" name="ctpList" value="해방" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '해방')}">checked</c:if>>해방</label>
            <label><input type="checkbox" name="ctpList" value="심판" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '심판')}">checked</c:if>>심판</label>
            <label><input type="checkbox" name="ctpList" value="권능" class="ctpItem"
                <c:if test="${ctpList != null && fn:contains(ctpList, '권능')}">checked</c:if>>권능</label>
        </div>
    </div>

    <!-- 조회 버튼 -->
    <button type="submit" style="margin-top:10px;">조회</button>
</form>

<!-- 테이블 출력 -->
<table border="1" cellspacing="0" cellpadding="5" style="margin-top:10px;">
    <thead>
        <tr>
            <th>이미지</th>
            <th>영웅 이름</th>
            <th>CTP</th>
            <th>사용 횟수</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="row" items="${heroGroupCountList}">
            <tr>
                <td>
                    <img src="${ctx}/resources/images/hero/${row.group_name_eng}.png"
                         style="width:50px;height:50px;background-color:#${row.color}; cursor:pointer;"
                          onclick="gotoHero(${row.group_idx})"/>
                </td>
                <td>${row.group_name_kor}</td>
                <td>${row.ctp_name}</td>
                <td>${row.use_cnt}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    // 정렬 버튼 클릭
    function setSort(value, event) {
        document.getElementById('sortInput').value = value;
        document.querySelectorAll('.sort-btn').forEach(btn => btn.classList.remove('sort-selected'));
        event.currentTarget.classList.add('sort-selected');
    }

    document.addEventListener('DOMContentLoaded', function() {
    	 const ctpAll = document.getElementById('ctpAll');         // 전체 체크박스
    	    const ctpItems = document.querySelectorAll('.ctpItem');   // 개별 체크박스(기존 형식 유지)

    	    // 전체 선택 시 → 개별 모두 해제 & 전체만 체크
    	    ctpAll.addEventListener('change', function() {
    	        if (this.checked) {
    	            ctpItems.forEach(item => item.checked = false);
    	        }
    	    });

    	    // 개별 선택 시 → 전체 해제 + 다른 개별도 모두 해제 후 자기 자신만 체크
    	    ctpItems.forEach(item => {
    	        item.addEventListener('change', function() {

    	            if (this.checked) {
    	                // 전체 체크박스 해제
    	                ctpAll.checked = false;

    	                // 다른 개별 체크박스 해제
    	                ctpItems.forEach(other => {
    	                    if (other !== this) other.checked = false;
    	                });
    	            }

    	            // 만약 모든 체크박스 해제된 경우 → 전체 자동 체크
    	            const anyChecked = Array.from(ctpItems).some(c => c.checked);
    	            if (!anyChecked && !ctpAll.checked) {
    	                ctpAll.checked = true;
    	            }
    	        });
    	    });
    });
    
    function gotoHero(heroId) {
        window.location.href = "${ctx}/tab1?focusHero=" + heroId;
    }
</script>

<style>
    .sort-btn {
        padding: 5px 10px;
        margin-right: 5px;
        cursor: pointer;
    }
    .sort-selected {
        background-color: #4CAF50;
        color: white;
    }
</style>