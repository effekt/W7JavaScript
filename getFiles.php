<?php

$dir = $_POST['fdir'];

if (strpos($dir, "files") === false) {
	die("Error retreiving files.");
}

if ($handle = opendir($dir)) {
	while (false !== ($entry = readdir($handle))) {
		if ($entry != ".." && $entry != ".") {
			if (strpos($entry, ".") === false) {
				print ("<div class='dfile'>
					<div class='fname' onclick='getDownloads(\"files/$entry\");'><img src='images/extensions/dir.png' alt='' />&nbsp;&nbsp;$entry</div>
					<div class='fdate'>" . date("n/j/Y g:i A", filectime("$dir/" . $entry)) . "</div>
					<div class='ftype'>DIR</div>
					<div class='fsize'></div>
				</div>");
			}
		}
	}
}

if ($handle = opendir($dir)) {
	while (false !== ($entry = readdir($handle))) {
		if ($entry != ".." && $entry != ".") {
			if (strpos($entry, ".") !== false) {
				$entrySize = ((filesize("$dir/" . $entry)/1000/1000));
				if ($entrySize < 1) {
					$entrySize *= 1000;
					$entrySize = number_format($entrySize, 0);
					$entrySize = $entrySize . "KB";
				} else {
					$entrySize = number_format($entrySize, 2);
					$entrySize = $entrySize . "MB";
				}
				$fileType = explode(".", $entry);
				print ("<div class='dfile'>
					<a href='$dir/$entry' target='_blank'><div class='fname'><img src='images/extensions/" . $fileType[count($filetype+1)] . ".png' alt='' border='0' />&nbsp;&nbsp;" . $fileType[count($filetype)] . "</div></a>
					<div class='fdate'>" . date("n/j/Y g:i A", filectime("$dir/" . $entry)) . "</div>
					<div class='ftype'>" . strtoupper($fileType[count($filetype)+1]) . "</div>
					<div class='fsize'>$entrySize</div>
				</div>");
			}
		}
	}
}

?>