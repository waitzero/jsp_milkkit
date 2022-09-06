function checkForm(writeform){
	if(!writeform.kit_kind.value){
	  alert("밀키트 분류를 입력하십시오");
	  writeform.kit_kind.focus();
	  return false;
	}

	if(!writeform.kit_title.value){
	  alert("밀키트 이름을 입력하십시오");
	  writeform.kit_title.focus();
	  return false;
	}
	if(!writeform.kit_price.value){
	  alert("밀키트 가격을 입력하십시오");
	  writeform.kit_price.focus();
	  return false;
	}
	
	if(!writeform.kit_count.value){
	  alert("밀키트 개수를 입력하십시오");
	  writeform.kit_count.focus();
	  return false;
	}
        
	if(!writeform.kit_material.value){
	  alert("밀키트 재료를 입력하십시오");
	  writeform.kit_material.focus();
	  return false;
	}
	
	if(!writeform.kit_how.value){
	  alert("밀키트 재작 방법을 입력하십시오");
	  writeform.kit_how.focus();
	  return false;
	}
	
	if(!writeform.kit_allergy.value){
	  alert("알러지 성분을 입력하십시오");
	  writeform.kit_allergy.focus();
	  return false;
	}
	
	if(!writeform.discount_rate.value){
	  alert("할인율을 입력하십시오");
	  writeform.discount_rate.focus();
	  return false;
	}
		
	writeform.action = "kitRegisterPro.jsp";
    writeform.submit();
 } 
 
 function updateCheckForm(writeform){
	if(!writeform.kit_kind.value){
	  alert("밀키트 분류를 입력하십시오");
	  writeform.kit_kind.focus();
	  return false;
	}
	if(!writeform.kit_title.value){
	  alert("밀키트 이름을 입력하십시오");
	  writeform.kit_title.focus();
	  return false;
	}
	if(!writeform.kit_price.value){
	  alert("밀키트 가격을 입력하십시오");
	  writeform.kit_price.focus();
	  return false;
	}
	
	if(!writeform.kit_count.value){
	  alert("밀키트 개수를 입력하십시오");
	  writeform.kit_count.focus();
	  return false;
	}
        
	if(!writeform.kit_material.value){
	  alert("밀키트 재료를 입력하십시오");
	  writeform.kit_material.focus();
	  return false;
	}
	
	if(!writeform.kit_how.value){
	  alert("밀키트 재각 방법을 입력하십시오");
	  writeform.kit_how.focus();
	  return false;
	}
	
	if(!writeform.kit_allergy.value){
	  alert("알러지 성분을 입력하십시오");
	  writeform.kit_allergy.focus();
	  return false;
	}
	
	if(!writeform.discount_rate.value){
	  alert("할인율을 입력하십시오");
	  writeform.discount_rate.focus();
	  return false;
	}
		
	writeform.action = "kitUpdatePro.jsp";
    writeform.submit();
	
 } 
 