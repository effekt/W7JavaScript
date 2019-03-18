<?php

	print ("
				<div class='windowbg'></div>
				<div id='downloadshead' class='windowhead'>
					<img src='images/downloads.png' alt='Downloads' style='width:22px; height:22px;' />&nbsp;&nbsp;Downloads
					<div id='downloadsheadright' class='windowheadright'>
						<div onclick='openWindow(\"downloads\");' class='minimizebutton'></div>
						<div onclick='closeWindow(\"downloads\");' class='closebutton'></div>
					</div>
				</div>
				<div id='downloadscontent'>
					<div id='downloadsfolders'>
						<div style='display: block; position: absolute; left: 15px; cursor: pointer;' onclick='getDownloads(\"files\");'><img src='images/extensions/folder_root.png' alt='' />&nbsp;&nbsp;root</div>
						<div style='display: block; position: absolute; left: 40px; top: 18px; cursor: pointer;' onclick='getDownloads(\"files/Programs\");'><img src='images/extensions/folder_programs.png' alt='' />&nbsp;&nbsp;Programs</div>
						<div style='display: block; position: absolute; left: 40px; top: 36px; cursor: pointer;' onclick='getDownloads(\"files/Scripts\");'><img src='images/extensions/folder_scripts.png' alt='' />&nbsp;&nbsp;Scripts</div>
						<div style='display: block; position: absolute; left: 40px; top: 54px; cursor: pointer;' onclick='getDownloads(\"files/Files\");'><img src='images/extensions/folder_files.png' alt='' />&nbsp;&nbsp;Files</div>
					</div>
					<div id='downloadsfiles'>
						<div class='downhead' style='width: 231px; border: 0 1px 0 0 solid black;'>Name</div>
						<div class='downhead' style='width: 117px; border: 0 1px 0 1px solid black;'>Date</div>
						<div class='downhead' style='width: 43px; border: 0 1px 0 1px solid black;'>Type</div>
						<div class='downhead' style='width: 107px; border: 0 0 0 1px solid black;'>Size</div>
						<div id='downloadsfilescontent'>
							<script type='text/javascript'>
								getDownloads(\"files\");
							</script>
						</div>
					</div>
				</div>
				<iframe id='downFrame' src='' style='display: none; visibility: hidden;'></iframe>
	");
?>