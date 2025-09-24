// 네비 추가 메뉴
const menu = document.querySelector(".more-nav");
const menu2 = document.querySelector(".more-nav2");
const subBar = document.querySelector(".menu>.sub");
const subBar2 = document.querySelector(".menu>.sub2");

let subToggle = true;
let subToggle2 = true;

function show_sub() {
    if (subToggle) {
        subBar.style.height = "82px";
        subToggle = !subToggle;
    } else {
        subBar.style.height = "0px";
        subToggle = !subToggle;
    }
}

function show_sub2() {
    if (subToggle2) {
        subBar2.style.height = "82px";
        subToggle2 = !subToggle2;
    } else {
        subBar2.style.height = "0px";
        subToggle2 = !subToggle2;
    }
}

menu.addEventListener("click", show_sub);
menu2.addEventListener("click", show_sub2);
