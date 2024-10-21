
<html><head>
<title>Bank DB application</title></head>
<body bgcolor="ffffff"> 


<font face="times" size="3">
<hr noshade="noshade" size="2">

<h1>Bank Database</h1>
<b>Team Members:</b> Kalina Gavrilova, Hannah Macias, Hadiya Chishti, Ashleen Sandhu<br>
<br>
<hr>
<ul>
<li><b>Relations:</b>
<ol>

<!-- <li><a href="establish_connection.php" target="_blank">connect</a></li> -->

<li><a href="select_account.php" target="_blank">Account</a></li>
<li><a href="select_checking.php" target="_blank">Checking_Account</a></li>
<li><a href="select_savings.php" target="_blank">Savings_Account</a></li>
<li><a href="select_customer.php" target="_blank">Customer</a></li>
<li><a href="select_customer_account.php" target="_blank">Customer_Account</a></li>
<li><a href="select_bankbranch.php" target="_blank">BankBranch</a></li>
<li><a href="select_employee.php" target="_blank">Employee</a></li>
<li><a href="select_job.php" target="_blank">Job</a></li>
<li><a href="select_transaction.php" target="_blank">Transaction</a></li>
</li>
</ol>
<br><br>
<hr>
</li><li><b>Queries:</b>
<ol>
<li><a href="query1.php" target="_blank">Query1</a>: Find the full name of customers along with their account type and balance.
<li><a href="query2.php" target="_blank">Query2</a>: Calculating the balance across all savings accounts.
<li><a href="query3.php" target="_blank">Query3</a>: Find customers who have accounts with a balance greater than the average balance across all the other accounts.
<li><a href="query4.php" target="_blank">Query4</a>: Listing total number of accounts for each customer who has more than one account.
<li><a href="query5.php" target="_blank">Query5</a>: Find all customers with each of their bank branch addresses, even if some customers are not associated with a bank branch.

</li></ol>
<br><br>
<hr>
</i></li><li><b>Ad-hoc Query:</b>
<form method="POST" action="ad_hoc.php" target="_blank">
      <table>
        <tbody><tr>
          <td align="right">
            <strong>Please enter your query here<br></strong>
          </td>
          <td>
            <select id="action" name="action" fdprocessedid="0jxaqk">
            <option value="select">SELECT</option>
            <option value="insert into">INSERT INTO</option>
            <option value="update">UPDATE</option>
            <option value="delete from">DELETE FROM</option>
            </select>
            <input size="30" name="query" type="text" fdprocessedid="7n4fa">
          </td>
        </tr>
        <tr>
          <td align="right">
            <input value="Clear" type="reset">
          </td>
          <td>
            <input value="Submit" type="submit" fdprocessedid="cz71z">
          </td>
        </tr>
      </tbody></table>
    </form>
</i></li></ul><i>
<p></p>
</i></font><i><i>
<hr noshade="noshade" size="2">
<p></p>

</i></i>

</body>
</html>