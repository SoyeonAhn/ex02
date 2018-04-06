<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#modDiv{
width : 300px;
height : 100px;
background-color :gray;
position :absolute;
top : 50%;
left : 50%;
margin-top : -50px;
margin-left : -150px;
padding : 10px;
z-index :1000;
}

</style>
</head>
<body>
	<h2>Ajax Test Page</h2>
	
	<div>
		<div>
			REPLYER<input type = 'text' name = 'replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT<input type = 'text' name = 'replytext' id='newReplyText'>
		</div>
		<button id = "replyAddBtn">ADD REPLY</button>
	</div>
	
	<div id = 'modDiv' style="display:none;">
		<div class = 'modal-title'></div>
		<div>
		 <input type = 'text' id = 'replytext'>
		</div>
		<div>
		 <button type = "button" id = "replyModBtn">Modify</button>
		 <button type = "button" id = "replyDelBtn">DELETE</button>
		 <button type = "button" id = "closeBtn">Close</button>
		</div>
	</div>
	
	
	<ul id="replies"></ul>
	
	<ul class = 'pagination'>
	</ul>
	
	
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

	<script type="text/javascript">

	var bno = 93;
	
	$.getJSON("/replies/all/" + bno, function(data) {
		var str = "";

		console.log("data.length");
		console.log(data.length);

		$(data).each(function() {
			str += "<li data-rno='" + this.rno + "'class='replyLi'>"
					+ this.rno
					+ ":"
					+ this.replytext
					+ "<button>MOD</button></li>";
		});
		$("#replies").html(str);
	});
	
	function getAllList() {

	$.getJSON("/replies/all/" + bno, function(data) {
			var str = "";

			console.log("data.length");
			console.log(data.length);

			$(data).each(function() {
				str += "<li data-rno='" + this.rno + "'class='replyLi'>"
						+ this.rno
						+ ":"
						+ this.replytext
						+ "<button>MOD</button></li>";
			});
			$("#replies").html(str);
		});
	
/* 	$(data).each(function(){
		str+="<li data-rno='"+this.rno + "' class='replyLi'>"
		+this.rno + ":" + this.replytext + "<button>MOD</button></li>";
		}); */
	}
	
	$("#replyAddBtn").on("click", function(){
		
		var replyer = $("#newReplyWriter").val();
		console.log(replyer);
		var replytext = $("#newReplyText").val();
		console.log(replytext);
		$.ajax({
			type : 'post',
			url : '/replies',
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext: replytext
			}),
			success : function(result){
				if(result=='success'){
					alert("등록 되었습니다.");
					getAllList();
				}
			}
		});
	});
	
	$("#replies").on("click", ".replyLi button", function(){
		
		var reply = $(this).parent();
		
		var rno = reply.attr("data-rno");
		var replytext = reply.text();
		
		//alert(rno + " : " + replytext);
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
	
	$("#replyDelBtn").on("click", function(){
		
		var rno = $(".modal-title").html();
		var replytext = $("#newReplytext").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result){
				console.log("result" + result);
				if(result=='success'){
					alert("삭제 되었습니다.");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});
	
	$("#replyModBtn").on("click", function(){
		
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({replytext:replytext}),
			dataType : 'text',
			success : function(result){
				console.log("result" + result);
				if(result=='success'){
					alert("수정 되었습니다.");
					$("#modDiv").hide("slow");
					//getAllList();
					getPageList(replyPage);
				}
			}
		});
	});
	

	
	
	function getPageList(page){
		$.getJSON("/replies/" + bno + "/" + page, function(data){
			console.log(data.list.length);
		
			var str ="";
			
			$(data.list).each(function(){
				str+="<li data-rno='"+this.rno+"'class='replyLi'>"
				+this.rno + ":" + this.replytext
				+"<button>MOD</button></li>";
			});
			
			$("#replies").html(str);
			
			printPaging(data.pageMaker);
		});
	}
	
	function printPaging(pageMaker){
		console.log("printPaging");
		var str = "";
		
		if(pageMaker.prev){
			str +="<li><a href = '"+(pageMaker.startPage-1)+"'><< </a></li>";
		}
		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i<=len; i++){
			var strClass = pageMaker.cri.page ==i?'class=active':'';
			str+="<li " + strClass + "><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			str+="<li><a href='" + (pageMaker.endPage +1) + "'> >> </a></li>";
		}
		$('.pagination').html(str);
	}
	
	bno = 93;
	getPageList(1);
	
	var replyPage = 1;
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPageList(replyPage);
	});
	
	</script>
</body>
</html>