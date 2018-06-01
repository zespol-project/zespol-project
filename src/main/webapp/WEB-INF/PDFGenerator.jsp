<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="https" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/js/PDFGenerator.js" />"></script>
    <style>
        <%@include file="../resources/css/toast.css" %>
        <%@include file="../resources/css/main.css" %>
        <%@include file="../resources/css/PDFGenerator.css" %>
    </style>


    <title>Stores</title>

</head>
<body>
<sec:authentication var="principal" property="principal"/>

<%@include file="nav.jsp" %>

<section class="hero">
    <div class="hero-body" style="padding: 10px">
        <div class="container">
            <h2 class="title">
                Pdf generator page
            </h2>
            <h2 class="subtitle">
            </h2>
            <div class="containerPB">
                <ul class="progressbar">
                    <li id="workplace" class="active">Workplace</li>
                    <li id="time">Time</li>
                    <li id="download">Download</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="tile is-ancestor">

        <div class="tile is-parent">
            <div class="tile is-parent is-3">
            </div>

            <div class="tile is-parent is-6">
                <form:form method="post" action="/generatePDF/download/PDFName.pdf">
                    <article id="workplaceContent" class="tile is-child box ">
                        <span>Select workplace</span>
                        <div class="field">
                            <div class="control">
                                <div class="select is-medium">
                                    <select name="storeId">
                                        <c:forEach items="${stores}" var="store">
                                            <option value="${store.id} ">${store.name} - ${store.city} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <a class="button is-primary" onclick="changeContent1()"> Next</a>
                    </article>

                    <article id="timeContent" class="tile is-child box ">
                        time

                        <a class="button" onclick="changeContent2()"> Next</a>
                    </article>

                    <article id="downloadContent" class="tile is-child box ">
                        Get your pdf

                        <button type="submit" class="button is-primary">Download</button>

                    </article>
                </form:form>
            </div>

        </div>
    </div>
</section>


<c:if test="${not empty message}">
    <div id="snackbar"><span>${message}</span></div>
    <script>
        showToast();
    </script>
</c:if>

</body>
</html>