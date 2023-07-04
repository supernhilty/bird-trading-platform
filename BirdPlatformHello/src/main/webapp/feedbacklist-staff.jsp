<%-- 
    Document   : feedbacklist-staff
    Created on : Jun 7, 2023, 3:50:15 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/feedbacklist-staff.css">
        <title>Feedback List</title>
        <script src="js/total.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <form>
            <div class="container">
                Number entry: <input name="entryNum" type="number" min="1" max="50"/>
                <div class="row">
                    <c:if test="${requestScope.listfeedbackstaffview != null}">
                        <c:if test="not empty ${requestScope.listfeedbackstaffview}">
                              <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Product Name</th>
                                <th>Rated Star</th>
                                <th>Date published</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="feedback" items="${requestScope.listfeedbackstaffview}">
                             <tr>
                                <td>${feedback.getUsername()}</td>
                                <td>${feedback. getProductName()}</td>
                                <td>${feedback.getStar()}</td>
                                <td>${feedback.getPublishedDate()}</td>
                               
                            </tr>
                        </c:forEach>
                           

                        </tbody>
                    </table>
                        </c:if>
                    </c:if>
                    
                  

                </div>
            </div>
        </form>
    </body>

</html>