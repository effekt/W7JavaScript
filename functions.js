var openWindows = new Array();

function showContent() {
	document.getElementById("loadBody").style.display = 'none';
	$("#loadBody").remove();
}

function startMenu(func) {
	var isHidden = document.getElementById("startmenu").style.visibility;
	
	if (typeof func == "undefined") {
		if (isHidden == "hidden") {
			document.getElementById("startmenu").style.visibility = 'visible';
		} else {
			document.getElementById("startmenu").style.visibility = 'hidden';
		}
	}
	if (func == "close") {
		document.getElementById("startmenu").style.visibility = 'hidden';
	}
}

$('html').click(function(){
	$('#orb').click(function(event){
		event.stopPropagation();
	});
	$('#startmenu').click(function(event){
		event.stopPropagation();
	});
	startMenu("close");
});

function showText(obj, hoverText) {
	if (hoverText != "") {
		document.getElementById("hoverbubble").style.visibility = 'visible';
		document.getElementById("hoverbubble").style.left = $(obj).offset().left + "px";
		document.getElementById("hoverbubble").innerHTML = hoverText;
	} else {
		document.getElementById("hoverbubble").style.visibility = 'hidden';
	}
}

function showDate(obj, hoverText) {
	if (hoverText != "") {
		document.getElementById("timebubble").style.visibility = 'visible';
		document.getElementById("timebubble").innerHTML = hoverText;
	} else {
		document.getElementById("timebubble").style.visibility = 'hidden';
	}
}

function openWindow(obj) {
	var numWindows = openWindows.length;
	if ($("#" + obj).length == 0) {
		$('body').append("<div id='" + obj + "' style='visibility: hidden;' onmousedown='setZ(\"" + obj + "\");' onmouseover='makeDrag(\"" + obj + "\");'></div>");
		$("#" + obj).load('windows/' + obj + '.php', function() {
			document.getElementById(obj).style.visibility = "visible";
			openWindows[numWindows] = obj;
			$("#" + obj).css('z-index', '50' + (numWindows + 1));
			$("#task" + obj).removeClass('taskitem').addClass('taskitemopen');
		});
	} else {	
		var windowShown = document.getElementById(obj).style.visibility;
		
		if (windowShown == "hidden") {
			document.getElementById(obj).style.visibility = "visible";
			for (x=numWindows; x>0; x--) {
				if (openWindows[x-1] == obj) {
					document.getElementById(obj).style.zIndex = "501";
				} else {
					document.getElementById(openWindows[x-1]).style.zIndex = "500";
				}
			}
		} else {
			document.getElementById(obj).style.visibility = "hidden";
		}
	}
	startMenu("close");
}

function getDownloads(dir) {
	$.post("getFiles.php", { fdir: dir }, function(dirFiles) {
		document.getElementById("downloadsfilescontent").innerHTML = dirFiles;
	});
}

function setZ(obj) {
	var numWindows = openWindows.length;
	for (x=numWindows; x>0; x--) {
		if (openWindows[x-1] == obj) {
			document.getElementById(obj).style.zIndex = "501";
		} else {
			document.getElementById(openWindows[x-1]).style.zIndex = "500";
		}
	}
}

function makeDrag(obj) {

	var windowWidth = $("#" + obj).width();
	var windowHeight = $("#" + obj).height();
	
	var maxWidth = ($(window).width() - windowWidth - 2);
	var maxHeight = ($(window).height() - windowHeight - 40);
	
	$("#" + obj).live('mouseover', function() {
		$("#" + obj).draggable({
			addClasses: true,
			appendTo: "#" + obj,
			containment: [0, 0, maxWidth, maxHeight],
			handle: "#" + obj + "head"
		});
	});
}

function sendMail() {
	var emailPattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	var emailValid = emailPattern.test($("#sender").val());
	senderError = "";
	
	$("#emailbody").attr('disabled', 'disabled');
	$("#subject").attr('disabled', 'disabled');
	$("#sender").attr('disabled', 'disabled');
	
	if ($("#emailbody").val() == "") { senderError = "Message field can not be empty..."; }
	if ($("#emailbody").val() == "Message...") { senderError = "Message field can not be left as default..."; }
	if ($("#subject").val() == "") { senderError = "Subject can not be empty" }
	if ($("#subject").val() == "Subject...") { senderError = "Subject can not be left as default..."; }
	if ($("#sender").val() == "") { senderError = "E-mail field can not be left blank..."; }
	if ($("#sender").val() == "example@site.com") { senderError = "E-mail field can not be left as default..."; }
	if (!emailValid) { senderError = "E-mail entered does not appear valid..."; }
	
	if (senderError) {
		document.getElementById("mailStatus").innerHTML = senderError;
		$("#emailbody").removeAttr('disabled');
		$("#subject").removeAttr('disabled');
		$("#sender").removeAttr('disabled');
	} else {
		document.getElementById("mailStatus").innerHTML = "Sending...";
		$.post("includes/sendmail.php", { subj: $("#subject").val(), mess: $("#emailbody").val(), sndr: $("#sender").val() }, function(emailResult) {
			document.getElementById("mailStatus").innerHTML = emailResult;
			if (emailResult == "E-mail successfully sent") {
				$("#emailsend").removeAttr('onclick');
			}
		});
	}
}

function closeWindow(obj) {
	numWindows = openWindows.length;
	for (x=numWindows; x>0; x--) {
		if (openWindows[x-1] == obj) {
			openWindows.splice(x-1, 1);
		}
	}

	$("#" + obj).remove();
	$("#task" + obj).removeClass('taskitemopen').addClass('taskitem');
}

function minAll() {
	numWindows = openWindows.length;
	for (x=numWindows; x>0; x--) {
		document.getElementById(openWindows[x-1]).style.visibility = "hidden";
	}
}

jQuery.fn.extend({
insertAtCaret: function(myValue){
  return this.each(function(i) {
    if (document.selection) {
      //IE
      this.focus();
      sel = document.selection.createRange();
      sel.text = myValue;
      this.focus();
    }
    else if (this.selectionStart || this.selectionStart == '0') {
      //Firefox and others
      var startPos = this.selectionStart;
      var endPos = this.selectionEnd;
      var scrollTop = this.scrollTop;
      this.value = this.value.substring(0, startPos)+myValue+this.value.substring(endPos,this.value.length);
      this.focus();
      this.selectionStart = startPos + myValue.length;
      this.selectionEnd = startPos + myValue.length;
      this.scrollTop = scrollTop;
    } else {
      this.value += myValue;
      this.focus();
    }
  })
}
});

function emailBB(bbcode) {
	if (document.getElementById("emailbody").value == "Message...") {
		$('#emailbody').val("["+bbcode+"][/"+bbcode+"]");
	} else {
		$('#emailbody').insertAtCaret("["+bbcode+"][/"+bbcode+"]");
	}
}