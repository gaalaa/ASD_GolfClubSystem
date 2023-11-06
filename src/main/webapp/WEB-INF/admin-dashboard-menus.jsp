<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.golfclub.golfclubsystem.models.Menu" %>
<%@ page import="java.util.ArrayList" %>

<html>
    <head>
        <title>Admin Dashboard - Menus</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3_slideshow.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courseInfo.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin-dashboard.css">
    </head>
    <body>
        <%@ include file="jspf/header.jspf" %>
        <div>
            <%@ include file="jspf/admin-sidenav.jspf" %>
            <%
                List<Menu> menus = (List<Menu>) request.getAttribute("menus");
                List<Menu> foods = new ArrayList<>();
                List<Menu> beverages = new ArrayList<>();

                //Check if the item is beverage, if it is, put it into the beverages. If it is not, put it into foods.
                //Then put all the items in the beverages into foods. And display foods.
                //This way foods display first then beverages.
                if (menus != null) {
                    for (Menu menu : menus) {
                        if (menu.isBeverage()) {
                            beverages.add(menu);
                        } else {
                            foods.add(menu);
                        }
                    }
                }
                foods.addAll(beverages);
            %>

        <main class="content">
            <div class="d-flex justify-content-between">
                <button class="btn btn-outline-primary" onclick="onAddMenuClicked()">Add Menu</button>
            </div>

            <div class="mt-2 ml-0 ps-0">
                <% for (Menu menu: foods) { %>
                    <div class="card mb-2">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div class="d-flex">
                                <div>
                                    <%= menu.getMenuName() %>
                                </div>
                                <div class="ms-2">
                                    - $<%= menu.getMenuPrice() %>
                                </div>
                            </div>
                            <div class="d-flex">
                                <button class="btn btn-primary me-2" onclick="onEditClicked('<%=menu.getMenuID()%>', '<%=menu.getMenuName()%>',
                                        '<%=menu.getMenuPrice()%>', '<%=menu.getMenuDescription()%>', '<%=menu.isBeverage()%>')">Edit</button>
                                <button class="btn btn-danger" onclick="onDeleteClicked('<%=menu.getMenuID()%>')">Delete</button>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </main>

        <%--  Add Modal  --%>
        <div id="addModal" class="modal">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Menu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-menu-form" action="${pageContext.request.contextPath}/adminAddMenu-servlet" method="post">
                            <div class="mb-3 row d-flex">
                                <div class="d-flex gap-2">
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="menuName" id="menuName-add"
                                               placeholder=" "/>
                                        <label for="menuName-add">Menu Name</label>
                                    </div>
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="menuPrice" id="menuPrice-add"
                                               placeholder=" "/>
                                        <label for="menuPrice-add">Menu Price</label>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="menuDescription" id="menuDescription-add" placeholder=" "/>
                                        <label for="menuDescription-add">Menu Description</label>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="col form-floating mb-3">
                                        <input type="text" class="form-control" name="menuBeverage" id="menuBeverage-add" placeholder=" "/>
                                        <label for="menuBeverage-add">Is It Beverage? (true/false)</label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type ="button" id="add-menu-button" class="btn btn-primary" onclick="addMenu()">Add Menu</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <%--  Edit Modal  --%>
        <div id="editModal" class="modal">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Menu Item</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="edit-menu-form" action="${pageContext.request.contextPath}/adminEditMenu-servlet" method="post">
                        <div class="mb-3 row">
                            <label for="menuID-edit" class="col-sm-2 col-form-label">Menu ID</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" name="menuId" id="menuID-edit" value="">
                            </div>
                        </div>
                        <div class="mb-3 row d-flex">
                            <div class="d-flex gap-2">
                                <div class="col form-floating mb-3">
                                    <input type="text" class="form-control" name="menuName" id="menuName-edit" placeholder=" "/>
                                    <label for="menuName-edit">Menu Name</label>
                                </div>
                                <div class="col form-floating mb-3">
                                    <input type="text" class="form-control" name="menuPrice" id="menuPrice-edit" placeholder=" "/>
                                    <label for="menuPrice-edit">Menu Price</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="col form-floating mb-3">
                                    <input type="text" class="form-control" name="menuDescription" id="menuDescription-edit" placeholder=" "/>
                                    <label for="menuDescription-edit">Menu Description</label>
                                </div>
                            </div>
                            <div>
                                <div class="col form-floating mb-3">
                                    <input type="text" class="form-control" name="menuBeverage" id="menuBeverage-edit" placeholder=" "/>
                                    <label for="menuBeverage-edit">Is it Beverage? (true/false)</label>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" id="save-changes-button" class="btn btn-primary" onclick="editMenu()">Save Changes</button>
                    </div>
                </div>
            </div>
        </div>

        <%--  Delete Modal  --%>
        <div id="deleteModal" class="modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Menu?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="delete-menu-form" action="${pageContext.request.contextPath}/adminDeleteMenu-servlet" method="post">
                            <div class="mb-3 row">
                                <div class="col-sm-10">
                                    <input type="hidden" class="form-control-plaintext" name="menuId" id="menuID-delete" value="">
                                </div>
                            </div>
                            <p>Are you sure you want to delete this menu?</p>
                            <p>This can't be undone.</p>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" id="confirm-delete-button" class="btn btn-primary" onclick="deleteMenu()">Delete</button>
                    </div>
                </div>
            </div>
        </div>


        <script>
            var addModal = document.getElementById('addModal');
            var editModal = document.getElementById('editModal');
            var deleteModal = document.getElementById('deleteModal');

            //Information of clicked menu item is stored into these variables
            var menuIDEdit = document.getElementById('menuID-edit');
            var menuNameEdit = document.getElementById('menuName-edit');
            var menuPriceEdit = document.getElementById('menuPrice-edit');
            var menuDescriptionEdit = document.getElementById('menuDescription-edit');
            var menuBeverageEdit = document.getElementById('menuBeverage-edit');
            var menuIDDelete = document.getElementById('menuID-delete');

            //variables for cancel buttons
            var cancelBtnHeaderEdit = document.querySelector('#editModal .modal-header button[data-bs-dismiss="modal"]');
            var cancelBtnFooterEdit = document.querySelector('#editModal .modal-footer button[data-bs-dismiss="modal"]');
            var cancelBtnHeaderDelete = document.querySelector('#deleteModal .modal-header button[data-bs-dismiss="modal"]');
            var cancelBtnFooterDelete = document.querySelector('#deleteModal .modal-footer button[data-bs-dismiss="modal"]');
            var cancelBtnHeaderAdd = document.querySelector('#addModal .modal-header button[data-bs-dismiss="modal"]');
            var cancelBtnFooterAdd = document.querySelector('#addModal .modal-footer button[data-bs-dismiss="modal"]');

            //cancel buttons for all modals
            cancelBtnHeaderAdd.addEventListener('click', function() { addModal.style.display = 'none'; });
            cancelBtnFooterAdd.addEventListener('click', function() { addModal.style.display = 'none'; });
            cancelBtnHeaderEdit.addEventListener('click', function() { editModal.style.display = 'none'; });
            cancelBtnFooterEdit.addEventListener('click', function() { editModal.style.display = 'none'; });
            cancelBtnHeaderDelete.addEventListener('click', function() { deleteModal.style.display = 'none'; });
            cancelBtnFooterDelete.addEventListener('click', function() { deleteModal.style.display = 'none'; });



            //these codes r responsible for adding menu item to the list
            function onAddMenuClicked() { addModal.style.display = 'block'; }
            function addMenu() { document.getElementById('add-menu-form').submit(); }



            //So when I click Edit button, it will send that clicked item's information to onEditClicked function
            //Then set the values of these newly created variables in the modal with those retrieved data
            function onEditClicked(menuID, menuName, menuPrice, menuDescription, menuBeverage) {
                menuIDEdit.value = menuID;
                menuNameEdit.value = menuName;
                menuPriceEdit.value = menuPrice;
                menuDescriptionEdit.value = menuDescription;
                menuBeverageEdit.value = menuBeverage;
                editModal.style.display = 'block';
            }
            function editMenu() { document.getElementById('edit-menu-form').submit(); }



            //these codes r responsible for deleting menu item from the list
            function onDeleteClicked(menuID) {
                menuIDDelete.value = menuID;
                deleteModal.style.display = 'block';
            }
            function deleteMenu() { document.getElementById('delete-menu-form').submit(); }
        </script>
    </body>
</html>