<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.wrox.Ticket, com.wrox.Attachment" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wrox" uri="http://www.wrox.com/jsp/tld/wrox" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%--@elvariable id="ticketDatabase" type="java.util.Map<Integer, com.wrox.Ticket>"--%>

<template:basic htmlTitle="Tickets" bodyTitle="Tickets">
  <c:choose>
    <c:when test="${fn:length(ticketDatabase) == 0 }">
      <i>There are no tickets in the system.</i>
    </c:when>
    <c:otherwise>
      <c:forEach items="${ticketDatabase}" var="entry">
        Ticket #${entry.key}: <a href="<c:url value="/tickets">
          <c:param name="action" value="view" />
          <c:param name="ticketId" value="${entry.key}" />
          </c:url>">
          <c:out value="${wrox:abbreviateString(entry.value.subject, 60)}" /></a><br />
          <c:out value="${entry.value.customerName}" /> created ticket
          <wrox:formatDate value="${entry.value.dateCreated}" type="both" timeStyle="short" dateStyle="medium" /><br />
          <br />
      </c:forEach>
    </c:otherwise>
  </c:choose>
</template:basic>