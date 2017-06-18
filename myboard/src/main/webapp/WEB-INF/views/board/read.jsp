<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<h3>
	<i class="fa fa-angle-right"></i> Board Register
</h3>
<div class="row mt">
<div class="col-lg-12">
<div class="form-panel">
<form id="registerPost" class="form-horizontal style-form" method="post" action="/board/register">
	<div class="form-group">
     <label class="col-sm-2 col-sm-2 control-label">제목</label>
         <div class="col-sm-10">
            <input type="text" name="title" class="form-control" readonly="readonly" value="${boardVO.title}">
         		<input type="hidden" name="bno1" value="${boardVO.bno}">
         </div>
  </div>
  <div class="form-group">
     <label class="col-sm-2 col-sm-2 control-label">작성자</label>
         <div class="col-sm-10">
            <input type="text" name="writer" class="form-control" readonly="readonly" value="${boardVO.writer}">
         </div>
  </div>
  <div class="form-group">
     <label class="col-sm-2 col-sm-2 control-label">내용</label>
  </div>
  <div class="form-group" style="width: 100%">
  	<div class="col-sm-10" style="width: 100%">
  		${boardVO.content}
  	</div>
	</div>
</form>
</div>
<div style="position: relative; height:50px;">
	<button class="button" id="toList" style="vertical-align:middle; float: right;">
		<span>돌아가기 </span>
	</button>
	<button class="button" id="deleteBtn" style="vertical-align:middle; float: right;">
		<span>삭제하기 </span>
	</button>
	<button class="button" id="updateBtn" onclick='saveContent()' style="vertical-align:middle; float: right;">
		<span>수정하기 </span>
	</button>
</div>
<hr>
<div style="width: 100%;">
	<div style="float:left">
		<h3>
			<i class="fa fa-angle-right"></i> 댓글목록
		</h3>
	</div>
	<div style="height:41px; float:right;">
		<button class="button" id="replyRegiBtn" style="vertical-align:middle; float: right;">
			<span>댓글쓰기</span>
		</button>
	</div>
</div>
<div style=”clear:both;”></div>
<div id="replyList" style="width: 100%; float:left;">
	
</div>

<div id="pagination" style="float:right;">

</div>
<%@include file="../modal/modalReplyBox2.jsp"%>
<%@include file="../modal/modalReplyBox.jsp"%>
<%@include file="../modal/modalDelete.jsp"%>
<%@include file="../include/listGetParameter.jsp"%>
<%@include file="../include/footer.jsp"%>




<script id="template" type="text/x-handlebars-template">
	<div class="alert alert-info" style="margin-left:{{depth}}px;">
		<div>
			<a style="font-weight: bold; font-size:12pt;">{{writer}}</a>
			<a style="margin-left:5%; color:black;">{{updatedate}}</a>
			<a style="margin-left:5%">
				<button id="replyOfReply" class="{{rno}},{{bno}},{{gno}},{{gord}},{{lpno}},{{mpno}},{{spno}}">
					<i class="fa fa-arrow-down" aria-hidden="true"></i>
				</button>
				<button id="updateReply" class=""><i class="fa fa-wrench" aria-hidden="true"></i></button>
				<button id="deleteReply" class="{{rno}}"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
			</a>
		</div>
		<div style="margin-top:4px;"><a style="color: black;">{{rcontent}}</a></div>
	</div>
</script>


<script>
	$(document).ready(function(e){
		var $document = $(document);
		var replyList = $("#replyList");
		var pagination = $("#pagination");
		var bno = $("input[name=bno1]").val();
		var replyData;
		var replys = function(bno, pageNum){
			$.ajax({
				url: "/reply/replyList",
				type: "get",
				data:{bno:bno, page:pageNum},
				success: function(result){
					var source = $("#template").html();
					var template = Handlebars.compile(source);
					for(var i=0; i<result.replyList.length; i++){
							var data = {gno:result.replyList[i].gno,gord:result.replyList[i].gord,lpno:result.replyList[i].lpno,
									mpno:result.replyList[i].mpno,spno:result.replyList[i].spno, bno:result.replyList[i].bno, 
									rno:result.replyList[i].rno, writer:result.replyList[i].writer, rcontent:result.replyList[i].rcontent, 
									updatedate:result.replyList[i].updatedate, depth:result.replyList[i].depth*40};
							
				
							var html = template(data);
							replyList.append(html);
					}
					if(result.page.prev==true){
						pagination.append("<a href='"+(result.page.startPage-1)+"'>&laquo;</a>");
					}
					for(var i=result.page.startPage; i<result.page.endPage+1; i++){
						if(result.page.cri2.page==i){
							pagination.append("<a href="+i+" id='current' class='active'>"+i+"</a>");
						} else{
							pagination.append("<a href="+i+" class=''>"+i+"</a>");
						}
					}
					if(result.page.next==true&&result.page.endPage>0){
						pagination.append("<a href='"+(result.page.endPage +1)+"'>&raquo;</a>");
					}
					
					
				}
			});
		};
		
		replys(bno, 1);
		
		$("#toList").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			$("#f1").submit();
		});
		$("#deleteBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			$("#modalDelete").modal({backdrop: 'static', keyboard: false});
		});	
			
		$("#deleteModalBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			var $bno1 = $("input[name=bno1]").val();
			var $bno= $("input[name=bno]").val($bno1);
			console.log($bno.val());
			var $f1=$("#f1");
			$f1.attr("action","/board/delete");
			$f1.attr("method","post");
			console.log($f1.attr("method"));
			$f1.submit();
		});
///////////////////////board detail script end/////////////////////////////////////

///////////////////reply new start/////////////////////////
		$("#replyRegiBtn").on("click", function(e){
			e.stopPropagation();
			e.preventDefault();
			$("#modalReplyBox").modal({backdrop: 'static', keyboard: false});
		});
		$("#replyRegiCheckBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			var rwriter = $("input[name=rwriter]").val();
			var rcontent = $("input[name=rcontent]").val();
			console.log(rwriter, rcontent, bno);
			$.ajax({
				url: "/reply/registerNew",
				type: "post",
				data: {writer: rwriter, rcontent:rcontent, bno:bno},
				success: function(e){
					$("#modalReplyBox").modal("toggle");
					replyList.empty();
					var page=$("#current").text();
					if(page==""){
						page=1;
					} else {
						
					}
					pagination.empty();
					console.log(page);
					replys(bno, page);
							
				}
			});
			
		});
	/////////////////////reply new end//////////////
	
	//////////////////////replyOfReply start/////////////////
		$document.on("click", "#replyOfReply",function(e){
			e.stopPropagation();
			e.preventDefault();
			replyData = $(this).attr("class");
			$("#modalReplyBox2").modal({backdrop: 'static', keyboard: false});
			
		});
		$("#replyRegiCheckBtn2").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			var rwriter = $("input[name=rwriter2]").val();
			var rcontent = $("input[name=rcontent2]").val();
			var strArray = replyData.split(",");
			var rno = strArray[0];
			var bno = strArray[1];
			var gno = strArray[2];
			var gord = strArray[3];
			var lpno= strArray[4];
			var mpno = strArray[5];
			var spno = strArray[6];
			console.log(replyData);
			$.ajax({
				url: "/reply/registerLpno",
				type: "post",
				data: {writer: rwriter, rcontent:rcontent, bno:bno, rno:rno,gno:gno,gord:gord,lpno:lpno,mpno:mpno,spno:spno},
				success: function(e){
					$("#modalReplyBox2").modal("toggle");
					replyList.empty();
					var page=$("#current").text();
					pagination.empty();
					console.log(page);
					replys(bno, page);
							
				}
			});
			
		});
////////////////////replyOfReply finish///////////////////
		
		$document.on("click", "#pagination a", function(e){
			e.stopPropagation();
			e.preventDefault();
			var page = $(this).attr("href");
			replyList.empty();
			pagination.empty();
			replys(bno, page);

			
		});
		
});


</script>
</body>
</html>