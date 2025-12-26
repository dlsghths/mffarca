<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header_manage.jsp" %>

<jsp:useBean id="pageName" scope="request" class="java.lang.String"/>

<c:set var="maxDay" value="28" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<%@ include file="topManage.jsp" %>

<%@ include file="bottom.jsp" %>

<!-- 공통 CSS -->
<style>
    img {
        border: 0.1px solid black;
        width: 60px;
        style="background-color:000000;"
    }

    .flex-container {
        display: flex;
        gap: 20px;
        justify-content: space-between;
    }

    .flex-item {
        flex: 1;
    }

    .combo-table {
        border-collapse: collapse;
        width: 100%;
        text-align: center;
        margin-bottom: 20px;
        
         border-collapse: collapse;
    border-spacing: 0;
    }
    
    .combo-table tbody th,
	.combo-table tbody td {
	    height: 75px;           /* 필요에 따라 70, 80 등 조정 */
	    padding: 0;             /* 여백 줄이기 */
	    vertical-align: middle; /* 가운데 정렬 */
	}
	
	.combo-table thead th {
	    height: 28px;          /* 원하는 만큼 줄이기 */
	    padding: 2px 4px;
	    font-size: 12px;       /* 글씨도 조금 작게 */
	    vertical-align: middle;
	}
	
	.combo-table td:nth-child(6) {
	    max-height: 60px;
	    overflow-y: auto;
	}
	
	.hero-img {
	    border: 0.1px solid black;
	    width: 60px;
	    height: 60px;
	    object-fit: cover;
	    cursor: pointer;
	}
	
	.ctp-img {
        position: absolute;
        right: 0;
        bottom: 0;
        width: 24px;
        height: 24px;
        border-radius: 4px;
        border: 1px solid red;
        box-sizing: border-box;
        pointer-events: none; /* 클릭/탭은 뒤 hero-img가 받게 */
        background-color: #000000;
        pointer-events: none;
    }
    
    .attr-img {
	    display: inline-block;
	    max-width: 100% !important;
    	max-height: 100% !important;
	}
    
	.hero-ctp-wrapper.focus-hero {
		position: relative;
	    z-index: 2;
		transform: translateY(-4px) scale(1.08); /* 살짝 위로 + 확대 */ 
 	    box-shadow: 0 10px 16px rgba(0, 0, 0, 0.45); /* 진한 그림자 */ 
 	    outline: 3px solid red; /* 노란 테두리 */ 
 	    filter: none; /* 혹시 흐리게 만들었으면 원래대로 */
	    animation: focus-pulse 0.9s ease-in-out infinite;
	}
    
    .hero-ctp-wrapper {
        position: relative;
        display: inline-block;
        border: none;
    }
    
    @keyframes focus-pulse {
		0% { 
			transform: scale(1);
		    box-shadow: 0 0 0 rgba(0, 0, 0, 0.4);
		}
		50% {
		    transform: scale(1.12);        /* 중간에 제일 크게 */
		    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.6);
		}
		100% { 
		    transform: scale(1); 
		    box-shadow: 0 0 0 rgba(0, 0, 0, 0.4);
		}
	}

	.abx-cell {
	    padding: 0;
		border: none;
		margin: 0;
		 border:1px solid #000;
	}
	.abx-cell > div {
		display: flex;
		height: 100%;
	}
	.abx-cell > div > div {
		width: 50%;
		height: 100%;
		align-items:center;
		display: flex;
		justify-content: center;
	}
	.abx-cell > div > div:not(:last-child) {
		border-right: 0.1px solid black;
	}
</style>
