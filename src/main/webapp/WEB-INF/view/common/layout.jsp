
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<head>
<!-- header -->
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %>


</head>


<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<tiles:insertAttribute name="header"/>
	<div class="container-fluid">
		<div class="row">
			<%-- left --%>
			<%@ include file="/WEB-INF/view/common/left.jsp" %>
			<tiles:insertAttribute name="left"/>
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<tiles:insertAttribute name="content"/>
			</div>
		</div>
	</div>
</body>
</html>
