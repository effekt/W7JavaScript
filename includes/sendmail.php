<?
	$subject = $_POST['subj'];
	$message = $_POST['mess'];
	$sender = $_POST['sndr'];
	
	$message .= "<p><br />IP:   " . $_SERVER[REMOTE_ADDR];
	
	$replaceThese = array( 	array("[blue]", "<font color='blue'>"),
							array("[/blue]", "</font>"),
							array("[red]", "<font color='red'>"),
							array("[/red]", "</font>"),
							array("[green]", "<font color='green'>"),
							array("[/green]", "</font>"),
							array("[u]", "<u>"),
							array("[/u]", "</u>"),
							array("[b]", "<b>"),
							array("[/b]", "</b>"),
							array("[i]", "<i>"),
							array("[/i]", "</i>"));
	
	for ($x = 0; $x < 12; $x++) {
		$message = str_replace($replaceThese[$x][0], $replaceThese[$x][1], $message);
	}
	
	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	$headers .= 'From: ' . $sender . "\r\n";
	if (mail('example@example.com', $subject, $message, $headers)) {
		echo "E-mail successfully sent";
	} else {
		echo "E-mail was not successfully sent";
	}
?>