<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- 수정할 코드 -->
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='bno' value="${boardVO.bno}"> <input
						type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" value="${boardVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"
							readonly="readonly">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.writer}"
							readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

			  <div class="box-footer">
			    <button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
			    <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
			    <button type="submit" class="btn btn-primary" id="goListBtn">GO LIST </button>
			  </div>
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter"> <label for="exampleInputEmail1">Reply
						Text</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
						REPLY</button>
				</div>
			</div>


			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List </span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>      
	
</section>
<!-- /.content -->
<%-- <section class="content">
<form role="form" action="modifyPage" method="post">
	<input type='hidden' name='bno' value="${boardVO.bno }"> <input
		type='hidden' name='page' value="${cri.page }"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum }"> <input
		type='hidden' name='searchType' value="${cri.searchType }"> <input
		type='hidden' name='keyword' value="${cri.keyword }">
	<label>"${cri.keyword }"+"${cri.searchType }" </label>
</form>

<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label> <input type="text"
			name='title' class="form-control" value="${boardVO.title }"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> <input type="text"
			name="writer" class="form-control" value="${boardVO.writer }"
			readonly="readonly">
	</div>
</div>
<!-- /.box-body -->
<div class="box-footer">
	<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
	<button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
	<button type="submit" class="btn btn-primary goListBtn">GO
		LIST</button>
</div>

<div class="row">
	<div class="col-md-12">

		<div class="box box-success">
			<div class="box box-header">
				<h3 class="box-title">ADD NEW REPLY</h3>
			</div>
			<div class="box-body">
				<label for="newReplyWriter">Writer</label> <input
					class="form-control" type="text" placeholder="USER ID"
					id="newReplyWriter"> <label for="newReplyText">ReplyText</label>
				<input class="form-control" type="text" placeholder="REPLY TEXT"
					id="newReplyText">
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<button type="submit" class="btn btn-pirmary" id="replyAddBtn">ADD REPLY</button>
			</div>
		</div>
		<!-- The time line -->
		<ul class="timeline">
			<!-- timeline time label -->
			<li class="time-label" id="repliesDiv"><span class="bg-green">Replies
					List</span></li>
		</ul>

		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin">
			</ul>
		</div>
	</div>
</div>
</section> --%>

<!-- p434 -->
<script id = "template" type = "text/x-handlebars-template">
{{#each.}}
<li class = "replyLi" data-rno = {{rno}}>
<i class = "fa fa-comments bg-blue"></i>
	<div class= "timeline-item">
		<span class = "time">
			<i class = "fa fa-clock-o"></i>{{prettifyDate regdate}}
		</span>
		<h3 class = "timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
		<div class = "timeline-body">{{replytext}}</div>
			<div class = "timeline-footer">
				<a class = "btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
			</div>
		</div>
</li>
{{/each}}
</script>

<script>
//p435
 Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});

var printData = function(replyArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

//p436
var bno = ${boardVO.bno};
var replyPage = 1;

/* function getPage(pageInfo){
	$.getJSON(pageInfo, function(data){
		alert("getpage함수 들어옴");
		alert(data);
		//System.out.println("getPage");
		
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));
		$("#modifyModal").modal('hide');
		console.log("getPage");
	});
}내코드 */

function getPage(pageInfo) {

	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));

		$("#modifyModal").modal('hide');

	});
}
  
var printPaging = function(pageMaker, target){
	var str = "";
	console.log("pageMaker.prev" + pageMaker.prev);
	console.log("pageMaker.next" + pageMaker.next);
	if(pageMaker.prev){
		console.log("pageMaker.prev" + pageMaker.prev);
		str+="<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}

	for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len;i++){
		var strClass = pageMaker.cri.page ==i?'class=active':'';
	  //str+="<li"+strClass+"><a href='" +i+"'>"+i+"</a></li>";//내 원래코드
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";//내 원래코드 수정
		//str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";//맞는 코드
		
	}
	
	if(pageMaker.next){
		console.log("pageMaker.next" + pageMaker.next);
		str+="<li><a href='"+(pageMaker.endPage +1)+"'> >> </a></li>";
	}
	target.html(str);
}; 

 //p438
$("#repliesDiv").on("click", function(){
	if($(".timeline li").size()>1){
		return;
	}
	getPage("/replies/" +bno +"/1");
});

//p439
$(".pagination").on("click", "li a", function(event){
	event.preventDefault();
	replyPage = $(this).attr("href");
	getPage("/replies/" + bno + "/" + replyPage);
}); 
//p440
/*  $("#replyAddBtn").on("click", function(){
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext = replytextObj.val();
	
	//System.out.println("replyAddBtn");
	console.log("replyAddBtn");
	
	$.ajax({
		type : 'post',
		url : '/replies/',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType : 'text',
		data : JSON.stringify({bno:bno, replyer : replyer, replytext:replytext}),
 		success:function(result){
 			//System.out.println("success");
 			//System.out.println("result" +result);
			//console.log("result : " + result);
			alert("success:function에 들어옴.");
			if(result=='success'){
				alert("등록 되었습니다." + bno);
				replyPage = 1;
				getPage("/replies/" + bno + "/" + replyPage);
				alert("getPage 지나서");
				replyerObj.val("");
				replytextObj.val("");
			}
		} 
	});
});  */
 $("#replyAddBtn").on("click",function(){
	 
	 var replyerObj = $("#newReplyWriter");
	 var replytextObj = $("#newReplyText");
	 var replyer = replyerObj.val();
	 var replytext = replytextObj.val();
	
	  
	  $.ajax({
			type:'post',
			url:'/replies/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage );
					replyerObj.val("");
					replytextObj.val("");
				}
		}});
});
</script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/sboard/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/sboard/removePage");
			formObj.submit();
		});
		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
	});
</script>

<%@include file="../include/footer.jsp"%>