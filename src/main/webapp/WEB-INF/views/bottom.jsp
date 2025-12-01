<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                 <!-- CTP 이미지용 변수 (필요시) -->
                <c:set var="slot1Ctp" value="" />
                <c:set var="slot2Ctp" value="" />
                <c:set var="slot3Ctp" value="" />
                <c:forEach var="s" items="${settings}">
                    <c:if test="${s.day == day && s.type == 'ABX'}">
                        <c:choose>
                            <c:when test="${s.slot == 1}">
                                <c:set var="slot1" value="${s.name}" />
                                <c:set var="slot1Group" value="${s.groupIdx}" />
                                <c:set var="slot1Color" value="${s.color}" />
                                <c:set var="condition" value="${s.attributeList}" />
                                <c:set var="abxNote" value="${s.note}" />
                                <c:set var="slot1Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 2}">
                                <c:set var="slot2" value="${s.name}" />
                                <c:set var="slot2Group" value="${s.groupIdx}" />
                                <c:set var="slot2Color" value="${s.color}" />
                                 <c:set var="slot2Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 3}">
                                <c:set var="slot3" value="${s.name}" />
                                <c:set var="slot3Group" value="${s.groupIdx}" />
                                <c:set var="slot3Color" value="${s.color}" />
                                 <c:set var="slot3Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>
                <tr>
                    <td>${day}</td>
                    <td>
                        <c:forEach var="attr" items="${condition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png" style="background-color:000000;" class="attr-img"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';" />
                        </c:forEach>
                    </td>
                    <td>
                    	<div class="hero-ctp-wrapper <c:if test='${slot1Group  == focusGroup}'> focus-hero</c:if>">
                    		<img src="${ctx}/resources/images/hero/${slot1}.png" style="background-color:#${slot1Color};" data-hero="${slot1}" class="hero-img"/>
                    	<c:if test="${not empty slot1Ctp}">
                                <img src="${ctx}/resources/images/ctp/${slot1Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
                    	</div>
                    	
					</td>
                    <td>
                    	<div class="hero-ctp-wrapper <c:if test='${slot2Group  == focusGroup}'> focus-hero</c:if>">
                    		<img src="${ctx}/resources/images/hero/${slot2}.png" style="background-color:#${slot2Color};" data-hero="${slot2}" class="hero-img"/>
                    	<c:if test="${not empty slot2Ctp}">
                                <img src="${ctx}/resources/images/ctp/${slot2Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
                    	</div>
                    </td>
                    <td>
                    	<div class="hero-ctp-wrapper <c:if test='${slot3Group  == focusGroup}'> focus-hero</c:if>">
                    		<img src="${ctx}/resources/images/hero/${slot3}.png" style="background-color:#${slot3Color};" data-hero="${slot3}" class="hero-img"/>
                    	<c:if test="${not empty slot3Ctp}">
                                <img src="${ctx}/resources/images/ctp/${slot3Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
                    	</div>
                    </td>
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
				  <c:set var="slot1Ctp" value="" />
                <c:set var="slot2Ctp" value="" />
                <c:set var="slot3Ctp" value="" />
                <c:forEach var="s" items="${settings}">
                    <c:if test="${s.day == day && s.type == 'ABXL'}">
                        <c:choose>
                            <c:when test="${s.slot == 1}">
                                <c:set var="slot1" value="${s.name}" />
                                <c:set var="slot1Group" value="${s.groupIdx}" />
                                <c:set var="slot1Color" value="${s.color}" />
                                <c:set var="condition" value="${s.attributeList}" />
                                <c:set var="abxlNote" value="${s.note}" />
                                 <c:set var="slot1Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 2}">
                                <c:set var="slot2" value="${s.name}" />
                                <c:set var="slot2Group" value="${s.groupIdx}" />
                                <c:set var="slot2Color" value="${s.color}" />
                                  <c:set var="slot2Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                            <c:when test="${s.slot == 3}">
                                <c:set var="slot3" value="${s.name}" />
                                <c:set var="slot3Group" value="${s.groupIdx}" />
                                <c:set var="slot3Color" value="${s.color}" />
                                 <c:set var="slot3Ctp" value="${s.ctpNameEng}" />
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>
                <tr>
                    <td>${day}</td>
                    <td>
                        <c:forEach var="attr" items="${condition}">
                            <img src="${ctx}/resources/images/attribute/${attr}.png" style="background-color:000000;" class="attr-img"
                                 onerror="this.src='${ctx}/resources/images/attribute/Free.png';"/>
                        </c:forEach>
                    </td>
                    <td>
                    	<div class="hero-ctp-wrapper <c:if test='${slot1Group  == focusGroup}'> focus-hero</c:if>">
                    		<img src="${ctx}/resources/images/hero/${slot1}.png" style="background-color:#${slot1Color};" data-hero="${slot1}" class="hero-img"/>
                    		 <c:if test="${not empty slot1Ctp}">
                                <img src="${ctx}/resources/images/ctp/${slot1Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
                    	</div>
                    </td>
                    <td>
                    	<div class="hero-ctp-wrapper <c:if test='${slot2Group  == focusGroup}'> focus-hero</c:if>">
                    		<img src="${ctx}/resources/images/hero/${slot2}.png" style="background-color:#${slot2Color};" data-hero="${slot2}" class="hero-img"/>
                    		<c:if test="${not empty slot2Ctp}">
                                <img src="${ctx}/resources/images/ctp/${slot2Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
                    	</div>
                    </td>
                    <td>
                    	<div class="hero-ctp-wrapper <c:if test='${slot3Group  == focusGroup}'> focus-hero</c:if>">
                    		<img src="${ctx}/resources/images/hero/${slot3}.png" style="background-color:#${slot3Color};" data-hero="${slot3}" class="hero-img"/>
                    		<c:if test="${not empty slot3Ctp}">
                                <img src="${ctx}/resources/images/ctp/${slot3Ctp}.png"
                                     alt=""
                                     class="ctp-img" />
                            </c:if>
                    	</div>
                    </td>
                    <td>${abxlNote}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {

        var lastHero = null; // 마지막으로 클릭한 캐릭터 이름 (토글용)

        // ABX / ABXL 둘 다 .combo-table 이니까, 각 테이블에 이벤트 등록
        var tables = document.querySelectorAll('.combo-table');

        tables.forEach(function (table) {
            table.addEventListener('click', function (event) {

                // 클릭된 요소가 img.hero-img 인지 찾기 (버블링 이용)
                var target = event.target;
                var img = target.closest ? target.closest('img.hero-img') : null;

                // closest 를 지원하지 않는 브라우저용 fallback
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

                // ⭐ 이제는 모든 래퍼(div.hero-ctp-wrapper)를 기준으로 처리
                var allWrappers = document.querySelectorAll('.hero-ctp-wrapper');
                var allHeroImgs = document.querySelectorAll('img.hero-img');

                // 같은 캐릭터를 다시 클릭하면 전체 강조 해제
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

                // 기존 강조 전부 제거 (div + img 둘 다)
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
                        // 래퍼에 강조 클래스 부여
                        wrap.classList.add('focus-hero');
                        // 혹시 img에도 같이 주고 싶으면 아래 한 줄도 활성화
                        // heroImg.classList.add('focus-hero');
                    }
                });
            });
        });

    });
    
    document.addEventListener('DOMContentLoaded', function () {
        // 왼쪽/오른쪽 테이블의 행 목록 가져오기
        var leftRows  = document.querySelectorAll('.flex-item:nth-child(1) .combo-table tbody tr');
        var rightRows = document.querySelectorAll('.flex-item:nth-child(2) .combo-table tbody tr');

        var len = Math.min(leftRows.length, rightRows.length);

        for (var i = 0; i < len; i++) {
            var lh = leftRows[i].offsetHeight;
            var rh = rightRows[i].offsetHeight;
            var h  = Math.max(lh, rh);

            leftRows[i].style.height  = h + 'px';
            rightRows[i].style.height = h + 'px';
        }
    });
</script>

