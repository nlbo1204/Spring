<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/common/basicLib.jsp"%>
<c:set var="lang" value="${param.lang == null ? 'ko' : param.lang}"></c:set>
<script type="text/javascript">
	$(document).ready(function() {
		//select box 의 값 설정
		$("#lang").val("${lang}");

	/* 	$("#lang").on("change", function() {
			$("#frm").submit();
		}); */
	});
</script>
</head>
<body>
	hello :
	<spring:message code="hello" />
	<br> visitor :
	<spring:message code="visitor"  arguments="brown"/>
	<br> 아이디 :
	<input type="text" value="brown" />
	<br> 내 용 :
	<input type="text" value="context" />
	<br>
	<form action="/messageView" method="post">
		<select name="lang" id="lang">
			<option value="ko">한국어</option>
			<option value="en">English</option>
			<option value="ja">日本の</option>.
		</select> <br> <input type="submit" value="전송">
	</form>


</body>
</html>