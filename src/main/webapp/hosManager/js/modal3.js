const viewBtn = document.getElementById("view-more");
const contentDiv = document.getElementById("patient-content");

viewBtn.addEventListener("click", () => {
    if(contentDiv.style.display === "flex"){
        contentDiv.style.display = "none";
    } else {
        contentDiv.style.display = "flex";
    }
});

const showBtn = document.getElementById("show-btn");
const xBtn = document.getElementById("more-dia-x");
const showDib = document.getElementById("show-dia-info");

showBtn.addEventListener("click", () => {
    if(showDib.style.display !== "flex"){
    	showDib.style.display = "flex";
    	}
});

xBtn.addEventListener("click", () => {
	showDib.style.display = "none";
})

const xpinfo = document.getElementById("p-info-div");

xpinfo.addEventListener("click", () => {
	showDib.style.display = "none";
	modalProfile2.style.display = "none";
});