<?php
$sql = "SELECT Customer.Customer_Fname, Customer.Customer_Lname, COUNT(Customer_Account.Account_ID) AS Total_Accounts
FROM Customer
INNER JOIN Customer_Account ON Customer.Customer_ID = Customer_Account.Customer_ID
GROUP BY Customer.Customer_ID
HAVING COUNT(Customer_Account.Account_ID) > 1";

require_once "conn.php"; 

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

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

?>