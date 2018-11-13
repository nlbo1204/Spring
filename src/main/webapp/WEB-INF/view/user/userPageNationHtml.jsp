<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="text-center" id="nav">

	<ul class="pagination">
		<!-- 				<li><a href="/user/userPageList?page=1&pageSize=10" -->
		<li><a href="javascript:getUserList(1);" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
		</a></li>
		<%-- <%
								int pageCnt = (Integer)request.getAttribute("pageCnt");
								for(int p = 1; p <= pageCnt ; p++){
									
								
							%>
								<li><a href="/userPageList?page=<%=p%>&pageSize=10"><%=p%></a></li>
								<%
								}
								%>
								<li><a href="/userPageList?page=<%=pageCnt%>&pageSize=10"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li> --%>

		<c:forEach begin="1" end="${pageCnt}" var="p">
			<%-- 					<li><a href="/user/userPageList?page=${p}&pageSize=10">${p}</a></li> --%>
			<li><a href="javascript:getUserList(${p});">${p}</a></li>
		</c:forEach>

		<%-- 				<li><a href="/user/userPageList?page=${pageCnt}&pageSize=10" --%>
		<li><a href="javascript:getUserList(${pageCnt});"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</div>