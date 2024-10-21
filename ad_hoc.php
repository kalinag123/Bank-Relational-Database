<?php
$sql = $_POST["action"]  . " " .  $_POST["query"];

require_once "conn.php"; 

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

if($_POST["action"] == "select") {
    // if action is select, output will be of result type and needs to be displayed. 
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
    echo "<table border = '1'>\n";
    // output data of each row
    // this creates an array of column names so that they can be displayed above the result rows. 
    $col_names = [];
    while ($field_info = $result->fetch_field()) {
        $col_names[] = $field_info->name;
    }
    echo "<tr>\n";
    $num_fields = mysqli_num_fields($result);
    for ($i = 0; $i < $num_fields; $i++) {
        echo "<th>" . $col_names[$i] . "</th>\n";
    }
    echo "</tr>\n";
        while($row = mysqli_fetch_row($result)) {
        echo "<tr>\n";
        $cols = mysqli_num_fields($result); 
        for ($i = 0; $i < $cols; $i++) {
            echo "<td>" . $row[$i] . "</td>\n";
        }
        echo "</tr>\n";
    }
    echo "</table>\n";
    } else {
    echo "0 results";
    } 
    mysqli_free_result($result);
}

if($_POST["action"] == "insert into") {
    // if action is insert into, result will be of bool type. 
    $result = mysqli_query($conn, $sql);
    if ($result === TRUE) {
        echo "New record created successfully";
      } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
      } 
}

if($_POST["action"] == "update") {
    // if action is update, result will be of bool type. 
    $result = mysqli_query($conn, $sql);
    if ($result === TRUE) {
        echo "Record updated successfully";
      } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
      } 
}

if($_POST["action"] == "delete from") {
    // if action is delete from, result will be of bool type. 
    $result = mysqli_query($conn, $sql);
    if ($result === TRUE) {
        echo "Record deleted successfully";
      } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
      } 
}

$conn->close();


?>