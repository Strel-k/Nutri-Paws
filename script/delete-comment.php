<?php
include "database.php";

// Check if comment ID is provided
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['comment_id'])) {
    $comment_id = mysqli_real_escape_string($connection, $_POST['comment_id']);

    // Delete comment from database
    $deleteCommentSql = "DELETE FROM comments WHERE id = '$comment_id'";
    if (mysqli_query($connection, $deleteCommentSql)) {
        // Redirect back to the product page after deletion
        header("Location: {$_SERVER['HTTP_REFERER']}");
        exit();
    } else {
        echo "Error deleting comment: " . mysqli_error($connection);
    }
} else {
    // Handle if comment ID is not provided
    echo "Comment ID not provided.";
}
?>
