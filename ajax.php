<?php
	$link = mysqli_connect('localhost', 'root', 'b93J81s0', 'republickey');
	if (!$link) {
		throw new My_Db_Exception('Database connection error: ' . mysql_error());
	}
	
	$hash = htmlspecialchars($_GET['hash']);
	$query = 'SELECT body FROM republickey.proposals WHERE hash=\'' . $hash . '\';';
	$result = mysqli_query($link, $query);
	if (!$result) {
		throw new My_Db_Exception('Database query error: ' . mysql_error());
	}

	foreach ($result as $row){
		echo $row['body'];
	}

	mysqli_close($link);
?>