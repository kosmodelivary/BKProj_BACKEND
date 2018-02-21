<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.USER_ID eq null}"  >
	<script>
		alert('로그인 후 이용하세요.');
		location.replace("${pageContext.request.contextPath }");
	</script>
</c:if>
