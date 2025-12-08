<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1" class="combo-table">
    <thead>
        <tr>
            <th rowspan="2" style="width:5%;">타입</th>
            <th colspan="5" style="width:45%;">ABX</th>
            <th colspan="5" style="width:45%;">ABXL</th>
        </tr>
        <tr>
            <th style="width:10%;">조건</th>
            <th style="width:7%;">LEFT</th>
            <th style="width:7%;">LEADER</th>
            <th style="width:7%;">RIGHT</th>
            <th style="width:14%;">비고</th>

            <th style="width:10%;">조건</th>
            <th style="width:7%;">LEFT</th>
            <th style="width:7%;">LEADER</th>
            <th style="width:7%;">RIGHT</th>
            <th style="width:14%;">비고</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="day" begin="1" end="${maxDay}">
        <c:set var="abxSlot1" value="" />
        <c:set var="abxSlot2" value="" />
        <c:set var="abxSlot3" value="" />
        <c:set var="abxSlot1Color" value="FFFFFF" />
        <c:set var="abxSlot2Color" value="FFFFFF" />
        <c:set var="abxSlot3Color" value="FFFFFF" />
        <c:set var="abxSlot1Group" value="" />
        <c:set var="abxSlot2Group" value="" />
        <c:set var="abxSlot3Group" value="" />
        <c:set var="abxCondition" value="" />
        <c:set var="abxNote" value="" />
        <c:set var="abxSlot1Ctp" value="" />
        <c:set var="abxSlot2Ctp" value="" />
        <c:set var="abxSlot3Ctp" value="" />

        <!-- ABXL 변수 초기화 -->
        <c:set var="abxlSlot1" value="" />
        <c:set var="abxlSlot2" value="" />
        <c:set var="abxlSlot3" value="" />
        <c:set var="abxlSlot1Color" value="FFFFFF" />
        <c:set var="abxlSlot2Color" value="FFFFFF" />
        <c:set var="abxlSlot3Color" value="FFFFFF" />
        <c:set var="abxlSlot1Group" value="" />
        <c:set var="abxlSlot2Group" value="" />
        <c:set var="abxlSlot3Group" value="" />
        <c:set var="abxlCondition" value="" />
        <c:set var="abxlNote" value="" />
        <c:set var="abxlSlot1Ctp" value="" />
        <c:set var="abxlSlot2Ctp" value="" />
        <c:set var="abxlSlot3Ctp" value="" />

        <c:forEach var="s" items="${settings}">
            <c:if test="${s.day == day}">
                <c:choose>
                    <c:when test="${s.type == 'ABX'}">
                        <c:choose>
                            <c:when test="${s.slot == 1}">
                                <c:set var="abxSlot1" value="${s.name}" />
                                <c:set var="abxSlot1Group" value="${s.groupIdx}" />
                                <c:set var="abxSlot1Color" value="${s.color}" />
                                <c:set var="abxCondition" value="${s.attributeList}" />
                                <c:set var="abxNote" value="${s.note}" />
                                <c:set var="abxSlot1Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 2}">
                                <c:set var="abxSlot2" value="${s.name}" />
                                <c:set var="abxSlot2Group" value="${s.groupIdx}" />
                                <c:set var="abxSlot2Color" value="${s.color}" />
                                <c:set var="abxSlot2Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 3}">
                                <c:set var="abxSlot3" value="${s.name}" />
                                <c:set var="abxSlot3Group" value="${s.groupIdx}" />
                                <c:set var="abxSlot3Color" value="${s.color}" />
                                <c:set var="abxSlot3Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                        </c:choose>
                    </c:when>
                    <c:when test="${s.type == 'ABXL'}">
                        <c:choose>
                            <c:when test="${s.slot == 1}">
                                <c:set var="abxlSlot1" value="${s.name}" />
                                <c:set var="abxlSlot1Group" value="${s.groupIdx}" />
                                <c:set var="abxlSlot1Color" value="${s.color}" />
                                <c:set var="abxlCondition" value="${s.attributeList}" />
                                <c:set var="abxlNote" value="${s.note}" />
                                <c:set var="abxlSlot1Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 2}">
                                <c:set var="abxlSlot2" value="${s.name}" />
                                <c:set var="abxlSlot2Group" value="${s.groupIdx}" />
                                <c:set var="abxlSlot2Color" value="${s.color}" />
                                <c:set var="abxlSlot2Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 3}">
                                <c:set var="abxlSlot3" value="${s.name}" />
                                <c:set var="abxlSlot3Group" value="${s.groupIdx}" />
                                <c:set var="abxlSlot3Color" value="${s.color}" />
                                <c:set var="abxlSlot3Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                        </c:choose>
                    </c:when>
                </c:choose>
            </c:if>
        </c:forEach>
        <c:choose>
            <c:when test="${day == 2
                           and abxSlot1 == abxlSlot1
                           and abxSlot2 == abxlSlot2
                           and abxSlot3 == abxlSlot3
                           and abxNote == abxlNote}">
                <tr>
                    <td>${day}</td>
                    <td class="attr-cell">
                        <c:forEach var="attr" items="${abxCondition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png"
                                 class="attr-img"
                                 style="background-color:#000000;"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';" />
                        </c:forEach>
                    </td>
                    <td colspan="9" class="abx-cell">
                    	<div>
					        <div style="width: 50%;" class="hero-ctp-wrapper<c:if test='${abxSlot1Group == focusGroup}'> focus-hero</c:if>">
					            <img src="${ctx}/resources/images/hero/${abxSlot1}.png"
					                 style="background-color:#${abxSlot1Color};"
					                 data-hero="${abxSlot1}"
					                 class="hero-img" />
					            <c:if test="${not empty abxSlot1Ctp}">
					                <img src="${ctx}/resources/images/ctp/${abxSlot1Ctp}.png"
					                     class="ctp-img" />
					            </c:if>
					        </div>
					
					        <div style="width: 50%;" class="hero-ctp-wrapper<c:if test='${abxSlot2Group == focusGroup}'> focus-hero</c:if>">
					            <img src="${ctx}/resources/images/hero/${abxSlot2}.png"
					                 style="background-color:#${abxSlot2Color};"
					                 data-hero="${abxSlot2}"
					                 class="hero-img" />
					            <c:if test="${not empty abxSlot2Ctp}">
					                <img src="${ctx}/resources/images/ctp/${abxSlot2Ctp}.png"
					                     class="ctp-img" />
					            </c:if>
					        </div>
					
					        <div style="width: 50%;" class="hero-ctp-wrapper<c:if test='${abxSlot3Group == focusGroup}'> focus-hero</c:if>">
					            <img src="${ctx}/resources/images/hero/${abxSlot3}.png"
					                 style="background-color:#${abxSlot3Color};"
					                 data-hero="${abxSlot3}"
					                 class="hero-img" />
					            <c:if test="${not empty abxSlot3Ctp}">
					                <img src="${ctx}/resources/images/ctp/${abxSlot3Ctp}.png"
					                     class="ctp-img" />
					            </c:if>
					        </div>
					
					        <div style="width: 100%;" class="hero-note">
					            ${abxNote}
					        </div>
				    	</div>
					</td>
                </tr>
            </c:when>

            <c:otherwise>
                <tr>
                    <td>${day}</td>

                    <td class="attr-cell">
                        <c:forEach var="attr" items="${abxCondition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png"
                                 class="attr-img"
                                 style="background-color:#000000;"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';" />
                        </c:forEach>
                    </td>

                    <td>
                        <div class="hero-ctp-wrapper<c:if test='${abxSlot1Group == focusGroup}'> focus-hero</c:if>">
                            <img src="${ctx}/resources/images/hero/${abxSlot1}.png"
                                 style="background-color:#${abxSlot1Color};"
                                 data-hero="${abxSlot1}"
                                 class="hero-img" />
                            <c:if test="${not empty abxSlot1Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxSlot1Ctp}.png"
                                     class="ctp-img" />
                            </c:if>
                        </div>
                    </td>

                    <td>
                        <div class="hero-ctp-wrapper<c:if test='${abxSlot2Group == focusGroup}'> focus-hero</c:if>">
                            <img src="${ctx}/resources/images/hero/${abxSlot2}.png"
                                 style="background-color:#${abxSlot2Color};"
                                 data-hero="${abxSlot2}"
                                 class="hero-img" />
                            <c:if test="${not empty abxSlot2Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxSlot2Ctp}.png"
                                     class="ctp-img" />
                            </c:if>
                        </div>
                    </td>

                    <td>
                        <div class="hero-ctp-wrapper<c:if test='${abxSlot3Group == focusGroup}'> focus-hero</c:if>">
                            <img src="${ctx}/resources/images/hero/${abxSlot3}.png"
                                 style="background-color:#${abxSlot3Color};"
                                 data-hero="${abxSlot3}"
                                 class="hero-img" />
                            <c:if test="${not empty abxSlot3Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxSlot3Ctp}.png"
                                     class="ctp-img" />
                            </c:if>
                        </div>
                    </td>

                    <td>${abxNote}</td>

                    <td class="attr-cell">
                        <c:forEach var="attr" items="${abxlCondition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png"
                                 class="attr-img"
                                 style="background-color:#000000;"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';" />
                        </c:forEach>
                    </td>

                    <td>
                        <div class="hero-ctp-wrapper<c:if test='${abxlSlot1Group == focusGroup}'> focus-hero</c:if>">
                            <img src="${ctx}/resources/images/hero/${abxlSlot1}.png"
                                 style="background-color:#${abxlSlot1Color};"
                                 data-hero="${abxlSlot1}"
                                 class="hero-img" />
                            <c:if test="${not empty abxlSlot1Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxlSlot1Ctp}.png"
                                     class="ctp-img" />
                            </c:if>
                        </div>
                    </td>

                    <td>
                        <div class="hero-ctp-wrapper<c:if test='${abxlSlot2Group == focusGroup}'> focus-hero</c:if>">
                            <img src="${ctx}/resources/images/hero/${abxlSlot2}.png"
                                 style="background-color:#${abxlSlot2Color};"
                                 data-hero="${abxlSlot2}"
                                 class="hero-img" />
                            <c:if test="${not empty abxlSlot2Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxlSlot2Ctp}.png"
                                     class="ctp-img" />
                            </c:if>
                        </div>
                    </td>
                    <td>
                        <div class="hero-ctp-wrapper<c:if test='${abxlSlot3Group == focusGroup}'> focus-hero</c:if>">
                            <img src="${ctx}/resources/images/hero/${abxlSlot3}.png"
                                 style="background-color:#${abxlSlot3Color};"
                                 data-hero="${abxlSlot3}"
                                 class="hero-img" />
                            <c:if test="${not empty abxlSlot3Ctp}">
                                <img src="${ctx}/resources/images/ctp/${abxlSlot3Ctp}.png"
                                     class="ctp-img" />
                            </c:if>
                        </div>
                    </td>
                    <td>${abxlNote}</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    </tbody>
</table>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {

        var lastHero = null; // 마지막으로 클릭한 캐릭터 이름 (토글용)

        var tables = document.querySelectorAll('.combo-table');

        tables.forEach(function (table) {
            table.addEventListener('click', function (event) {
                var target = event.target;
                var img = target.closest ? target.closest('img.hero-img') : null;

                if (!img) {
                    var node = target;
                    while (node && node !== table) {
                        if (node.tagName === 'IMG' && node.classList.contains('hero-img')) {
                            img = node;
                            break;
                        }
                        node = node.parentNode;
                    }
                }

                if (!img || !table.contains(img)) {
                    return;
                }

                var heroName = img.getAttribute('data-hero');
                if (!heroName) {
                    return;
                }

                var allWrappers = document.querySelectorAll('.hero-ctp-wrapper');
                var allHeroImgs = document.querySelectorAll('img.hero-img');

                // 같은 캐릭터 다시 클릭하면 전체 해제
                if (lastHero === heroName) {
                    allWrappers.forEach(function (wrap) {
                        wrap.classList.remove('focus-hero');
                    });
                    allHeroImgs.forEach(function (el) {
                        el.classList.remove('focus-hero');
                    });
                    lastHero = null;
                    return;
                }

                lastHero = heroName;

                // 기존 강조 제거
                allWrappers.forEach(function (wrap) {
                    wrap.classList.remove('focus-hero');
                });
                allHeroImgs.forEach(function (el) {
                    el.classList.remove('focus-hero');
                });

                // 같은 캐릭터 전부 강조
                allWrappers.forEach(function (wrap) {
                    var heroImg = wrap.querySelector('img.hero-img');
                    if (heroImg && heroImg.getAttribute('data-hero') === heroName) {
                        wrap.classList.add('focus-hero');
                    }
                });
            });
        });
    });
</script>
