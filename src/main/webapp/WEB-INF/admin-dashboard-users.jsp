<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Peter de Vroom
  Date: 9/09/2023
  Time: 11:42 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% List<Member> members = (List<Member>) request.getAttribute("members"); %>

        <html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin-dashboard.css">
</head>
<body>
<%@ include file="jspf/header.jspf"%>
<div>
    <%@ include file="jspf/admin-sidenav.jspf" %>
    <main class="content">
        <input type="search" oninput="onSearchChanged(this.value)" class="form-control w-50" placeholder="Search..."/>

        <div class="container mt-2 ml-0 ps-0">
            <% for (Member member : members) { %>
                <div id="<%= member.getFullName().toLowerCase() %>" class="card mb-2">
                    <div class="card-body d-flex">
                        <div>
                            <%= member.getFullName() %>
                        </div>
                        <% if (member.isAdmin()) { %>
                            <div class="ms-2">
                                - Admin -
                            </div>
                        <% } %>
                    </div>
                </div>
            <% } %>
        </div>
    </main>
</div>

</body>
</html>

<script>
    let userCards = document.querySelectorAll('.card')

    /**
     * Filters through users by their full name
     * @param {String} value
     */
    function onSearchChanged(value) {
        const query = value.toLowerCase();
        for (const card of userCards) {
            card.hidden = !card.id.includes(query);
        }
    }
</script>
