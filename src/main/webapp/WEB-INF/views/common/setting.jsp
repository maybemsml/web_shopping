<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- jstl c태그, functions -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
	contextPath(=jsp_pj_hyr)
	
	방법 1.
	<c:set var="path" value="/jsp_pj_hyr" />

 --%>

<!-- contextPath -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>