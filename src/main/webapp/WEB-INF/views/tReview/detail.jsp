<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container">
	<h1>질문 내용</h1>
	
	<div class="row">
		<div class="card">
			<ul class="list-group list-group-flush">
			   	<li class="list-group-item">제 목: ${vo.title}</li>
		   		<li class="list-group-item">작 성 자 : ${vo.id} </li>
			</ul>
		  
			<div class="card-body">
				${vo.contents}
	    	</div>    	
	    	    			

    	 </div>
	
	</div>
	
</div>
	<div class="container my-4">
		<div class="col-2 d-flex">		
			<a href="update?num=${vo.num}" role="button" class="btn btn-success mx-1">Update</a>
			<a href="delete?num=${vo.num}" role="button" class="btn btn-danger mx-1">Delete</a>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</body>
</html>