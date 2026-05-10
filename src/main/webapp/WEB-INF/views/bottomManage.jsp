<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
window.HERO_MASTER = [
  <c:forEach var="h" items="${heroList}" varStatus="st">
  {
    code: "${fn:escapeXml(h.nameEng)}",   // 이미지 파일명(name_eng)
    nameKo: "${fn:escapeXml(h.nameKor)}", // 표시/검색용(name_kor)
    ctp: "${fn:escapeXml(h.ctpNameEng)}"  // ctp 이미지 파일명(있으면)
  }<c:if test="${!st.last}">,</c:if>
  </c:forEach>
];
</script>

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
            <c:when test="${day == 3 || day == 10 || day == 17 || day == 24
                           and abxSlot1 == abxlSlot1
                           and abxSlot2 == abxlSlot2
                           and abxSlot3 == abxlSlot3
                           and abxNote == abxlNote}">
                <tr style="border-top: 7px solid black; border-bottom: 7px solid black;">
                    <td>${day}</td>
                    <td colspan="10" class="abx-cell">
                        <div>
                            <div></div>
                            <div style="border-left: 0;">
                                <c:forEach var="attr" items="${abxCondition}">
                                    <img src="${ctx}/resources/images/attribute/${attr}.png"
                                         class="attr-img"
                                         style="background-color:#000000;"
                                         onerror="this.src='${ctx}/resources/images/attribute/Free.png';" />
                                </c:forEach>
                            </div>
                            <div>
                                <div class="hero-ctp-wrapper<c:if test='${abxSlot1Group == focusGroup}'> focus-hero</c:if>">
                                    <img src="${ctx}/resources/images/hero/${abxSlot1}.png"
                                         style="background-color:#${abxSlot1Color};"
                                         data-hero="${abxSlot1}"
                                         data-day="${day}"
                                         data-type="BOTH"
                                         data-slot="1"
                                         data-color="${abxSlot1Color}"
                                         data-ctp="${abxSlot1Ctp}"
                                         class="hero-img"
                                         />
                                    <c:if test="${not empty abxSlot1Ctp}">
                                        <img src="${ctx}/resources/images/ctp/${abxSlot1Ctp}.png"
                                             class="ctp-img" />
                                    </c:if>
                                </div>
                            </div>
                            <div>
                                <div class="hero-ctp-wrapper<c:if test='${abxSlot2Group == focusGroup}'> focus-hero</c:if>">
                                    <img src="${ctx}/resources/images/hero/${abxSlot2}.png"
                                         style="background-color:#${abxSlot2Color};"
                                         data-hero="${abxSlot2}"
                                         data-day="${day}"
                                         data-type="BOTH"
                                         data-slot="2"
                                         data-color="${abxSlot2Color}"
                                         data-ctp="${abxSlot2Ctp}"
                                         class="hero-img"
                                         />
                                    <c:if test="${not empty abxSlot2Ctp}">
                                        <img src="${ctx}/resources/images/ctp/${abxSlot2Ctp}.png"
                                             class="ctp-img" />
                                    </c:if>
                                </div>
                            </div>
                            <div>
                                <div class="hero-ctp-wrapper<c:if test='${abxSlot3Group == focusGroup}'> focus-hero</c:if>">
                                    <img src="${ctx}/resources/images/hero/${abxSlot3}.png"
                                         style="background-color:#${abxSlot3Color};"
                                         data-hero="${abxSlot3}"
                                         data-day="${day}"
                                         data-type="BOTH"
                                         data-slot="3"
                                         data-color="${abxSlot3Color}"
                                         data-ctp="${abxSlot3Ctp}"
                                         class="hero-img"
                                         />
                                    <c:if test="${not empty abxSlot3Ctp}">
                                        <img src="${ctx}/resources/images/ctp/${abxSlot3Ctp}.png"
                                             class="ctp-img" />
                                    </c:if>
                                </div>
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
                                 data-day="${day}"
                                 data-type="ABX"
                                 data-slot="1"
                                 data-color="${abxSlot1Color}"
                                 data-ctp="${abxSlot1Ctp}"
                                 class="hero-img"
                                 />
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
                                 data-day="${day}"
                                 data-type="ABX"
                                 data-slot="2"
                                 data-color="${abxSlot2Color}"
                                 data-ctp="${abxSlot2Ctp}"
                                 class="hero-img"
                                 />
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
                                 data-day="${day}"
                                 data-type="ABX"
                                 data-slot="3"
                                 data-color="${abxSlot3Color}"
                                 data-ctp="${abxSlot3Ctp}"
                                 class="hero-img"
                                 />
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
                                 data-day="${day}"
                                 data-type="ABXL"
                                 data-slot="1"
                                 data-color="${abxlSlot1Color}"
                                 data-ctp="${abxlSlot1Ctp}"
                                 class="hero-img"
                                 />
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
                                 data-day="${day}"
                                 data-type="ABXL"
                                 data-slot="2"
                                 data-color="${abxlSlot2Color}"
                                 data-ctp="${abxlSlot2Ctp}"
                                 class="hero-img"
                                  />
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
                                 data-day="${day}"
                                 data-type="ABXL"
                                 data-slot="3"
                                 data-color="${abxlSlot3Color}"
                                 data-ctp="${abxlSlot3Ctp}"
                                 class="hero-img"
                                  />
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

<!-- =========================
     Hero 교체 모달
========================= -->
<div id="heroSelectModal" class="hero-modal" style="display:none;">
    <div class="hero-modal__overlay"></div>

    <div class="hero-modal__panel">
        <div class="hero-modal__header">
            <div class="hero-modal__title">캐릭터 교체</div>
            <button type="button" id="heroModalClose" class="hero-modal__close">×</button>
        </div>

        <div class="hero-modal__body">
            <div style="display:flex; gap:10px; margin-bottom:10px; align-items:center;">
    <input id="heroSearchInput" type="text" placeholder="검색 (한글명)" style="flex:1; padding:8px;">
    <button type="button" id="heroSaveBtn" style="padding:8px 14px; cursor:pointer;">
        저장
    </button>
</div>

            <div id="heroSelectList" class="hero-select-grid"></div>

            <!--
              ✅ 전체 캐릭터 목록을 서버에서 내려주고 싶으면:
              window.HERO_MASTER = [{code:'HERO_001', name:'...', color:'FFFFFF', ctp:'...'}, ...]
              를 이 스크립트보다 "위"에서 만들어주면 됨.
            -->
        </div>
    </div>
</div>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function () {

  var ctx = '${ctx}';

  // ====== (A) 클릭한 "그 이미지"만 focus-hero 토글 ======
  var lastFocusedWrapper = null;

  function clearFocus() {
    document.querySelectorAll('.hero-ctp-wrapper').forEach(function (wrap) {
      wrap.classList.remove('focus-hero');
    });
  }

  function setFocus(wrapper) {
    clearFocus();
    if (wrapper) wrapper.classList.add('focus-hero');
    lastFocusedWrapper = wrapper || null;
  }

  function toggleFocus(wrapper) {
    if (!wrapper) return;

    if (lastFocusedWrapper === wrapper) {
      wrapper.classList.remove('focus-hero');
      lastFocusedWrapper = null;
      return;
    }
    setFocus(wrapper);
  }

  // ====== (B) 교체 모달 ======
  var modal = document.getElementById('heroSelectModal');
  var listEl = document.getElementById('heroSelectList');
  var searchEl = document.getElementById('heroSearchInput');
  var closeBtn = document.getElementById('heroModalClose');
  var saveBtn = document.getElementById('heroSaveBtn');

  if (searchEl) searchEl.setAttribute('placeholder', '검색 (한글명)');

  var targetHeroImg = null;

  // 모달에서 마지막으로 선택된 코드(검색 결과에서도 표시/애니메이션 유지용)
  var modalSelectedHeroCode = null;

  // HERO_MASTER는 위에서 JSP로 생성됨
  var HERO_MASTER = (window.HERO_MASTER && Array.isArray(window.HERO_MASTER)) ? window.HERO_MASTER : [];

  function getHeroList() {
    return HERO_MASTER;
  }

  // ====== (C) 변경사항(저장대상) - "한 번에 1개만" ======
  var dirtyMap = new Map();

  function addDirty(type, day, slot, heroCode) {
    var key = type + '|' + day + '|' + slot;
    var line = [type, day, slot, (heroCode || '')].join('|');
    dirtyMap.set(key, line);
  }

  function removeDirty(type, day, slot) {
    var key = type + '|' + day + '|' + slot;
    dirtyMap.delete(key);
  }

  function clearDirtyFromImg(img) {
    if (!img) return;
    var day  = img.getAttribute('data-day');
    var slot = img.getAttribute('data-slot');
    var type = img.getAttribute('data-type'); // ABX / ABXL / BOTH
    if (!day || !slot || !type) return;

    if (type === 'BOTH') {
      removeDirty('ABX',  day, slot);
      removeDirty('ABXL', day, slot);
    } else {
      removeDirty(type, day, slot);
    }
  }

  // ✅ 한 번에 1개만 변경 가능 => markDirty 할 때 항상 dirtyMap 초기화
  function markDirtyFromImg(img, heroCode) {
    if (!img) return;

    dirtyMap.clear();

    var day  = img.getAttribute('data-day');
    var slot = img.getAttribute('data-slot');
    var type = img.getAttribute('data-type'); // ABX / ABXL / BOTH
    if (!day || !slot || !type) return;

    if (type === 'BOTH') {
      addDirty('ABX',  day, slot, heroCode);
      addDirty('ABXL', day, slot, heroCode);
    } else {
      addDirty(type, day, slot, heroCode);
    }
  }

  function buildPlainBodyFromDirty() {
    return Array.from(dirtyMap.values()).join('\n');
  }

  // ====== (D) "이전 편집 칸" 원복을 위한 상태 ======
  // activeEdit = { img, originalHero, originalCtp }
  var activeEdit = null;

  function applyHeroToImg(img, heroCode, ctpCode) {
    if (!img) return;

    // hero 이미지
    if (heroCode) {
      img.src = ctx + '/resources/images/hero/' + heroCode + '.png';
    } else {
      // heroCode가 빈 값이면 src를 지워서 엑스박스
      img.removeAttribute('src');
    }
    img.setAttribute('data-hero', heroCode || '');
    img.setAttribute('data-ctp', ctpCode || '');

    // ctp 이미지
    var wrapper = img.closest('.hero-ctp-wrapper');
    if (!wrapper) return;

    var ctpImg = wrapper.querySelector('.ctp-img');

    if (ctpCode) {
      if (!ctpImg) {
        ctpImg = document.createElement('img');
        ctpImg.className = 'ctp-img';
        wrapper.appendChild(ctpImg);
      }
      ctpImg.src = ctx + '/resources/images/ctp/' + ctpCode + '.png';
      ctpImg.style.display = '';
    } else {
      if (ctpImg) ctpImg.style.display = 'none';
    }
  }

  function beginEdit(img) {
    if (!img) return;
    activeEdit = {
      img: img,
      originalHero: img.getAttribute('data-hero') || '',
      originalCtp: img.getAttribute('data-ctp') || ''
    };
  }

  // ✅ 다른 이미지 클릭 시: 이전 변경칸을 원래대로 되돌림 + dirty 제거
  function revertActiveEditIfNeeded(newImg) {
    if (!activeEdit || !activeEdit.img) return;
    if (activeEdit.img === newImg) return;

    applyHeroToImg(activeEdit.img, activeEdit.originalHero, activeEdit.originalCtp);
    clearDirtyFromImg(activeEdit.img);

    // 이전 active 결과 애니메이션도 풀어줌(선택 강조는 새 칸 기준으로 다시 잡힘)
    modalSelectedHeroCode = newImg ? (newImg.getAttribute('data-hero') || null) : null;
  }

  // 저장 성공 후에는 "현재 상태"를 원본으로 갱신(다른 칸 클릭해도 저장된 건 안 돌아가게)
  function commitActiveEditAsCurrent() {
    if (!activeEdit || !activeEdit.img) return;
    activeEdit.originalHero = activeEdit.img.getAttribute('data-hero') || '';
    activeEdit.originalCtp  = activeEdit.img.getAttribute('data-ctp') || '';
  }

  // ====== (E) 모달 UI ======
  function openModal(img) {
    targetHeroImg = img;

    var alreadyOpen = (modal.style.display === 'block');
    modal.style.display = 'block';

    // 검색어 유지 (원하면 여기서 초기화 가능)
    // if (!alreadyOpen) searchEl.value = '';

    renderList(getHeroList(), searchEl.value || '');
    searchEl.focus();

    // 현재 선택된 hero를 결과에서 active 처리
    setActiveResultItemByCode(modalSelectedHeroCode);
  }

  function closeModal() {
    modal.style.display = 'none';
    targetHeroImg = null;
  }

  function setActiveResultItemByCode(code) {
    modalSelectedHeroCode = code || null;
    listEl.querySelectorAll('.hero-select-item').forEach(function(el){
      el.classList.toggle('is-active', el.getAttribute('data-hero') === modalSelectedHeroCode);
    });
  }

  function renderList(list, keyword) {
    listEl.innerHTML = '';

    var kw = (keyword || '').trim().toLowerCase();

    list
      .filter(function (h) {
        var hay = (h.nameKo || '').toString().trim().toLowerCase();
        if (!kw) return true;
        return hay.indexOf(kw) !== -1;
      })
      .forEach(function (h) {

        var item = document.createElement('div');
        item.className = 'hero-select-item';
        item.setAttribute('data-hero', h.code);
        item.setAttribute('data-ctp', (h.ctp || ''));

        if (modalSelectedHeroCode && modalSelectedHeroCode === h.code) {
          item.classList.add('is-active');
        }

        var img = document.createElement('img');
        img.src = ctx + '/resources/images/hero/' + h.code + '.png'; // 없으면 엑스박스

        var name = document.createElement('div');
        name.className = 'hero-select-name';
        name.textContent = h.nameKo;

        item.appendChild(img);
        item.appendChild(name);
        listEl.appendChild(item);
      });
  }

  // 닫기(overlay / X / ESC)
  modal.addEventListener('click', function (e) {
    if (e.target.classList.contains('hero-modal__overlay')) closeModal();
  });
  closeBtn.addEventListener('click', closeModal);
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && modal.style.display === 'block') closeModal();
  });

  // 검색 input
  searchEl.addEventListener('input', function () {
    renderList(getHeroList(), searchEl.value);
    setActiveResultItemByCode(modalSelectedHeroCode);
  });

  // ✅ 검색 결과에서 캐릭터 선택 -> 테이블에 반영 BUT 모달은 닫지 않음
  listEl.addEventListener('click', function (e) {
    var item = e.target.closest('.hero-select-item');
    if (!item || !targetHeroImg) return;

    var newHero = item.getAttribute('data-hero');
    var newCtp  = item.getAttribute('data-ctp') || '';

    var wrapper = targetHeroImg.closest('.hero-ctp-wrapper');

    // 1) hero 이미지 교체
    applyHeroToImg(targetHeroImg, newHero, newCtp);

    // 2) focus는 클릭한 그 칸만
    setFocus(wrapper);

    // 3) 모달 결과에서 선택 항목 active + 바운스
    setActiveResultItemByCode(newHero);

    // ✅ 4) 저장대상은 "이 1개만"
    markDirtyFromImg(targetHeroImg, newHero);
  });

  // ====== (F) 테이블 hero-img 클릭: 이전 변경칸 원복 + 새 칸 편집 시작 ======
  document.querySelectorAll('.combo-table').forEach(function (table) {
    table.addEventListener('click', function (event) {
      var img = event.target.closest ? event.target.closest('img.hero-img') : null;
      if (!img || !table.contains(img)) return;

      // ✅ 다른 칸 클릭하면 이전 변경칸 원복
      revertActiveEditIfNeeded(img);

      // 새 칸 편집 시작(원본 저장)
      beginEdit(img);

      var wrapper = img.closest('.hero-ctp-wrapper');
      toggleFocus(wrapper);

      // 모달에서 현재 hero active 표시
      modalSelectedHeroCode = img.getAttribute('data-hero') || null;

      openModal(img);
    });
  });

  // ====== (G) 저장 (text/plain) ======
  function postPlain(url, text, ok, fail) {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-Type', 'text/plain; charset=UTF-8');
    xhr.setRequestHeader('Accept', 'application/json');
    xhr.onreadystatechange = function () {
      if (xhr.readyState !== 4) return;
      if (xhr.status >= 200 && xhr.status < 300) ok && ok(xhr.responseText);
      else fail && fail(xhr);
    };
    xhr.send(text);
  }

  if (saveBtn) {
    saveBtn.addEventListener('click', function(){
      var body = buildPlainBodyFromDirty();

      if (!body) {
        alert('변경된 항목이 없습니다.');
        return;
      }

      var url = ctx + '/tab1Manage/saveHeroIdxPlain';

      postPlain(url, body, function(resp){
        alert('저장 완료');

        // ✅ 저장 성공하면 "현재 상태"를 원본으로 갱신(이제 다른 칸 클릭해도 안 돌아감)
        commitActiveEditAsCurrent();

        // ✅ 저장했으니 변경목록 초기화
        dirtyMap.clear();
      }, function(xhr){
        alert('저장 실패 (' + xhr.status + ')');
        console.error(xhr.responseText);
      });
    });
  }

});
</script>


<style>
.hero-select-item.is-active {
  outline: 2px solid #2f80ed;
  border-radius: 10px;
  animation: select-bounce 0.9s ease-in-out infinite;
}

@keyframes select-bounce {
  0%   { transform: translateY(0); }
  50%  { transform: translateY(-6px); }
  100% { transform: translateY(0); }
}
</style>