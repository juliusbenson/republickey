<script src="web3.min.js"></script>
<script>
 var Web3 = require('web3');
 var web3 = new Web3();
 console.log(web3);
 web3.setProvider(new web3.providers.HttpProvider('http://localhost:8545'));
</script>
<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
	<?php
	$link = mysqli_connect('localhost', 'root', '', 'republickey');
	if (!$link) {
		throw new My_Db_Exception('Database connection error: ' . mysql_error());
	}
	
	$query = 'SELECT * FROM republickey.proposals;';
	$result = mysqli_query($link, $query);
	if (!$result) {
		throw new My_Db_Exception('Database query error: ' . mysql_error());
	}
	
	echo '<table>';
	foreach ($result as $row){
		echo '<tr>';
		echo '<td>' . $row['hash'] . '</td>';
		echo '<td>' . $row['body'] . '</td>';
		echo '</tr>';
	}
	echo '</table>';
	
	mysqli_close($link);
	?>
 </body>
</html>