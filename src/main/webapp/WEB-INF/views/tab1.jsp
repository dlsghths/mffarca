<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<jsp:useBean id="pageName" scope="request" class="java.lang.String"/>
<% request.setAttribute("pageName", "tab1"); %>

<%
    // 예시 데이터: 입장 조건과 이미지 배열
    String[][] conditions = {
        {"💚 🔵 ♀", "hero1.png,hero2.png,hero3.png"},
        {"🔥 ♀", "hero4.png,hero5.png,hero6.png,hero7.png"},
        // 필요하면 나머지 26개도 채워야 함
    };
%>

<%-- 28개 반복 --%>
<div style="display: flex; flex-wrap: wrap; gap: 20px;">
<%
    for (int i = 0; i < 28; i++) {
        String condition = "조건" + (i+1); // 예시로 조건명
        String[] images;
        if(i < conditions.length) {
            condition = conditions[i][0];
            images = conditions[i][1].split(",");
        } else {
            images = new String[]{"hero1.png"}; // 기본 이미지
        }
%>
    <table border="1" style="border-collapse: collapse; width:48%; text-align:center; margin-bottom:10px;">
        <thead>
            <tr>
                <th>입장 조건</th>
                <th>예상 영웅</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%=condition%></td>
                <td>
                    <% for(String img : images) { %>
                        <img src="${pageContext.request.contextPath}/resources/images/<%=img%>" width="50" />
                    <% } %>
                </td>
            </tr>
        </tbody>
    </table>
<% } %>
</div>


