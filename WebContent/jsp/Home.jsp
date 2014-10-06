<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<h2 class="heading">Login </h2>
<div style="height:25px;"></div>
<!---------------------------------------------->
<!-- START OF CODE FOR OPACITY SLIDER -->
<!---------------------------------------------->

<!-- START OF STYLE CONFIGURATION -->
<style>
.messagestyle{
	/* style attributes for the comments below the pictures */
	font-family:Arial;
	font-size:12px;
	color:#aaaaaa;
	background:#ffffff;
	vertical-align:middle;
	text-align:center;
}

.boxstyle{
	/* style attributes for the slideshow-box */
	overflow:hidden;
	border-style:solid;
	border-width:1px;
	border-color:white;
	margin: 0 auto;

	/* shadow for Firefox */
	-moz-box-shadow: 5px 5px 8px #AAAAAA;

	/* shadow for Safari and Chrome */
	-webkit-box-shadow: 5px 5px 8px #AAAAAA;

	/* shadow for Opera */
	box-shadow: 5px 5px 5px #AAAAAA;

	/* shadow for Internet Explorer */
	filter: progid:DXImageTransform.Microsoft.Shadow(Strength=5, Direction=135, Color='#AAAAAA');
}

</style>
<!-- END OF STYLE CONFIGURATION -->

<script>
<!-- Beginning of JavaScript -

// CREDITS:
// image slider with opacity effect
// by Peter Gehrig 
// Copyright (c) 2011 Peter Gehrig. All rights reserved.
// Permission given to use the script provided that this notice remains as is.
// Additional scripts can be found at http://www.fabulant.com
// 01/25/2011

// IMPORTANT: 
// If you add this script to a script-library or script-archive 
// you have to add a link to http://www.fabulant.com on the webpage 
// where this script will be running.

/////////////////////////////////////////////////////////////////////////
// START OF SCRIPT-CONFIGURATION
/////////////////////////////////////////////////////////////////////////

// yYur pictures, the corresponding messages and links. 
// Add as many pictures a you like. In this case the pictures are in the same directory as the HTML-file.

var picture= [
{
src : "./images/banner5.jpg",
mes : "",
url : "http://www.fabulant.com"
},

{
src : "./images/banner6.jpg",
mes : "",
url : "http://www.fabulant.com"
}
,

{
src : "./images/banner7.jpg",
mes : "",
url : "http://www.fabulant.com"
}
,

{
src : "./images/banner8.jpg",
mes : "",
url : "http://www.fabulant.com"
}
]

// target of the picture-links ("_blank", "_top", "_self", "_parent" or "nameOfYourFrame")
var target_url="_blank"
	
// number of lamellas.
var x_slices=1

// width of slideshow (pixels)
var slideshow_width=750

// height of slideshow (pixels)
var slideshow_height=250

// height of messagebox (pixels)
var message_height=23

// pause beween the pictures (seconds)
var pause=1

// speed of transition effect, high value = fast speed
var step=20

/////////////////////////////////////////////////////////////////////////
// END OF SCRIPT-CONFIGURATION
/////////////////////////////////////////////////////////////////////////

// Do not edit below this line

var imgpreload=new Array()
for (iii=0;iii<=picture.length-1;iii++) {
	imgpreload[iii]=new Image()
	imgpreload[iii].src=picture[iii].src
}

if (!document.all) {
	var extra_height=3
}
else {
	var extra_height=0
}

var picturewidth
var pictureheight
var i_loop=0
var i_picture=0
var width_slice
var cliptop=0
var clipbottom
var i_clipright=1
var content=""
pause=pause*1000
var fadestrength=0
var fadestrength_step=slideshow_width/100/1.5
var i_fadestrength
var slideshow_height=slideshow_height

function initiate() {
	width_slice=Math.ceil(slideshow_width/x_slices)
	clipbottom=(slideshow_height+message_height)
	i_picture++
	changepicture()
}

function openlamellar() {
	clipleft=-width_slice
	clipright=0
    if (i_clipright<=width_slice) {
        for (i=0;i<=x_slices;i++) {
            var thiss=eval("document.getElementById('s"+i+"').style")
            thiss.clip ="rect("+cliptop+"px "+clipright+"px "+clipbottom+"px "+clipleft+"px)"
            clipleft+=width_slice
            clipright=clipleft+i_clipright
			if (document.all) {
				var thisfilter=eval('s'+i)
				thisfilter.filters.alpha.opacity=Math.round(fadestrength)
			}
			else {
				thiss.opacity=(fadestrength/100)
 			}
			fadestrength+=fadestrength_step
		}
    i_clipright=i_clipright+step
    var timer=setTimeout("openlamellar()",20)
   	}
   	else {
		clearTimeout(timer)
		fadestrength=0
		document.getElementById("whole").innerHTML=content
		var timer=setTimeout("changepicture()",pause)
	}
}


		
		

function getcontent() {
	content="<table cellpadding=0 cellspacing=0 border=0 width="+slideshow_width+">"
	content+="<tr><td width="+slideshow_width+" height="+slideshow_height+"><a href='"+picture[i_picture].url+"' target='"+target_url+"'><img src='"+picture[i_picture].src+"' border=0 width="+slideshow_width+" height="+slideshow_height+"></a></td></tr><tr><td class='messagestyle' height="+message_height+">"+picture[i_picture].mes+"</td></tr>"
	if (!document.all) {
		content+="<tr><td height="+extra_height+"></td></tr>"
	}
	content+="</table>"
}

function changepicture() {
	i_clipright=0
	clipleft=0
	clipright=0
	for (i=0;i<=x_slices;i++) {
       	var thiss=eval("document.getElementById('s"+i+"').style")
    	thiss.clip ="rect("+cliptop+"px "+clipright+"px "+clipbottom+"px "+clipleft+"px)"
	}
	if (i_picture>picture.length-1) {i_picture=0}
	getcontent()

	for (i=0;i<=x_slices;i++) {
        var thisinners=eval("document.getElementById('s"+i+"')")
        thisinners.innerHTML=content 
    }
	i_picture++
	openlamellar()
}

content="<table cellpadding=0 cellspacing=0 border=0 width="+slideshow_width+">"
content+="<tr><td width="+slideshow_width+" height="+slideshow_height+"><a href='"+picture[i_picture].url+"' target='"+target_url+"'><img src='"+picture[i_picture].src+"' border=0 width="+slideshow_width+" height="+slideshow_height+"></a></td></tr><tr><td class='messagestyle' height="+message_height+">"+picture[i_picture].mes+"</td></tr>"
if (!document.all) {
	content+="<tr><td height="+extra_height+"></td></tr>"
}
content+="</table>"

document.write("<div class='boxstyle' style='position:relative;width:"+slideshow_width+"px;height:"+(slideshow_height+message_height+extra_height)+"px;'>")
document.write("<span id='whole' style='position:absolute;top:0px;left:0px;width:"+slideshow_width+"px;height:"+(slideshow_height+message_height+extra_height)+"px;'>"+content+"</span>")
for (i=0;i<=x_slices;i++) {
 	document.write("<span  id='s"+i+"' style='position:absolute;top:0px;left:0px;width:"+slideshow_width+"px;height:"+(slideshow_height+message_height)+"px;filter:alpha(opacity=100);'>"+content+"</span>")
}
document.write("</div>")
document.close()
window.onload=initiate

// - End of JavaScript - -->
</script>

<!---------------------------------------------->
<!-- END OF CODE FOR OPACITY SLIDER -->
<!---------------------------------------------->


<!-- <div class="home-banner"><img src="../images/banner.jpg" width="775px" height="250px;" /></div> -->
</body>
</html>