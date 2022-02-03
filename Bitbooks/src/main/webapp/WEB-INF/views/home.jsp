<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Bit Books 홈의 내용을 채운다. -->
<h1>
	<!-- 메시지 프로퍼티 파일로부터 메시지 내용을 읽어온다. -->
	<spring:message code="common.homeWelcome" />
</h1>

<P> ${serverTime} </P>