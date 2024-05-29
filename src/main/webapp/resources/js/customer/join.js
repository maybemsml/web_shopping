// join.js

// 아이디 중복확인 버튼 클릭시
// 1. 중복확인 페이지(idConfirmAction) open시
function confirmId(){
	if(!document.joinform.cust_id.value) {
		alert("아이디를 입력하세요");
		document.joinform.cust_id.focus();
		return false;
		}
	let url = "/pj_hyr/idConfirmAction.do?cust_id="+document.joinform.cust_id.value;
	window.open(url,"confirm","menubar=no, width=800, height=400");
	// 컨트롤러 url을 넘기므로 컨트롤러에 url 추가
}

// 2. onsubmit - 회원가입 페이지 필수체크
function signInCheck(){
	// 2-1. 중복확인
	// <input type="hidden" name="hiddenId" value="0"> => joinform 아래 추가
	// hiddenId : 중복확인 클릭 여부 체크(0:미클릭 1:클릭)
	
	// 2-2. 중복확인 버튼을 클릭하지 않은 경우 메세지 출력
	if(document.joinform.hiddenId.value == 0){
		alert("중복확인을 진행해주세요");
		document.joinform.dupChk.focus();
		return false;
	}
}

// idConfirmAction page

// onload (id에 focus)
function idConfirmFocus(){
	document.confirmform.cust_id.focus();
}

// onSubmit
function idConfirmCheck(){
	if(!document.confirmform.cust_id.value){
		alert("아이디를 입력해주세요");
		document.confirmform.cust_id.focus();
		return false;
	}
}

// 자식 창에서 부모 창으로 id값 전달
/*
	opener : window 객체의 open()메서드로 열린 중복확인창에서 회원가입폼으로 접근할 때 사용
	join.jsp-hiddenId : 중복확인 버튼 클릭 여부 체크(0:미클릭, 1:클릭)
	self.close(); => 작업 완료시 알아서 창닫기

*/

function setId(cust_id){
	opener.document.joinform.cust_id.value = cust_id;
	opener.document.joinform.hiddenId.value = 1;
	self.close();
}


function inOption(){
	let optionVal = document.joinform.email3.value;
	document.joinform.email2.value = optionVal;
}






