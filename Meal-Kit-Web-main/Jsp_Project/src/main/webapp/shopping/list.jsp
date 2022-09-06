<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="manager.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../common/color.jsp"%> 

<%
  	String kit_kind = request.getParameter("kit_kind");
	SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");
	
	int pageSize = 5; // 한 페이지에 출력할 레코드 수
	
	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);
	
	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	int count = 0;
	KitPro kitPro = KitPro.getInstance(); 
	count = kitPro.getkitCount(); // 데이터베이스에 저장된 총 갯수
	
	List<KitBean> kitLists = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		kitLists = kitLists = kitPro.getKits(kit_kind, startRow, endRow);
	}


%>

<html>
<head>
<title>Meal-Kit Shopping mall</title>
<link href="../common/style.css" rel="stylesheet" type="text/css">
<link href="styles.css" rel="stylesheet" type="text/css">
</head>
<body>

<table>
<tr>

<td width="100" valign="top">
  <jsp:include page="../common/left.jsp" flush="false" />
</td>
 <td width="700">
        
<%
	KitBean kitList = null;
 	String kit_kindName="";
  
	 if(kit_kind.equals("100"))
		 kit_kindName="한식";
	 else if(kit_kind.equals("200"))
		 kit_kindName="양식";  
	 else if(kit_kind.equals("300"))
		 kit_kindName="중식";
	 else if(kit_kind.equals("400"))
		 kit_kindName="일식";
	 else if(kit_kind.equals("all"))
		 kit_kindName="전체";
%>
 <h3><b><%=kit_kindName%> 분류의 목록</b></h3>
    <a id="main"href="shopMain.jsp">메인으로</a>
<%
	if(count > 0) {
		int number = count - (currentPage - 1) * pageSize;
		for(int i=0;i<kitLists.size();i++){
		   kitList = (KitBean)kitLists.get(i);
%>
  <table> 
    <tr height="30"> 
      <td rowspan="4"  width="100">
         <a href="kitContent.jsp?kit_id=<%=kitList.getKit_id()%>&kit_kind=<%=kit_kind%>"> </a></td> 
      <td width="350"><font size="+1"><b>
         <a href="kitContent.jsp?kit_id=<%=kitList.getKit_id()%>&kit_kind=<%=kit_kind%>">
         <%=kitList.getKit_title() %></a></b></font></td> 
      <td rowspan="4" width="100"  align="center"  valign="middle">
        <%if(kitList.getKit_count()==0){ %>
              <b>일시품절</b>
        <%}else{ %>
              &nbsp;
        <%} %>
      </td>
    </tr>        
    <tr height="30"> 
       <td width="350">재료 : <%=kitList.getKit_material()%></td> 
    </tr>
    <tr height="30" > 
       <td width="350">저자 : <%=kitList.getKit_allergy()%></td>
    </tr>
    <tr height="30"> 
       <td width="350">정가 : <%=NumberFormat.getInstance().format(kitList.getKit_price())%><br>
                     판매가 : <b><font color="red">
         <%=NumberFormat.getInstance().format((int)(kitList.getKit_price()*((double)(100-kitList.getDiscount_rate())/100)))%>
         </font></b></td> 
    </tr> 
<%
 		} 
	}
%>
    <tr>
				<td colspan="6" align="center">
					<%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 5;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="list.jsp?kit_kind=<%= kit_kind %>&pageNum=<%=startPage - 5%>">[이전]</a>	
					<%			
							}
							
							for(int j=startPage; j <= endPage; j++){ // 페이지 블록 번호
								if(j == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=j %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="list.jsp?kit_kind=<%= kit_kind%>&pageNum=<%=j%>">[<%=j %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="list.jsp?kit_kind=<%= kit_kind%>&pageNum=<%=startPage + 5 %>">[다음]</a>
					<%		
							}
						}
					%>
				</td>
			</tr>

  </table>
  <br>
</td>
</tr>
</table>
</body>
</html>