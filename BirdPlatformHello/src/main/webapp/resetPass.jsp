<%-- 
    Document   : resetPass
    Created on : May 25, 2023, 1:01:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Page</title>
    </head>
    <body>

        <c:set var="Servlet" value="${requestScope.SERVLET}" />
        <c:if test="${empty Servlet}">
            <c:redirect url="GetKeyToResetPass"> </c:redirect>
        </c:if>
        <c:set var="PETHEELORS" value="${requestScope.PETHEELORS}" />
        <c:if test="${empty PETHEELORS}">
            <h2 > This is out of time or not have permission
                to reset pass</h2>
            </c:if>

        <c:if test="${not empty PETHEELORS}">
            <h1>Hello World!</h1>
            <form action="DispatcherServlet">
                <input type="hidden" name="gmail" value="${PETHEELORS}" /> 
                <input type="text" name="newPass"  />
                <h2 style="color: red">The new pass is empty </h2>
                <input type="text" name="confirmPass"  />
                 <h2 style="color: red">The Confirm pass is empty </h2>
                  <h2 style="color: red">The new pass is empty </h2>
                <input name="MAIN" type="submit" value ="ResetPass" />
            </form>
        </c:if>



    </body>
</html>
