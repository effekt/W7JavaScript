<?php

	print ("
				<div class='windowbg'></div>
				<div id='emailhead' class='windowhead'>
					<img src='images/mail.png' alt='E-mail' style='width:22px; height:22px;' />&nbsp;&nbsp;Contact the Author
					<div class='windowheadright'>
						<div onclick='openWindow(\"email\");' class='minimizebutton'></div>
						<div onclick='closeWindow(\"email\");' class='closebutton'></div>
					</div>
				</div>
				<div id='emailcontent'>
					<div id='wemail'>
						<div id='emailsend' onClick='sendMail();'><img src='images/send.png' alt='Send' />Send</div>
						<div id='emailinput'>
							<div class='table'>
								<div class='tr'>
									<div class='td' style='width: 65px;'>
										Sender:
									</div>
									<div class='td' style='width: 353px; text-align: right;'>
										<input type='text' id='sender' size='55' value='example@site.com' onClick=\"if(this.value=='example@site.com'){this.value='';}\" onBlur=\"if(this.value==''){this.value='example@site.com'}\"></input>
									</div>
								</div>
								<div class='tr'>
									<div class='td' style='width: 65px;'>
										Subject:
									</div>
									<div class='td' style='width: 353px; text-align: right;'>
										<input type='text' id='subject' size='55' value='Subject...' onClick=\"if(this.value=='Subject...'){this.value='';}\" onBlur=\"if(this.value==''){this.value='Subject...'}\"></input>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id='emailbuttons'><div style='width: 55%; display:inline-block; vertical-align: top;'>
					<div style='display: inline-block; width: 14px; height: 14px; background-color: blue; border: 1px solid black; margin: 0; padding: 0 1px 2px 1px;' onClick='emailBB(\"blue\");'>&nbsp</div>
					<div style='display: inline-block; width: 14px; height: 14px; background-color: red; border: 1px solid black; margin: 0; padding: 0 1px 2px 1px;' onClick='emailBB(\"red\");'>&nbsp</div>
					<div style='display: inline-block; width: 14px; height: 14px; background-color: green; border: 1px solid black; margin: 0; padding: 0 1px 2px 1px;' onClick='emailBB(\"green\");'>&nbsp</div>
					<div style='display: inline-block; width: 14px; height: 14px; text-align:center; border: 1px solid black; margin: 0; padding: 0 1px 2px 1px;' onClick='emailBB(\"u\");'><u>u</u></div>
					<div style='display: inline-block; width: 14px; height: 14px; text-align:center; border: 1px solid black; margin: 0; padding: 0 1px 2px 1px;' onClick='emailBB(\"b\");'><b>b</b></div>
					<div style='display: inline-block; width: 14px; height: 14px; text-align:center; border: 1px solid black; margin: 0; padding: 0 1px 2px 1px;' onClick='emailBB(\"i\");'><i>i</i></div>
					</div><div id='mailStatus' style='width: 45%; text-align:right; display:inline-block;'>Waiting...</div></div>
					<textarea id='emailbody' rows='20' onClick=\"if(this.value=='Message...'){this.value='';}\" onBlur=\"if(this.value==''){this.value='Message...'}\">Message...</textarea>
				</div>
	");
?>