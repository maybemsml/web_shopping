<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.pj_hyr.dto.CustomerDTO" %>
<%@ include file = "/WEB-INF/views/common/setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원수정 상세페이지 </title>
<link rel="stylesheet"href="${path}/resources/css/common/header.css">
<link rel="stylesheet"href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"href="${path}/resources/css/customer/join.css">
<!-- join.js 추가 -->
<script src="${path}/resources/js/customer/join.js" defer></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
  	<!-- 컨텐츠시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
            	<div id="menuName"> 회원수정 상세페이지 </div>
            </div>
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <div id="s2_inner">
                  <div class="join">
                     <form name="joinform" action="modifyCustomerAction.do" method="post">
					 <!-- method="post", get 방식일시 _csrf가 url에 붙음 -->
					 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
					                     
                     	<c:if test="${selectCnt ==1}">
                     	<table>
                            <tr>
                               <th> * 아이디 : </th>
                               <td>
                               ${dto.getCust_id()} 
                               </td>
                            </tr>
                            <tr>
                               <th> * 비밀번호 : </th>
                               <td>
                                  <input type="password"class="input"name="password"size="20"placeholder="공백없이 20자 이내로 작성" required>
                               </td>
                            </tr>
                            <tr>
                              <th> * 비밀번호 확인 : </th>
                              <td>
                                 <input type="password"class="input"name="repassword"size="20"placeholder="비밀번호 확인" required>
                              </td>
                           </tr>
                            <tr>
                               <th> * 이름 : </th>
                               <td>
                                 <input type="text"class="input"name="username"size="20"placeholder="이름을 입력해주세요." required value="${dto.getUsername()}">
                               </td>
                            </tr>
                            <tr>
                               <th> * 생년월일 : </th>
                               <td>
                                  <input type="date"class="input"name="birthday"size="8"placeholder="생년월일 8자리를 입력해주세요." required value="${dto.getBirthday()}">
                               </td>
                            </tr>
                            <tr>
                               <th> * 주소 : </th>
                               <td>
                                  <input type="text"class="input"name="address"size="50"placeholder="주소를 입력해주세요." required value="${dto.getAddress()}">
                               </td>
                            </tr>
                            <tr>
                               <th> 핸드폰 :</th>
                               
                                  <td>
                                  <c:if test="${dto.getHp()==null}">
                                  	<input type="text"class="input"name="hp1"size="3"style="width:50px">
                                    -                        
                                    <input type="text"class="input"name="hp2"size="4"style="width:70px">
                                    -                        
                                    <input type="text"class="input"name="hp3"size="4"style="width:70px">
                                  </c:if>	
                                  
                                  	
                                  <c:if test="${dto.getHp()!=null}">
                                  	<c:set var="hpArr" value="${fn:split(dto.getHp(),'-')}"/>
                                  	<input type="text"class="input"name="hp1"size="3"style="width:50px" value="${hpArr[0]}">
                                    -                        
                                    <input type="text"class="input"name="hp2"size="4"style="width:70px" value="${hpArr[1]}">
                                    -                        
                                    <input type="text"class="input"name="hp3"size="4"style="width:70px" value="${hpArr[2]}">
                                  </c:if>		
                                  		
                                  
                                 </td>
                               
                            </tr>
                            <tr>
                               <th> * 이메일 : </th>
                               <td>
                               
                                <c:if test="${dto.getEmail()==null}">	
                                  <input type="text"class="input"name="email1" maxlength="20" style="width:100px" required>
                                  @
                                  <input type="text"class="input"name="email2" maxlength="20" style="width:100px" required>
                                  <select class="input"name="email3"style="width:100px" onclick="inOption();">
                                     <option value="">직접입력</option>
                                     <option value="naver.com">네이버</option>
                                     <option value="gmail.com">구글</option>
                                     <option value="daum.net">다음</option>
                                     <option value="nate.com">네이트</option>
                                  </select>
                                </c:if>
                                
                                
                                <c:if test="${dto.getEmail()!=null}">	
                                <c:set var="emailArr" value="${fn:split(dto.getEmail(),'@')}"/>
                                  <input type="text"class="input"name="email1" maxlength="20" style="width:100px" required value="${emailArr[0]}">
                                  @
                                  <input type="text"class="input"name="email2" maxlength="20" style="width:100px" required value="${emailArr[1]}">
                                  <select class="input"name="email3"style="width:100px" onclick="inOption();">
                                     <option value="">직접입력</option>
                                     <option value="naver.com">네이버</option>
                                     <option value="gmail.com">구글</option>
                                     <option value="daum.net">다음</option>
                                     <option value="nate.com">네이트</option>
                                  </select>
                            	</c:if>
                               </td>
                            </tr>

							<tr>
								<th> 성별 </th>
								<td>
								<c:if test="${dto.getGender()==null}">
								<input type="radio" name="gender" value="M"> 남성
								<input type="radio" name="gender" value="W"> 여성
								</c:if>
								<c:if test="${dto.getGender()=='M'}">
								<input type="radio" name="gender" value="M" checked> 남성
								<input type="radio" name="gender" value="W"> 여성
								</c:if>
								<c:if test="${dto.getGender()=='W'}">
								<input type="radio" name="gender" value="M"> 남성
								<input type="radio" name="gender" value="W" checked> 여성
								</c:if>
								
								</td>
							</tr>
                            
                            <tr>
                               <td colspan="2"style="border-bottom:none;">
                               <br>
                               <div align="right">
                                  <input class="inputButton"type="submit"value="회원정보 수정">
                                  <input class="inputButton"type="reset"value="초기화">
                                  <input class="inputButton"type="button"class="button"value="수정취소" onclick="window.location='${path}/main.do'">
                               </div>
                               </td>                              
                            </tr>   
                        </table>
                     	</c:if>	                         
                     	
                        <c:if test="${selectCnt !=1}">
                     		<script type="text/javascript">
                     			alert("인증 실패");
                     			window.location="${path}/modifyCustomer.do";
                     		</script>
                     	
                     	</c:if>
                     
                     </form>
                  </div>               
               </div>      
            </div>            
         </div>      
      </div>
	      <!-- 컨텐츠끝 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>