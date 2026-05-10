<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

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
                         alt="챌린저 이미지"
                         class="arena-img" />
                </c:when>
                <c:otherwise>
                    <div class="arena-placeholder">
                        챌린저 이미지를 업로드하면 여기 표시됩니다.
                    </div>
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
                         alt="비브라늄 이미지"
                         class="arena-img" />
                </c:when>
                <c:otherwise>
                    <div class="arena-placeholder">
                        비브라늄 이미지를 업로드하면 여기 표시됩니다.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="arena-note-container">
    <div class="arena-note-title">참고</div>
    <pre class="arena-note-box"><c:out value="${arenaNote}" /></pre>
</div>
