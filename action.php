<!DOCTYPE html>
<html lang="en">
<html>
	<head>
		<title><?php echo htmlspecialchars($_POST['hash']); ?></title>
	</head>
	<body>
		<?php
			$link = mysqli_connect('localhost', 'root', 'b93J81s0', 'republickey');
			if (!$link) {
				throw new My_Db_Exception('Database connection error: ' . mysql_error());
			}
			
			$hash = htmlspecialchars($_POST['hash']);
			$query = 'SELECT body FROM republickey.proposals WHERE hash=\'' . $hash . '\';';
			$result = mysqli_query($link, $query);
			if (!$result) {
				throw new My_Db_Exception('Database query error: ' . mysql_error());
			}

			$body = '';
			foreach ($result as $row){
				$body = $row['body'];
			}

			mysqli_close($link);
		?>
	</body>
	<script src="md5.min.js"></script>
	<script type="text/javascript">
		var targetHash = "<?php echo $hash ?>";
		var sourceHtml = "<?php echo $body ?>";
		var sourceHash = md5(sourceHtml);
		
		var div = document.createElement('div');
		if (targetHash == sourceHash) {
			div.innerHTML = sourceHtml;
		}
		else {
			div.innerHTML = "<span>Hash mismatch.<br/>Target hash: [" + targetHash + "]<br/>Source hash: [" + sourceHash + "]</span>";
		}
		while (div.children.length > 0) {
			document.body.appendChild(div.children[0]);
		}
	</script>
</html>
