//$(documnet).ready(funtion){}
$(function(){
    var $menu = $('#top_menu ul li'),
        $contents = $('#contents > div');
        console.log($contents);
    /*
    $menu 를 클릭하면 해당 요소에만 클래스명 on 추가되도록
     */
    $menu.click(function(x){
        x.preventDefault();
        /*
        $menu.removeClass('on');
        */
        $(this).addClass('on').siblings().removeClass('on');
        var idx = $(this).index();
        var section = $contents.eq(idx);
        var sectionDistance = section.offset().top;
        
         //A.scrollTop() 스크롤양을 확인
        $('html,body').stop().animate({scrollTop:sectionDistance})
        console.log(sectionDistance);
$(document).ready(function(){
	var offset = $contents.offset();
	$('html,body').animate({scrollTop:sectionDistance},500);
});
    }); 
/*
윈도우 스크롤이 생기면
    $contents들 마다 할일
    각각의 높이 화면상단에서의 거리(sectionDistance)보다 스크롤양이 많은지 적은지 
    많다는 조건이 참이면 각 요소마다 순번 변수명 idx 저장
    그 순번에 해당하는 메뉴에만 클래스명 on 추가
 */
$(window).scroll(function(){
        $contents.each(function(){
            if($(this).offset().top <= $(window).scrollTop()){
                var idx = $(this).index();
                $menu.removeClass('on');
                $menu.eq(idx).addClass('on');
            }
        });
    });
});