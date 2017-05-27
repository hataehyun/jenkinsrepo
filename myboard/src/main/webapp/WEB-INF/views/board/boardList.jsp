<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<h3>
	<i class="fa fa-angle-right"></i> Board List
</h3>
<div class="row">
<div class="col-md-12">
<div class="content-panel">
<table class="table table-striped table-advance table-hover">
	<h4><i class="fa fa-angle-right"></i> Board </h4>
	<hr>
  <thead>
   <tr>
     <th><i class="fa fa-bullhorn"></i> 글번호</th>
     <th class="hidden-phone"><i class="fa fa-question-circle"></i> 제목</th>
     <th><i class="fa fa-bookmark"></i> 작성자</th>
     <th><i class=" fa fa-edit"></i> 등록날짜</th>
     <th>조회수</th>
     <th>댓글수</th>
   </tr>
  </thead>
  <tbody id="tbody">
   <tr>
     <td><a href="basic_table.html#">Company Ltd</a></td>
     <td class="hidden-phone">Lorem Ipsum dolor</td>
     <td>12000.00$ </td>
     <td><span class="label label-info label-mini">Due</span></td>
     <td></td>
     <td></td>
   </tr>
 </tbody>
</table>

<div id="pagination">
	<a href="#">&laquo;</a>
  <a href="#">1</a>
  <a href="#" class="active">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
<script id="boardHandle" type="text/x-handlebars-template">
<tr>
   <td>{{bno}}</td>
   <td>{{title}}</td>
   <td>{{writer}}</td>
   <td>{{updatedate}}</td>
   <td>0</td>
   <td>0</td>
</tr>
</script>
<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function(e){
		var getlist = function(e){
			$.ajax({
				url: "/board/boardList",
				data: "",
				
			});
		}
	});

</script>

	</body>
</html>