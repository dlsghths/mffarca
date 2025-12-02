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
                    <td class="attr-cell">
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
                    <td class="attr-cell">
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

        // ====== 캐릭터 클릭 강조 처리 ======
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

                // 같은 캐릭을 다시 클릭하면 전체 강조 해제
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

        // ====== 행 높이 + 조건 아이콘 크기 동기화 ======
        function syncRowsAndAttrIcons() {
            var leftRows  = document.querySelectorAll('.flex-item:nth-child(1) .combo-table tbody tr');
            var rightRows = document.querySelectorAll('.flex-item:nth-child(2) .combo-table tbody tr');

            var len = Math.min(leftRows.length, rightRows.length);

            // 먼저 기존 height 초기화 (안 하면 이전 값 때문에 깨짐)
            for (var i = 0; i < leftRows.length; i++) {
                leftRows[i].style.height = '';
            }
            for (var j = 0; j < rightRows.length; j++) {
                rightRows[j].style.height = '';
            }

            // 다시 측정해서 큰 값으로 맞추기
            for (var k = 0; k < len; k++) {
                var lh = leftRows[k].offsetHeight;
                var rh = rightRows[k].offsetHeight;
                var h  = Math.max(lh, rh);

                leftRows[k].style.height  = h + 'px';
                rightRows[k].style.height = h + 'px';
            }

            // === 조건 아이콘 크기 자동 조절 (행 높이에 맞게) ===
            var attrCells = document.querySelectorAll('.combo-table tbody td.attr-cell');
            attrCells.forEach(function (cell) {
                var cellHeight = cell.offsetHeight;
                // 최소 16, 최대 36px 정도에서 자동 조절
                var size = Math.max(16, Math.min(cellHeight - 8, 48));

                var imgs = cell.querySelectorAll('.attr-img');
                imgs.forEach(function (img) {
                    img.style.width  = size + 'px';
                    img.style.height = size + 'px';
                });
            });
        }

        // 처음 로딩 시 1번 실행
        syncRowsAndAttrIcons();

        // 리사이즈 시에도 다시 맞추기 (디바운스)
        var resizeTimer = null;
        window.addEventListener('resize', function () {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(syncRowsAndAttrIcons, 150);
        });
    });
</script>


