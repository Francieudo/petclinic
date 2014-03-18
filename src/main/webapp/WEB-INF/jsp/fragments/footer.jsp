<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <fmt:message key="Sponsored" var="sponsored"/>

<table class="footer">
    <tr>
        <td></td>
        <td align="right"><img src="<spring:url value="/resources/images/springsource-logo.png" htmlEscape="true" />"
                               alt="${sponsored}"/></td>
    </tr>
</table>


