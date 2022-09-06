<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../common/style.css"/>
<script src="../common/script.js"></script>


<form method="post" name="writeform" action="member/registerPro.jsp" >
	<ul>
 		<li>	
 			<label for="id">아이디</label>
          	<input type="email" id="id" name="id"  size="20" maxlength="50" placeholder="example@kings.com" autofocus/>
          	
        </li>
      	<li>
      	 	<label for="passwd">비밀번호</label>
      		<input id="passwd" name="passwd" type="password"  size="20" placeholder="6~16자 숫자/문자" maxlength="16"/>
      	</li>
        <li>
         	<label for="repass">비밀번호 재입력</label>
          	<input id="repass" name="repass" type="password" size="20" placeholder="비밀번호재입력" maxlength="16"/>
        </li>
      	<li>
      		<label for="name">이름</label>
          	<input id="name" name="name" type="text" size="20" placeholder="홍길동" maxlength="10"/>
       	</li>
      	<li>
      		<label for="address">주소</label>
          	<input id="address" name="address" type="text" size="30" placeholder="주소 입력" maxlength="50"/>
      	</li>
      
      	<li>
      		<label for="tel">전화번호</label>
          	<input id="tel" name="tel" type="tel" size="20" placeholder="전화번호 입력" maxlength="20">
      	</li>
      	<li>
      		<label for="allergy">알러지</label>
          	<input id="allergy" name="allergy" type="checkbox" value="고기">고기
          	<input id="allergy" name="allergy" type="checkbox" value="야채">야채
          	<input id="allergy" name="allergy" type="checkbox" value="과일">과일
      	</li>
      	<li class="label2">
      		<input type="submit" value="가입하기" /> 
      		<input type="reset" value="취소"/>
      	</li>	
   </ul>
</form>   
