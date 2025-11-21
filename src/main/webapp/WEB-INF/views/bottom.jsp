<%@ page contentType="text/html; charset=UTF-8" %>
<div class="flex-container">
    <!-- ABX TABLE -->
    <div class="flex-item">
        <h2>ABX</h2>
        <table border="1" class="combo-table">
            <thead>
                <tr>
		            <th style="width:10%;">타입</th>
		            <th style="width:25%;">조건</th>
		            <th style="width:15%;">LEFT</th>
		            <th style="width:15%;">LEADER</th>
		            <th style="width:15%;">RIGHT</th>
		            <th style="width:20%;">비고</th>
        		</tr>
            </thead>
            <tbody>
            <c:forEach var="day" begin="1" end="${maxDay}">
                <c:set var="slot1" value="" />
                <c:set var="slot2" value="" />
                <c:set var="slot3" value="" />
                <c:set var="slot1Color" value="FFFFFF" />
                <c:set var="slot2Color" value="FFFFFF" />
                <c:set var="slot3Color" value="FFFFFF" />
                <c:set var="slot1Group" value="" />
                <c:set var="slot2Group" value="" />
                <c:set var="slot3Group" value="" />
                <c:set var="condition" value="" />
                <c:set var="abxNote" value="" />
                <c:forEach var="s" items="${settings}">
                    <c:if test="${s.day == day && s.type == 'ABX'}">
                        <c:choose>
                            <c:when test="${s.slot == 1}">
                                <c:set var="slot1" value="${s.name}" />
                                <c:set var="slot1Group" value="${s.groupIdx}" />
                                <c:set var="slot1Color" value="${s.color}" />
                                <c:set var="condition" value="${s.attributeList}" />
                                <c:set var="abxNote" value="${s.note}" />
                            </c:when>
                            <c:when test="${s.slot == 2}">
                                <c:set var="slot2" value="${s.name}" />
                                <c:set var="slot2Group" value="${s.groupIdx}" />
                                <c:set var="slot2Color" value="${s.color}" />
                            </c:when>
                            <c:when test="${s.slot == 3}">
                                <c:set var="slot3" value="${s.name}" />
                                <c:set var="slot3Group" value="${s.groupIdx}" />
                                <c:set var="slot3Color" value="${s.color}" />
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>
                <tr>
                    <td>${day}</td>
                    <td>
                        <c:forEach var="attr" items="${condition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png" style="background-color:000000;"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';" />
                        </c:forEach>
                    </td>
                    <td><img src="${ctx}/resources/images/hero/${slot1}.png" style="background-color:#${slot1Color};" class="<c:if test='${slot1Group  == focusGroup}'>focus-hero</c:if>"/></td>
                    <td><img src="${ctx}/resources/images/hero/${slot2}.png" style="background-color:#${slot2Color};" class="<c:if test='${slot2Group  == focusGroup}'>focus-hero</c:if>"/></td>
                    <td><img src="${ctx}/resources/images/hero/${slot3}.png" style="background-color:#${slot3Color};" class="<c:if test='${slot3Group  == focusGroup}'>focus-hero</c:if>"/></td>
                    <td>${abxNote}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="flex-item">
        <h2>ABXL</h2>
        <table border="1" class="combo-table">
            <thead>
                <tr>
		            <th style="width:10%;">타입</th>
		            <th style="width:25%;">조건</th>
		            <th style="width:15%;">LEFT</th>
		            <th style="width:15%;">LEADER</th>
		            <th style="width:15%;">RIGHT</th>
		            <th style="width:20%;">비고</th>
        		</tr>
            </thead>
            <tbody>
            <c:forEach var="day" begin="1" end="${maxDay}">
                <c:set var="slot1" value="" />
                <c:set var="slot2" value="" />
                <c:set var="slot3" value="" />
                <c:set var="slot1Color" value="FFFFFF" />
                <c:set var="slot2Color" value="FFFFFF" />
                <c:set var="slot3Color" value="FFFFFF" />
                <c:set var="slot1Group" value="" />
                <c:set var="slot2Group" value="" />
                <c:set var="slot3Group" value="" />
                <c:set var="condition" value="" />
				<c:set var="abxlNote" value="${s.note}" />
                <c:forEach var="s" items="${settings}">
                    <c:if test="${s.day == day && s.type == 'ABXL'}">
                        <c:choose>
                            <c:when test="${s.slot == 1}">
                                <c:set var="slot1" value="${s.name}" />
                                <c:set var="slot1Group" value="${s.groupIdx}" />
                                <c:set var="slot1Color" value="${s.color}" />
                                <c:set var="condition" value="${s.attributeList}" />
                                <c:set var="abxlNote" value="${s.note}" />
                            </c:when>
                            <c:when test="${s.slot == 2}">
                                <c:set var="slot2" value="${s.name}" />
                                <c:set var="slot2Group" value="${s.groupIdx}" />
                                <c:set var="slot2Color" value="${s.color}" />
                            </c:when>
                            <c:when test="${s.slot == 3}">
                                <c:set var="slot3" value="${s.name}" />
                                <c:set var="slot3Group" value="${s.groupIdx}" />
                                <c:set var="slot3Color" value="${s.color}" />
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>
                <tr>
                    <td>${day}</td>
                    <td>
                        <c:forEach var="attr" items="${condition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png" style="background-color:000000;"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';"/>
                        </c:forEach>
                    </td>
                    <td><img src="${ctx}/resources/images/hero/${slot1}.png" style="background-color:#${slot1Color};" class="<c:if test='${slot1Group  == focusGroup}'>focus-hero</c:if>"/></td>
                    <td><img src="${ctx}/resources/images/hero/${slot2}.png" style="background-color:#${slot2Color};" class="<c:if test='${slot2Group  == focusGroup}'>focus-hero</c:if>"/></td>
                    <td><img src="${ctx}/resources/images/hero/${slot3}.png" style="background-color:#${slot3Color};" class="<c:if test='${slot3Group  == focusGroup}'>focus-hero</c:if>"/></td>
                    <td>${abxlNote}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>