<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>오늘 조합 <span style="color: red">"${combToday}일차"</span></h2>

<p></p>
<!-- 초기값 설정 -->
<c:set var="abxSlot1" value="" />
<c:set var="abxSlot2" value="" />
<c:set var="abxSlot3" value="" />
<c:set var="abxColor1" value="FFFFFF" />
<c:set var="abxColor2" value="FFFFFF" />
<c:set var="abxColor3" value="FFFFFF" />
<c:set var="abxslot1Group" value="" />
<c:set var="abxslot2Group" value="" />
<c:set var="abxslot3Group" value="" />
<c:set var="abxCond" value="" />
<c:set var="abxNote" value="" />
<c:set var="abxslot1Ctp" value="" />
<c:set var="abxslot2Ctp" value="" />
<c:set var="abxslot3Ctp" value="" />

<c:set var="abxlSlot1" value="" />
<c:set var="abxlSlot2" value="" />
<c:set var="abxlSlot3" value="" />
<c:set var="abxlColor1" value="FFFFFF" />
<c:set var="abxlColor2" value="FFFFFF" />
<c:set var="abxlColor3" value="FFFFFF" />
<c:set var="abxlslot1Group" value="" />
<c:set var="abxlslot2Group" value="" />
<c:set var="abxlslot3Group" value="" />
<c:set var="abxlCond" value="" />
<c:set var="abxlNote" value="" />
<c:set var="abxlslot1Ctp" value="" />
<c:set var="abxlslot2Ctp" value="" />
<c:set var="abxlslot3Ctp" value="" />

<!-- 오늘 날짜 데이터 추출 -->
<c:forEach var="s" items="${settings}">
    <c:if test="${s.day == combToday}">
        <c:choose>
            <c:when test="${s.type == 'ABX'}">
                <c:choose>
                    <c:when test="${s.slot == 1}">
                        <c:set var="abxSlot1" value="${s.name}" />
                        <c:set var="abxslot1Group" value="${s.groupIdx}" />
                        <c:set var="abxColor1" value="${s.color}" />
                        <c:set var="abxCond" value="${s.attributeList}" />
                        <c:set var="abxNote" value="${s.note}" />
                        <c:set var="abxslot1Ctp" value="${s.ctpNameEng}" />
                    </c:when>
                    <c:when test="${s.slot == 2}">
                        <c:set var="abxSlot2" value="${s.name}" />
                        <c:set var="abxslot2Group" value="${s.groupIdx}" />
                        <c:set var="abxColor2" value="${s.color}" />
                        <c:set var="abxslot2Ctp" value="${s.ctpNameEng}" />
                    </c:when>
                    <c:when test="${s.slot == 3}">
                        <c:set var="abxSlot3" value="${s.name}" />
                        <c:set var="abxslot3Group" value="${s.groupIdx}" />
                        <c:set var="abxColor3" value="${s.color}" />
                        <c:set var="abxslot3Ctp" value="${s.ctpNameEng}" />
                    </c:when>
                </c:choose>
            </c:when>
            <c:when test="${s.type == 'ABXL'}">
                <c:choose>
                    <c:when test="${s.slot == 1}">
                        <c:set var="abxlSlot1" value="${s.name}" />
                        <c:set var="abxlslot1Group" value="${s.groupIdx}" />
                        <c:set var="abxlColor1" value="${s.color}" />
                        <c:set var="abxlCond" value="${s.attributeList}" />
                        <c:set var="abxlNote" value="${s.note}" />
                        <c:set var="abxlslot1Ctp" value="${s.ctpNameEng}" />
                    </c:when>
                    <c:when test="${s.slot == 2}">
                        <c:set var="abxlSlot2" value="${s.name}" />
                        <c:set var="abxlslot2Group" value="${s.groupIdx}" />
                        <c:set var="abxlColor2" value="${s.color}" />
                        <c:set var="abxlslot2Ctp" value="${s.ctpNameEng}" />
                    </c:when>
                    <c:when test="${s.slot == 3}">
                        <c:set var="abxlSlot3" value="${s.name}" />
                        <c:set var="abxlslot3Group" value="${s.groupIdx}" />
                        <c:set var="abxlColor3" value="${s.color}" />
                        <c:set var="abxlslot3Ctp" value="${s.ctpNameEng}" />
                    </c:when>
                </c:choose>
            </c:when>

        </c:choose>
    </c:if>
</c:forEach>

<!-- 오늘 조합 출력 -->
<table border="1" class="combo-table">
    <thead>
        <tr>
            <th style="width:10%;">타입</th>
            <th style="width:20%;">조건</th>
            <th style="width:15%;">LEFT</th>
            <th style="width:15%;">LEADER</th>
            <th style="width:15%;">RIGHT</th>
            <th style="width:25%;">비고</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ABX</td>
            <td>
                <c:forEach var="attr" items="${abxCond}">
                    <img src="${ctx}/resources/images/attribute/${attr}.png" style="background-color:000000;"
                         onerror="this.src='${ctx}/resources/images/attribute/Free.png'" />
                </c:forEach>
            </td>
            <td>
            	<div class="hero-ctp-wrapper <c:if test='${abxslot1Group  == focusGroup}'> focus-hero</c:if>">
            		<img src="${ctx}/resources/images/hero/${abxSlot1}.png" style="background-color:#${abxColor1};"
            			data-hero="${abxSlot1}" class="hero-img <c:if test='${abxslot1Group  == focusGroup}'>focus-hero</c:if>"/>
            		<c:if test="${not empty abxslot1Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxslot1Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
            	</div>
            </td>	
            
            <td>
            	<div class="hero-ctp-wrapper <c:if test='${abxslot2Group  == focusGroup}'> focus-hero</c:if>">
            		<img src="${ctx}/resources/images/hero/${abxSlot2}.png" style="background-color:#${abxColor2};"
            			data-hero="${abxSlot2}" class="hero-img <c:if test='${abxslot2Group  == focusGroup}'>focus-hero</c:if>"/>
            		<c:if test="${not empty abxslot2Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxslot2Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
            	</div>
            </td>
            <td>
            	<div class="hero-ctp-wrapper <c:if test='${abxslot3Group  == focusGroup}'> focus-hero</c:if>">
            		<img src="${ctx}/resources/images/hero/${abxSlot3}.png" style="background-color:#${abxColor3};"
            			data-hero="${abxSlot3}" class="hero-img <c:if test='${abxslot3Group  == focusGroup}'>focus-hero</c:if>"/>
            		<c:if test="${not empty abxslot3Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxslot3Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
            	</div>
            </td>
            <td>${abxNote}</td>
        </tr>
        <tr>
            <td>ABXL</td>
            <td>
                <c:forEach var="attr" items="${abxlCond}">
                    <img src="${ctx}/resources/images/attribute/${attr}.png" style="background-color:000000;"
                         onerror="this.src='${ctx}/resources/images/attribute/Free.png'" />
                </c:forEach>
            </td>
            <td>
            	<div class="hero-ctp-wrapper <c:if test='${abxlslot1Group  == focusGroup}'> focus-hero</c:if>">
            		<img src="${ctx}/resources/images/hero/${abxlSlot1}.png" style="background-color:#${abxlColor1};"
            			data-hero="${abxlSlot1}" class="hero-img <c:if test='${abxlslot1Group  == focusGroup}'>focus-hero</c:if>"/>
            		<c:if test="${not empty abxlslot1Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxlslot1Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
            	</div>
            </td>
            <td>
            	<div class="hero-ctp-wrapper <c:if test='${abxlslot2Group  == focusGroup}'> focus-hero</c:if>">
            		<img src="${ctx}/resources/images/hero/${abxlSlot2}.png" style="background-color:#${abxlColor2};"
            			data-hero="${abxlSlot2}" class="hero-img <c:if test='${abxlslot2Group  == focusGroup}'>focus-hero</c:if>"/>
            		<c:if test="${not empty abxlslot2Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxlslot2Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
            	</div>
            </td>
            <td>
            	<div class="hero-ctp-wrapper <c:if test='${abxlslot3Group  == focusGroup}'> focus-hero</c:if>">
            		<img src="${ctx}/resources/images/hero/${abxlSlot3}.png" style="background-color:#${abxlColor3};"
            			data-hero="${abxlSlot3}" class="hero-img <c:if test='${abxlslot3Group  == focusGroup}'>focus-hero</c:if>"/>
            		<c:if test="${not empty abxlslot3Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxlslot3Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
            	</div>
            </td>
            <td>${abxlNote}</td>
        </tr>

    </tbody>
</table>
