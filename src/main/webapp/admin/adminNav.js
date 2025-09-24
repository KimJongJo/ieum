// 네비 추가 메뉴
const menu = document.querySelector(".more-nav");
const subBar = document.querySelector(".menu>.sub");

let subToggle = true;

function show_sub() {
    if (subToggle) {
        subBar.style.height = "82px";
        subToggle = !subToggle;
    } else {
        subBar.style.height = "0px";
        subToggle = !subToggle;
    }
}


menu.addEventListener("click", show_sub);
