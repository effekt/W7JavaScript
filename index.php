<?php

	$hoveredTask = "";

	print ("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>");
	print ("\n<html xmlns='http://www.w3.org/1999/xhtml' lang='en' xml:lang='en'>");

	print ("\n<head>");
	print ("\n	<meta http-equiv='Content-Type' content='text/html;charset=utf-8' />");
	print ("\n	<title>i-Leet</title>");
	print ("\n	<link href='style.css' rel='stylesheet' type='text/css'></link>");
	print ("\n	<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>");
	print ("\n	<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js'></script>");
	print ("\n	<script type='text/javascript' src='jquery.livequery.js'></script>");
	print ("\n	<script type='text/javascript' src='functions.js'></script>");
	print ("\n  <script type='text/javascript'>startMenu(\"undefined\");</script>");
	print ("\n</head>");
	
	print ("\n<body onLoad='showContent();'>");
	
	print ("\n	<div id='loadBody' style='width: 100%; height: 100%; display: block; position: absolute; z-index:10000;'>");
	print ("\n		<div style='opacity:0.3; width: 100%; height: 100%; position: absolute; background: #C3C3C3;'></div>");
	print ("\n		<div style='position: relative; width:99px; height:56px; left:50%; top:50%;'><div style='left:-49.5px; top:-28px; position:absolute; display: block;'><img src='images/loading.gif' alt='Loading...' /></div></div>");
	print ("\n	</div>");
	
	print ("\n	<div id='actualBody'>");
	print ("\n		<div id='startmenu' style='visibility:hidden;'>");
	print ("\n			<div id='startmenubg'></div>");
	print ("\n			<div id='avatar'></div>");
	print ("\n			<div id='programs'>");
	print ("\n				<div class='program' onclick='openWindow(\"email\");'><img src='images/mail.png' alt='Email'></img>&nbsp;&nbsp;&nbsp;Contact</div>");
	print ("\n				<div class='program' onclick='openWindow(\"about\");'><img src='images/about.png' alt='About Me'></img>&nbsp;&nbsp;&nbsp;About Me</div>");
	print ("\n			</div>");
	print ("\n		</div>");
	
	print ("\n		<div class='postit'><div class='postithead'>&nbsp;</div><div class='postitbody'><textarea spellcheck=false>Welcome to i-Leet.com

This website REQUIRES JavaScript to be enabled, there is no pure HTML / PHP version available at this point in time.

This website makes use of the jQuery and liveQuery libraries to offer a more interactive visit.</textarea></div></div>");
	print ("\n		<div class='postit2'><div class='postithead2'>&nbsp;</div><div class='postitbody2'><textarea spellcheck=false>This website was designed to look its best in Firefox, but should display properly in Internet Explorer as well.

No other browsers have been tested.

Make sure you have an ACTIVE internet connection!</textarea></div></div>"); 

	
	print ("\n		<div id='hoverbubble' style='visibility: hidden; left: 0px;'></div>");
	print ("\n		<div id='timebubble' style='visibility: hidden; right: 0px;'></div>");	
	
	$curDateBub = date('l, F d, Y');
	
	print ("\n		<div id='taskbar'>");
	print ("\n			<div id='taskbarbg'></div>");
	print ("\n			<div id='orb' onclick='startMenu();'></div>");
	print ("\n			<div class='taskitem' id='taskdownloads' onclick='openWindow(\"downloads\");' style='background:url(images/downloads.png) no-repeat; background-position: center' onmouseover='showText(this, \"Open the downloads folder\");' onmouseout='showText(this, \"\");'></div>");
	print ("\n			<div class='taskitem' style='background:url(images/blog.png) no-repeat; background-position: center' onmouseover='showText(this, \"Browse the latest blog posts\");' onmouseout='showText(this, \"\");'></div>");
	print ("\n			<div class='taskitem' id='taskabout' onclick='openWindow(\"about\");' style='background:url(images/about.png) no-repeat; background-position: center;' onmouseover='showText(this, \"Open the about document\");' onmouseout='showText(this, \"\");'></div>");
	print ("\n			<div class='taskitem' id='taskemail' onclick='openWindow(\"email\");' style='background:url(images/mail.png) no-repeat; background-position: center' onmouseover='showText(this, \"Contact the author\");' onmouseout='showText(this, \"\");'></div>");
	print ("\n			<div id='taskright'>");
	print ("\n				<div class='flag' onmouseover='showText(this, \"Warning: You are not logged in!\");' onmouseout='showText(this, \"\");'></div>");
	print ("\n				<div style='display:inline-block; height:40px; position:relative; vertical-align:middle; top:-4px; color:#989b9d; padding:0 4px 0 4px;'>&copy;i-Leet 2012</div>");
	print ("\n				<div id='datetime' onmouseover='showDate(this, \"$curDateBub\");' onmouseout='showDate(this, \"\");'>" . date('g:i A') . "<p />" . date("n/j/Y") . "</div>");
	print ("\n				<div id='minimize' onclick='minAll();'></div>");
	print ("\n			</div>");
	print ("\n		</div>");
	print ("\n	</div>");
	print ("\n</body>");
	
	print ("\n</html>");
	
?>