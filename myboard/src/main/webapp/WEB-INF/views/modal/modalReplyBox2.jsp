<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade in" id="modalReplyBox2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">댓글입력</h4>
			</div>
				<div class="modal-body">
					<div class="form-group">
     				<label class="col-sm-2 col-sm-2 control-label">작성자</label>
         		<div class="col-sm-10">
            	<input type="text" name="rwriter2" class="form-control">
         		</div>
  				</div>
  				<div class="form-group">
     				<label class="col-sm-2 col-sm-2 control-label">내용</label>
         		<div class="col-sm-10">
            	<input type="text" name="rcontent2" class="form-control">
         		</div>
  				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" id="replyRegiCheckBtn2" class="btn btn-primary">등록</button>
				</div>
		</div>
	</div>
</div>