const marker=document.querySelector(".marker");

//nav의 marker의 길이와 위치를 설정하는 함수
//A function to set the length and position of the nav marker.
function setMarker(e) {
    marker.style.left = e.offsetLeft+"px";
    marker.style.width = e.offsetWidth+"px";
}

const sections = document.querySelectorAll("section");
const menus = document.querySelectorAll("#top_menu > li > a")

//스크롤 위치에 따라 해당하는 menu의 색깔과 마커가 달라짐
//The color and marker of the corresponding menu change according to the scroll position

window.addEventListener("scroll",()=>{
    //현재 영역의 id값
    //id of the current section
    let current=""

    sections.forEach(section=>{
        //각 section의 top 위치(절대적 위치)
        // The top of each section (absolute)
        const sectionTop = window.scrollY + section.getBoundingClientRect().top;

        //누적된 스크롤이 section의 top위치에 도달했거나 section의 안에 위치할 경우
        //When the accumulated scroll reaches the top of the section or is located inside the section
        if(window.scrollY >= sectionTop) {
            current = section.getAttribute("id");
        }


        menus.forEach(menu=>{
            menu.classList.remove("nav_menu--focused");
            const href = menu.getAttribute("href").substring(1);
            if(href===current) {
                //현재 있는 영역의 id와 메뉴의 링크주소가 일치할때
                //When the Id of the current section matches the href of the menu
                menu.classList.add("nav_menu--focused");
                setMarker(menu);
            }
        })
    })
})