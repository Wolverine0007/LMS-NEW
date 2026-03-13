<?php
session_start();
require_once "../includes/config.php";
require_once "../includes/header.php";

// Admin access control
if (!isset($_SESSION['role']) || ($_SESSION['role'] !== 'admin' && $_SESSION['role'] !== 'staff')) {
    header("Location: ../index.php");
    exit();
}

// SECURE DELETE LOGIC
if (isset($_GET['delete'])) {
    if ($_SESSION['role'] !== 'admin') {
        header("Location: manage-books.php?msg=denied");
        exit();
    }

    $acc_no = $_GET['delete'];

    $stmt_check = mysqli_prepare($connection, "SELECT status FROM books WHERE accession_number = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt_check, "s", $acc_no);
    mysqli_stmt_execute($stmt_check);
    $book = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt_check));

    if (!$book) {
        header("Location: manage-books.php?msg=notfound");
        exit();
    }

    if ((int)$book['status'] === 0) {
        header("Location: manage-books.php?msg=issued");
        exit();
    }

    $stmt_del = mysqli_prepare($connection, "UPDATE books SET is_deleted = 1 WHERE accession_number = ?");
    mysqli_stmt_bind_param($stmt_del, "s", $acc_no);

    if (mysqli_stmt_execute($stmt_del)) {
        header("Location: manage-books.php?msg=deleted");
    } else {
        header("Location: manage-books.php?msg=error");
    }
    exit();
}
?>

<style>
/* ===== GLOBAL LAYOUT ===== */
html, body { height: 100vh; overflow: hidden; background-color: #f4f7f6; }
.main-wrapper { display: flex; height: 100vh; width: 100vw; }
.content-area { flex-grow: 1; display: flex; flex-direction: column; overflow: hidden; }

/* ===== STICKY ELEMENTS ===== */
.sticky-header { position: sticky; top: 0; background: #fff; padding: 20px 30px; border-bottom: 2px solid #eee; margin-left: 240px; z-index: 1000; }
.fixed-search-bar { position: sticky; top: 78px; background: #fff; padding: 15px 30px; border-bottom: 1px solid #e5e5e5; margin-left: 240px; z-index: 999; }
.main-content { flex-grow: 1; overflow-y: auto; padding: 0 30px 100px 30px; position: relative; }

/* ===== TABLE LAYOUT & COLUMN WIDTHS ===== */
#booksTable { table-layout: fixed; width: 100%; border-collapse: separate; }
#booksTable th:nth-child(1) { width: 28%; }   /* Book Title */
#booksTable th:nth-child(2) { width: 18%; }   /* Author */
#booksTable th:nth-child(3) { width: 13%; }   /* Publisher */
#booksTable th:nth-child(4) { width: 90px; }  /* Edition */
#booksTable th:nth-child(5) { width: 100px; } /* Available */
#booksTable th:nth-child(6) { width: 100px; } /* Issued */
#booksTable th:nth-child(7) { width: 100px; } /* Total */
#booksTable th:nth-child(8) { width: 120px; } /* Actions */

#booksTable td { vertical-align: middle; white-space: nowrap; padding: 12px 10px; position: relative; }

/* CLICKABLE POP-UP STYLE */
.expand-btn { display: block; overflow: hidden; text-overflow: ellipsis; cursor: pointer; color: inherit; }
.expand-btn:hover { color: #007bff; text-decoration: underline; }

.pop-info { 
    display: none; position: absolute; background: white; z-index: 1050; 
    white-space: normal; padding: 12px; border-radius: 6px; 
    box-shadow: 0 8px 24px rgba(0,0,0,0.2); border: 2px solid #141D49; 
    min-width: 280px; top: 50%; transform: translateY(-50%); left: 10px; 
}

#booksTable thead th { position: sticky; top: 0; z-index: 10; background-color: #f8f9fa; box-shadow: inset 0 -1px 0 #dee2e6; }

.status-available { color: #28a745; font-weight: bold; }
.status-issued { color: #dc3545; font-weight: bold; }
</style>

<div class="main-wrapper">
    <?php include "../sidebar.php"; ?>

    <div class="content-area">
        <div class="sticky-header d-flex justify-content-between align-items-center">
            <h3 class="m-0 font-weight-bold">Manage Library Books</h3>
            <div class="d-flex">
                <a href="view-issued-books.php" class="btn btn-outline-primary mr-2">
                    <i class="fas fa-hand-holding mr-2"></i> Issued Books
                </a>
                <a href="add-book.php" class="btn btn-primary">
                    <i class="fas fa-plus-circle mr-2"></i> Add New Book
                </a>
            </div>
        </div>

        <div class="fixed-search-bar">
            <input type="text" id="tableSearch" class="form-control" placeholder="Search Title, Author, or Accession Number...">
        </div>

        <div class="main-content">
            <?php if (isset($_GET['msg'])): ?>
                <div class="alert alert-info mt-3 alert-dismissible fade show shadow-sm">
                    <i class="fas fa-info-circle mr-2"></i> 
                    <?php 
                        if($_GET['msg'] === 'denied') echo "Only Administrators can delete books.";
                        if($_GET['msg'] === 'deleted') echo "Book copy removed successfully.";
                        if($_GET['msg'] === 'issued') echo "Cannot delete a book that is currently issued.";
                        if($_GET['msg'] === 'notfound') echo "Book not found.";
                    ?>
                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
                </div>
            <?php endif; ?>

            <div class="card shadow-sm border-0 mt-3">
                <div class="card-body p-0">
                    <table class="table table-hover mb-0" id="booksTable">
                        <thead class="thead-light">
                            <tr>
                                <th class="pl-4">Book Title</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th class="text-center">Edition</th>
                                <th class="text-center">Available</th>
                                <th class="text-center">Issued</th>
                                <th class="text-center">Total Copies</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        function extractEdition($title) {
                            if (preg_match('/(\d+)(st|nd|rd|th)\s*(E|edition|ed)/i', $title, $matches)) {
                                return $matches[1] . $matches[2];
                            }
                            return 'N/A';
                        }
                        
                        $query = "SELECT title, author, publisher, 
                                  SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) as available_count,
                                  SUM(CASE WHEN status = 0 THEN 1 ELSE 0 END) as issued_count,
                                  COUNT(*) as total_copies,
                                  MIN(accession_number) as first_acc_no,
                                  MAX(CASE WHEN status = 1 THEN accession_number END) as available_acc_no
                                  FROM books 
                                  WHERE is_deleted = 0 
                                  GROUP BY title, author, publisher 
                                  ORDER BY title ASC";
                        $result = mysqli_query($connection, $query);
                        while ($row = mysqli_fetch_assoc($result)) {
                            $edition = extractEdition($row['title']);
                            $available_count = (int)$row['available_count'];
                            $issued_count = (int)$row['issued_count'];
                            $has_available = $available_count > 0;
                            $edit_acc = $has_available ? $row['available_acc_no'] : $row['first_acc_no'];
                        ?>
                            <tr>
                                <td class="pl-4">
                                    <span class="expand-btn"><?php echo htmlspecialchars($row['title']); ?></span>
                                    <div class="pop-info"><?php echo htmlspecialchars($row['title']); ?></div>
                                </td>
                                <td>
                                    <span class="expand-btn"><?php echo htmlspecialchars($row['author']); ?></span>
                                    <div class="pop-info"><?php echo htmlspecialchars($row['author']); ?></div>
                                </td>
                                <td>
                                    <span class="expand-btn"><?php echo htmlspecialchars($row['publisher']); ?></span>
                                    <div class="pop-info"><?php echo htmlspecialchars($row['publisher']); ?></div>
                                </td>
                                <td class="text-center">
                                    <span class="badge badge-info" style="font-size: 13px;"><?php echo $edition; ?></span>
                                </td>
                                <td class="text-center">
                                    <?php if ($available_count > 0): ?>
                                        <span class="badge badge-success" style="font-size: 14px;"><?php echo $available_count; ?></span>
                                    <?php else: ?>
                                        <span class="badge badge-secondary" style="font-size: 12px;">Not Available</span>
                                    <?php endif; ?>
                                </td>
                                <td class="text-center">
                                    <?php if ($issued_count > 0): ?>
                                        <span class="badge badge-danger" style="font-size: 14px;"><?php echo $issued_count; ?></span>
                                    <?php else: ?>
                                        <span class="badge badge-light" style="font-size: 13px;">0</span>
                                    <?php endif; ?>
                                </td>
                                <td class="text-center">
                                    <span class="badge badge-primary" style="font-size: 14px;"><?php echo $row['total_copies']; ?></span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center">
                                        <?php if ($_SESSION['role'] === 'admin'): ?>
                                            <?php if ($has_available): ?>
                                                <a href="edit-book.php?id=<?php echo $edit_acc; ?>" class="btn btn-sm btn-outline-info mr-1" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                
                                                <a href="manage-books.php?delete=<?php echo $edit_acc; ?>" 
                                                class="btn btn-sm btn-outline-danger" 
                                                onclick="return confirm('Are you sure you want to remove this book?')">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            <?php else: ?>
                                                <button class="btn btn-sm btn-outline-secondary mr-1" disabled title="Cannot edit while issued">
                                                    <i class="fas fa-lock"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-secondary" disabled title="Cannot delete while issued">
                                                    <i class="fas fa-lock"></i>
                                                </button>
                                            <?php endif; ?>
                                        <?php else: ?>
                                            <button class="btn btn-sm btn-outline-secondary mr-1" disabled title="Admin Only">
                                                <i class="fas fa-lock"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary" disabled title="Admin Only">
                                                <i class="fas fa-lock"></i>
                                            </button>
                                        <?php endif; ?>
                                    </div>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for viewing copies -->
<div class="modal fade" id="copiesModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Book Copies</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
            </div>
            <div class="modal-body" id="copiesContent">
                <div class="text-center"><i class="fas fa-spinner fa-spin"></i> Loading...</div>
            </div>
        </div>
    </div>
</div>

<?php include "../includes/footer.php"; ?>

<script>
$(document).ready(function () {
    $("#tableSearch").on("keyup", function () {
        let value = $(this).val().toLowerCase();
        $("#booksTable tbody tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $('.expand-btn').on('click', function(e) {
        e.stopPropagation();
        $('.pop-info').not($(this).next('.pop-info')).fadeOut(100);
        $(this).next('.pop-info').fadeToggle(200);
    });

    $(document).on('click', function() {
        $('.pop-info').fadeOut(100);
    });

    $('.view-copies').on('click', function() {
        const title = $(this).data('title');
        const author = $(this).data('author');
        const publisher = $(this).data('publisher');
        
        $('#copiesModal').modal('show');
        $('#copiesContent').html('<div class="text-center"><i class="fas fa-spinner fa-spin"></i> Loading...</div>');
        
        $.ajax({
            url: 'get-book-copies.php',
            method: 'POST',
            data: { title: title, author: author, publisher: publisher },
            success: function(response) {
                $('#copiesContent').html(response);
            },
            error: function() {
                $('#copiesContent').html('<div class="alert alert-danger">Error loading copies</div>');
            }
        });
    });
});
</script>