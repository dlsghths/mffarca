<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/header_manage.jsp" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<style>
  .arena-form-box{
    max-width: 900px;
    margin: 20px auto 0;
    padding: 14px 16px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background: #fff;
  }
  .arena-form-row{
    display:flex; gap:12px; align-items:center; margin: 10px 0;
  }
  .arena-form-row label{
    width: 120px; font-weight: bold;
  }
  .arena-form-row input[type="file"]{ flex:1; }
  .arena-form-actions{
    display:flex; justify-content:flex-end; margin-top: 10px;
  }
  .arena-note-input{
    width: 100%; min-height: 160px; resize: vertical;
    padding: 10px; border: 1px solid #ccc; border-radius: 6px;
    font-size: 14px; line-height: 1.4;
  }
  .btn-save{
    padding: 8px 14px; border: 0; border-radius: 6px;
    background:#4285f4; color:#fff; cursor:pointer;
  }
</style>

<!-- ✅ 등록/수정 폼 -->
<div class="arena-form-box">
  <form action="${ctx}/tab3Manage" method="post" enctype="multipart/form-data">
    <!-- Spring Security CSRF 쓰면 필요
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    -->

    <div class="arena-form-row">
      <label>챌린저 이미지</label>
      <input type="file" name="challengerFile" accept="image/*"/>
    </div>

    <div class="arena-form-row">
      <label>비브라늄 이미지</label>
      <input type="file" name="vibraniumFile" accept="image/*"/>
    </div>

    <div class="arena-form-row" style="align-items:flex-start;">
      <label>참고 글</label>
      <textarea class="arena-note-input" name="arenaNote"
          placeholder="줄바꿈 그대로 입력하면 화면에서 줄바꿈으로 표시돼요."><c:out value="${arenaNote}"/></textarea>
    </div>

    <div class="arena-form-actions">
      <button type="submit" class="btn-save">저장</button>
    </div>
  </form>
</div>

<!-- 아래는 네가 준 “표시 화면” 그대로 -->
<style>
  .arena-container {
        display: flex;
        gap: 40px;
        justify-content: center;
        align-items: flex-start;
        margin-top: 30px;
    }

    .arena-side {
        flex: 1;
        text-align: center;
    }

    .arena-title {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .arena-image-wrapper {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 10px;
        min-height: 260px;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #111; /* 배경 살짝 어둡게 */
    }

    .arena-img {
        max-width: 100%;
        object-fit: contain;
        border-radius: 4px;
    }

    .arena-placeholder {
        color: #aaa;
        font-size: 14px;
    }

    /* 참고 박스 스타일 */
    .arena-note-container {
        max-width: 900px;
        margin: 30px auto 0;
    }

    .arena-note-title {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .arena-note-box {
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 10px 12px;
        font-size: 21px;
        background-color: #f8f8f8;
        line-height: 1.5;
        color: #555;
    }
    
    .arena-note-box{
	  white-space: pre-wrap; /* 줄바꿈 유지 + 긴 줄 자동 줄바꿈 */
	  margin: 0;             /* pre 기본 여백 제거(원하면) */
	}
    
    @media (max-width: 768px) {
        .arena-container {
            flex-direction: column;
            gap: 20px;
        }

        .arena-side {
            width: 100%;
        }
    }
</style>

<div class="arena-container">
  <div class="arena-side">
    <div class="arena-title">챌린저</div>
    <div class="arena-image-wrapper">
      <c:choose>
        <c:when test="${not empty challengerImage}">
          <img src="${ctx}/resources/images/arena/${challengerImage}"
               alt="챌린저 이미지" class="arena-img"/>
        </c:when>
        <c:otherwise>
          <div class="arena-placeholder">챌린저 이미지를 업로드하면 여기 표시됩니다.</div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <div class="arena-side">
    <div class="arena-title">비브라늄</div>
    <div class="arena-image-wrapper">
      <c:choose>
        <c:when test="${not empty vibraniumImage}">
          <img src="${ctx}/resources/images/arena/${vibraniumImage}"
               alt="비브라늄 이미지" class="arena-img"/>
        </c:when>
        <c:otherwise>
          <div class="arena-placeholder">비브라늄 이미지를 업로드하면 여기 표시됩니다.</div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>

<div class="arena-note-container">
  <div class="arena-note-title">참고</div>
  <pre class="arena-note-box"><c:out value="${arenaNote}" /></pre>
</div>
