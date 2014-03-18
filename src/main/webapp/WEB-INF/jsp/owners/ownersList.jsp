<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>
    <h2><fmt:message key="Owners"/></h2>
    
    <fmt:message key="Name" var="name_th"/>
    <fmt:message key="Address" var="address_th"/>
    <fmt:message key="City" var="city_th"/>
    <fmt:message key="Telephone" var="telephone_th"/>
    <fmt:message key="Pets" var="pets_th"/>
    
    <datatables:table id="owners" data="${selections}" cdn="true" row="owner" theme="bootstrap2" 
                      cssClass="table table-striped" paginate="false" info="false" export="pdf">
        <datatables:column title="${name_th}" cssStyle="width: 150px;" display="html">
            <spring:url value="/owners/{ownerId}.html" var="ownerUrl">
                <spring:param name="ownerId" value="${owner.id}"/>
            </spring:url>
            <a href="${fn:escapeXml(ownerUrl)}"><c:out value="${owner.firstName} ${owner.lastName}"/></a>
        </datatables:column>
        <datatables:column title="${name_th}" display="pdf">
            <c:out value="${owner.firstName} ${owner.lastName}"/>
            
        </datatables:column>
        <datatables:column title="${address_th}" property="address" cssStyle="width: 200px;"/>
        <datatables:column title="${city_th}" property="city"/>
        <datatables:column title="${telephone_th}" property="telephone"/>
        <datatables:column title="${pets_th}" cssStyle="width: 100px;">
            <c:forEach var="pet" items="${owner.pets}">
                <c:out value="${pet.name}"/>
            </c:forEach>
        </datatables:column>
        <datatables:export type="pdf" cssClass="btn btn-small" />
    </datatables:table>
    
    <jsp:include page="../fragments/footer.jsp"/>

</div>
</body>

</html>
