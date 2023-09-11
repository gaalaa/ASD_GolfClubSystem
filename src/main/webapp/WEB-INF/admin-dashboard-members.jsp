<%--
  Created by IntelliJ IDEA.
  User: Peter de Vroom
  Date: 9/09/2023
  Time: 11:42 am
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%
    @SuppressWarnings("unchecked")
    List<Member> members = (List<Member>) request.getAttribute("members");
%>

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
        <input name="search" id="search" type="search" oninput="onSearchChanged(this.value)" class="form-control w-50" placeholder="Search..."/>
        <label for="search" hidden="hidden">Search</label>

        <div class="mt-2 ml-0 ps-0">
            <% for (Member member : members) { %>
                <div data-asd-name="<%= member.getFullName().toLowerCase() %>" data-asd-id="<%= member.getId() %>" class="card mb-2">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div class="d-flex">
                            <div>
                                <%= member.getFullName() %>
                            </div>
                            <% if (member.isAdmin()) { %>
                            <div class="ms-2">
                                - Admin -
                            </div>
                            <% } %>
                        </div>
                        <div class="d-flex">
                            <button class="btn btn-primary me-2" onclick="onEditClicked(<%= member.getId() %>)">Edit</button>
                            <button class="btn btn-danger" onclick="onDeleteClicked(<%= member.getId() %>)">Delete</button>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </main>
</div>
</body>
       <%--   Edit Modal  --%>
        <div id="edit-modal" class="modal fade">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Member</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/member/edit" method="post" id="editMemberForm">
                            <div class="mb-3 row">
                                <label for="idEdit" class="col-sm-2 col-form-label">Member ID</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="idEdit" value="">
                                </div>
                            </div>
                            <div class="mb-3 row d-flex">
                                <div class="d-flex gap-2">
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="firstName" id="firstNameEdit" placeholder=" "/>
                                        <label for="firstNameEdit">First Name</label>
                                    </div>
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="lastName" id="lastNameEdit" placeholder=" "/>
                                        <label for="lastNameEdit">Last Name</label>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="email" id="emailEdit" placeholder=" "/>
                                        <label for="emailEdit">Email Address</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" form="editMemberForm" class="btn btn-primary">Save Changes</button>
                    </div>
                </div>
            </div>
        </div>

        <%--   Delete Modal  --%>
        <div id="delete-modal" class="modal fade">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Member?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this member?</p>
                        <p>This can't be undone.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" id="confirmDeleteButton" class="btn btn-primary" onclick="onDeleteModalConfirmClicked()">Delete</button>
                    </div>
                </div>
            </div>
        </div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
    // Note(Pete): The data-asd-* attributes are custom in order to hydrate the page to feel interactive.

    let memberCards = document.querySelectorAll('[data-asd-name]');
    const editModal = new bootstrap.Modal(document.querySelector('#edit-modal'), {});
    const deleteModal = new bootstrap.Modal(document.querySelector('#delete-modal'), {});
    const confirmDeleteButton = document.querySelector('#confirmDeleteButton');

    /**
     * Filters through users by their full name
     * @param {String} value
     */
    function onSearchChanged(value) {
        const query = value.toLowerCase();
        for (const card of memberCards) {
            card.hidden = !card.attributes['data-asd-name'].nodeValue.includes(query);
        }
    }

    /**
     * Show an edit modal.
     * @param {Number} id
     */
    async function onEditClicked(id) {
        // Note(Pete): The funky escaped interpolator (\${}) is because the JSP Expression Language interferes
        // with the JS syntax.
        const response = await fetch(`${pageContext.request.contextPath}/admin/member/edit?memberId=\${id}`);
        if (response.status !== 200) {
            console.error(response.status, response.statusText);
        }

        const data = (await response.json());
        console.log(response, data);

        document.querySelector('#idEdit').value = id;
        document.querySelector('#firstNameEdit').value = data.firstName;
        document.querySelector('#lastNameEdit').value = data.lastName;
        document.querySelector('#emailEdit').value = data.email;

        editModal.show();
    }

    /**
     * Show a delete modal.
     * @param {Number} id
     */
    function onDeleteClicked(id) {
        deleteModal.show();

        // Give the confirm delete button a function that will delete the correct member when clicked.
        confirmDeleteButton.onclick = async () => {
            const response = await fetch(`${pageContext.request.contextPath}/admin/member/edit?memberId=\${id}`, {
                method: 'DELETE',
            });

            if (response.status === 200) {
                const member = document.querySelector(`[data-asd-id="\${id}"]`);
                member.remove();
            }

            deleteModal.hide();
        };
    }
</script>
</html>

