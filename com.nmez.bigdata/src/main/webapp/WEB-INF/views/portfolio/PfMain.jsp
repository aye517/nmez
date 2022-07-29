<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PfMaiin.jsp</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="resources/css/scroll.css">
<script type="text/javascript">
var mHtml = $("html");
var page = 1;


mHtml.animate({scrollTop : 0},10);
$(window).on("wheel", function(e) {
    if(mHtml.is(":animated")) return;
    if(e.originalEvent.deltaY > 0) {
        if(page == 4) return;
        page++;
    } else if(e.originalEvent.deltaY < 0) {
        if(page == 1) return;
        page--;
    }
    var posTop =(page-1) * $(window).height();
    mHtml.animate({scrollTop : posTop});
})
</script>

</head>
<body>
    <div class="section" id="section1"><img alt="" src="resources/img/cat1.jpg"></div>
    <div class="section" id="section2"><img alt="" src="resources/img/cat2.jpg"></div>
    <div class="section" id="section3"><img alt="" src="resources/img/cat3.jpg"></div>
    <div class="section" id="section4"><img alt="" src="resources/img/cat4.jpg"></div>
</body>
</html>