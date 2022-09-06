<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="manager.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("utf-8");%>

<%
	String realFolder = "";
	String filename ="";
  	MultipartRequest imageUp = null; 
	
  	String saveFolder = "/imageFile";
	String encType = "utf-8"; 
  	int maxSize = 5*1024*1024;  
 	ServletContext context = getServletContext();
  	realFolder = context.getRealPath(saveFolder);  
	
  	try{
     	imageUp = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	   
     	Enumeration<?> files = imageUp.getFileNames();
	   
     	while(files.hasMoreElements()){
	       	String name = (String)files.nextElement();       
	    	filename = imageUp.getFilesystemName(name);
		}	
  	} catch(Exception e) {
     	e.printStackTrace();
  	}
%>

	<jsp:useBean id="kit" scope="page" class="manager.KitBean">
	</jsp:useBean>

<%
	String kit_kind = imageUp.getParameter("kit_kind");
	String kit_title = imageUp.getParameter("kit_title");
	String kit_price = imageUp.getParameter("kit_price");
	String kit_count = imageUp.getParameter("kit_count");
	String kit_img = imageUp.getParameter("kit_img");
	String kit_material = imageUp.getParameter("kit_material");
	String kit_how = imageUp.getParameter("kit_how");
	String kit_allergy = imageUp.getParameter("kit_allergy");
	String discount_rate = imageUp.getParameter("discount_rate");
	
  
	kit.setKit_kind(kit_kind);
	kit.setKit_title(kit_title);
	kit.setKit_price(Integer.parseInt(kit_price));
	kit.setKit_count(Integer.parseInt(kit_count));
	kit.setKit_img(filename);
	kit.setKit_material(kit_material);
	kit.setKit_how(kit_how);
	kit.setKit_allergy(kit_allergy);
	kit.setDiscount_rate(Byte.parseByte(discount_rate));
	
 	KitPro kitPro = KitPro.getInstance();
 	kitPro.insertKit(kit);
	
  	response.sendRedirect("kitList.jsp?kit_kind=all");
%>