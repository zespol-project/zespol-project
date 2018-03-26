<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Vlad
  Date: 25.03.2018
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form:form action="/createJobType" method="post">
    <p>Enter jobtype:</p><input name="type"  id="type">
    <p>Enter price:</p><input name="pricePerHour" type="number" id="pricePerHour">

    <select name="id-store" id="id-store" >
        <c:forEach items="${storelist}" var="store">
            <option  value="${store.id}">
                    ${store.name}
                    ${store.city}
            </option>
        </c:forEach>
    </select>

    <button type="submit">Create jobtype</button>


</form:form>

<form>
    <input id="filter" data-type="search">
</form>

<table data-role="table" data-column-btn-theme="b" data-mode="columntoggle" data-filter="true" data-input="#filter" class="ui-responsive table-stroke">


        <thead>
           <tr>
            <th data-priority="1">ID</th>
                     <th data-priority="2">JobType</th>
                     <th data-priority="3">Price</th>
                     <th data-priority="4">Shop</th>

                   </tr>
        </thead>
    <c:forEach items="${jobtypeList}" var="job">
        <tbody>
        <tr>
            <td>${job.id}</td>
            <td>${job.type}</td>
            <td>${job.pricePerHour}</td>
            <td>${job.store.name}, ${job.store.city}</td>

        </tr>

        </tbody>
    </c:forEach>
</table>
</body>
</html>
