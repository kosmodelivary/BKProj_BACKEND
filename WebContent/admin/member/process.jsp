<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/admin/include/loginCheck.jsp" />

<c:if test="${EDIT_RESULT ne null }">
	<c:choose>
		<c:when test="${EDIT_RESULT ne '0' }">
			<script>
				alert('수정 성공');
				location.replace("<c:url value='/ADMIN/MEMBER/List.do' />");
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('수정 실패');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:if>

<c:if test="${DELETE_RESULT ne null }">
	<c:choose>
		<c:when test="${DELETE_RESULT ne '0' }">
			<script>
				alert('삭제 성공');
				location.replace("<c:url value='/ADMIN/MEMBER/List.do' />");
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('삭제 실패');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:if>
