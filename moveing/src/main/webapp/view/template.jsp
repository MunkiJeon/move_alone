<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resource/js/jquery-3.6.0.js'/>"></script>
</head>
<body>
<jsp:include page="inc/${config }/top.jsp"/>
<jsp:include page="${mainUrl }"/>
<c:if test="${config!='manager'&&id!=null }">
<jsp:include page="inc/chatbot.jsp"/>
</c:if>
<c:if test="${config=='guest' }">
<jsp:include page="inc/${config }/bottom.jsp"/>
</c:if>

</body>
</html>