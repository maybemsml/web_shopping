// 폴더 우클릭 > new > other > javascript > javaScript source file 선택
/* 3-3-1 자바스크립트 이벤트 추가 : 메뉴바 아이콘을 클릭하면 아랫쪽으로 메뉴 등장 main.js에 추가 */
const toggleBtn = document.querySelector('.navbar_toggleBtn');
const menu = document.querySelector('.navbar_menu');
const icons = document.querySelector('.navbar_icons');

toggleBtn.addEventListener('click',()=>{
	menu.classList.toggle('active');
	icons.classList.toggle('active');	
});