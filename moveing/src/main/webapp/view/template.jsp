<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resource/js/jquery-3.6.0.js'/>"></script>

<!--   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder"></script>
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