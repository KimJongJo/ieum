<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sub-header-div">
	<div class="sub-header-div-basic">
		<div class="place-div">
			<a href="/ieum/index"><i class="fa-regular fa-house"></i></a>
			<i class="fa-solid fa-angle-right"></i>
			<a href="${navPath}">${navPathName}</a>
			
			<c:if test="${not empty navPath2}">
				<i class="fa-solid fa-angle-right"></i>
				<a href="${navPath2}">${navPathName2}</a>	
			</c:if>
			
			<c:if test="${not empty navPath3}">
				<i class="fa-solid fa-angle-right"></i>
				<a href="${navPath3}">${navPathName3}</a>	
			</c:if>
			
		</div>
		<span class="place">${navcurPage}</span>
	</div>
</div>