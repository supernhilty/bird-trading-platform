<%-- 
    Document   : feedback
    Created on : Jun 3, 2023, 10:38:32 PM
    Author     : leyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">    

        <title>feedback</title>
        <link rel="stylesheet" href="css/feedback.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <form action="product">
            <div class="container">
                <div id="reviews" class="review-section">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h4 class="m-0">${requestScope.totalfeedback} Reviews</h4>


                    </div>

                </div>

                <div class="review-list">
                    <c:if test="${requestScope.feedbacklist!=null}">
                        <c:if test="${not empty requestScope.feedbacklist}">
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="stars-counters">
                                        <tbody>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: ${requestScope.fivestar/requestScope.totalfeedback};"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(${requestScope.fivestar})</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">4 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: ${requestScope.fourstar/requestScope.totalfeedback};"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(${requestScope.fourstar})</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">3 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: ${requestScope.threestar/requestScope.totalfeedback};"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(${requestScope.threestar})</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">2 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: ${requestScope.twostar/requestScope.totalfeedback};"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(${requestScope.twostar})</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">1 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: ${requestScope.onestar/requestScope.totalfeedback};"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(${requestScope.onestar})</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <c:forEach var="feedback" items="requestScope.feedbacklist">
                                <ul>
                                    <li>
                                        <div class="d-flex">
                                            <div class="left">
                                                <span>
                                                    <img src="${feeback.getAvatar()}" class="profile-pict-img img-fluid" alt="" />
                                                </span>
                                            </div>
                                            <div class="right">
                                                <h4>
                                                   
                                                    <span class="gig-rating text-body-2">
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                                        <path
                                                            fill="currentColor"
                                                            d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"
                                                            ></path>
                                                        </svg>
                                                        ${feedback.getStar()}
                                                    </span>
                                                </h4>

                                                <div class="review-description">
                                                    <p>${feedback.getDetail()}</p>
                                                </div>
                                                <span class="publish py-3 d-inline-block w-100">Published ${feedback.getPublishedDate()}</span>


                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </c:forEach>
                        </c:if>
                    </c:if>

                </div>
            </div>
        </form>
    </body>
</html>