<?php
include_once 'CrudController.php';
$crudcontroller = new CrudController();
$result = $crudcontroller->readData();
?>

<html>
<head>
<!--      
this page is meant to show products and to test the fuctionality of the Crud functions for our business logic -->
<title>Your Products</title>
<!--      
delete  bootstrap -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">

<!--      
delete above -->  

<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link href="css/dashboard.css" rel="style sheet" type="text/css"/>

<script src="crudEvent.js"></script>

</head>
<body id="wrapper">
<main role="main" >
    <div class="row">
        <a href="add.php"><button class="btn btn-primary btn-add">Add New Record</button></a>
    </div>

    <div class="row" id="container">
    <?php require_once "list.php" ?>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="edit-modal" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                        data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="frmEdit">
                        <div class="form-group">
                            <div class="row">
                                <label>Title</label> <input type="text"
                                    name="title" id="title"
                                    class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label>Description</label>
                                <textarea class="form-control"
                                    id="description"
                                    name="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label>URL</label> <input type="text"
                                    name="url" id="url"
                                    class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label>Category</label> <input
                                    type="text" name="category"
                                    id="category"
                                    class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <input type="text" name="id"
                                    id="id" class="form-control"
                                    hidden="true">
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary"
                        id="update">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal ends here -->

    <!-- Modal for message-->
    <div class="modal fade" id="messageModal" tabindex="-1"
        role="dialog" data-backdrop="static"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                    <button type="button" class="close"
                        data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4 class="text-center" id="msg"></h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal ends here -->
    </main>
</body>
</html>