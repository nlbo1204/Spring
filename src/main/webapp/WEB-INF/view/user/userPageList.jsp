
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<%@ include file="/WEB-INF/view/common/basicLib.jsp"%>

<style type="text/css">
.userClick {
	cursor: pointer;
}
</style>


<script type="text/javascript">
	$(document).ready(function() {
		console.log("documnet.ready");

		//tr에 select(class="userClick")
		//#userList -> tbody id
		$("#userList").on("click",".userClick", function() {
			console.log("userClick");
			var userId = $(this).children()[1].innerHTML;

			$("#userId").val(userId);
			$("#frm").submit();
		});
		
		/* getUserList(1); */
		getUserListHtml(1); 		//userList html로 리턴해주는 함수
		getUserPageNationHtml(1);
	});
	
	function getUserPageNationHtml(page){
		var pageSize =10;
		
		$.ajax({
			url : "/user/userPageNationHtml",
			type : "get",
			data : "page=" +page+ "&pageSize="+pageSize,
			success : function(dt){
				$("#userList").html(dt)
			}
		});
	}
	
	function getUserListHtml(page){
		var pageSize = 10;
		
		$.ajax({
			url : "/user/userPageListAjaxHtml ",
			type : "get",
			data :"page="+page+"&pageSize="+pageSize ,
			success : function(dt){
				console.log(dt)
				$("#userList").html(dt);
				getUserListHtml(1); 
			}
			
		});
	}

	//page인자를 받아서
	//해당 페이지에 속하는 사용자리스트 정보를 가져온다
	function getUserList(page) {
		var pageSize = 10;
		console.log("page :" + page);

		//ajax call
		//사용자 리스트 데이터만 가져오기
		//html(as-is) --> json(to-be) 데이터를 받는 형태로 변경

		$.ajax({
			type : "GET",
			url : "/user/userPageListAjax",
			data : "page=" + page + "&pageSize=" + pageSize,
			//=> page=1&pageSize=10
			success : function(data) {
				// data.pageUserList, data.pageCnt가 들어있다.
				//data(사용자 json 데이터)를 바탕으로
				//사용자 리스트를 갱신하는 작업

				//1. 기존 리스트를 삭제
				//2. data를 이용하여 table 태그(tr)를 작성
				//3. 기존 리스트 위치에다가 붙여넣기
				//data.userList
				var html ="";
				$.each(data.pageUserList, function(idx, user){
					console.log(user)
					html +="<tr class=\"userClick\">";
					html +="<td>"+user.rnum+"</td>";
					html +="<td>"+user.userId+"</td>";
					html +="<td>"+user.name+"</td>";
					html +="<td>"+user.formmatedBirth+"</td>";
				});
				
				$("#userList").html("");
				$("#userList").html(html);
				
			 	var pageNav = ""; 
				/* $.each(,function(){
					pageNav += "<li><a href='"+getUserList()+"'">";
				}); */
			/* 	pageNav += "<li><a href=\"javascript:getUserList(1);\" aria-label=\"Previous\">"
						+= "<span aria-hidden=\"true\">&laquo;</span>"
				        += "</a></li>" */
				        
				for(var i=1; i<data.pageCnt+1; i++){
					pageNav += "<li><a href=\"javascript:getUserList(" +i+ ") \">"+i+"</a></li>";
				}
				$("#nav").html("");
				$("#nav").html(pageNav);
				
				/* <tr class="userClick">
				<td>${user.rnum}</td>
				<td>${user.userId}</td>
				<td>${user.name}</td>
				<td><fmt:formatDate value="${user.birth}"
						pattern="yyyy-MM-dd" /></td>
			</tr> */
			}
		});
	}
</script>

</head>
<form id="frm" action="/user/userDetail" method="get">
	<input type="hidden" id="userId" name="userId">
</form>

<div class="row">
	<div class="col-sm-8 blog-main">
		<h2 class="sub-header">사용자</h2>
		<div class="table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>사용자 아이디</th>
						<th>사용자 이름</th>
						<th>생일</th>
					</tr>
				</thead>
				<%-- <%
									List<UserVO> userList = (List) request.getAttribute("pageUserList");
									int index = 1;
									for (UserVO uservo : userList) {
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								%>

								<tr class="userClick">
									<td><%=uservo.getRnum()%></td>
									<td><%=uservo.getUserId()%></td>
									<td><%=uservo.getName()%></td>
									<td><%=sdf.format(uservo.getBirth())%></td>
								</tr>


								<%
									index++;
									}
								%> --%>
				<tbody id="userList">
			<%-- 	<c:forEach items="${pageUserList}" var="user">
					<tr class="userClick">
						<td>${user.rnum}</td>
						<td>${user.userId}</td>
						<td>${user.name}</td>
						<td><fmt:formatDate value="${user.birth}"
								pattern="yyyy-MM-dd" /></td>
					</tr>

				</c:forEach> --%>
				</tbody>

			</table>
		</div>

		<a class="btn btn-default pull-right" href="/user/userForm">사용자 등록</a>

		<div class="text-center" id="nav" >

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
	</div>
</div>

</html>
