<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resource/js/httpRequest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
.tr_bg{
   --bs-table-accent-bg: #24292f !important;
}
.f_tab_th{
    text-align: center;
}
.f_tab_td{
    text-align: center;
}
tr{
    border:1px solid lightgray;
}
.tb_hover{
	--bs-table-hover-bg: lightgray !important;
}
</style>
<title>Insert title here</title>
<script>
function inquiry_Details(index,size){
	var param=document.getElementById("inquiry_idx"+index).value;
	var detail_btn=document.getElementById("detail_btn"+index);
		
	if(detail_btn.value=='답변하기'){
		sendRequest('admin_inquiry_details.do?inquiry_idx='+param,null,showResult,'GET');
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			if(i==index){
				detail_btn.value='접기';
			}else{
				detail_btn.value='답변하기';
			}
			
		}
		
	}else if(detail_btn.value=='접기'){
		var divNode=document.all.inquiryDiv2;
		divNode.remove();
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			detail_btn.value='답변하기';
		}
	}
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.all.inquiryDiv;
			divNode.innerHTML=data;
		}
	}
}

function inquiry_update(inquiry_idx){
	var inquiry_content = $('#answer_content').val();
	if(inquiry_content==null || inquiry_content==""){
		Swal.fire({
			  title: '답변 내용을 확인해주세요',
			  icon: 'warning',
			  confirmButtonText: '확인'
			}) 
	}else{
		$.ajax({
			type: "GET",
			url: 'admin_inquiry_update.do',
			data:{"inquiry_answer":inquiry_content,"inquiry_idx":inquiry_idx},
			success: function(data){
				if(data==1){
					Swal.fire({
				      title: "등록하였습니다.",
				      icon:'success',
				      allowOutsideClick:false
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.reload();
				    	}
				    })
				}else{
					Swal.fire({
						  title: '답변 등록 실패',
						  icon: 'error',
						  confirmButtonText: '확인'
					})  
				}
			}
		});
	}
}
</script>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>게시판관리</b></h5>
		<dl>
			<dt>게시판관리</dt>
			<dd>
				 <a href='admin_share.do' style="color: white !important;"
				>-공유게시판 관리</a><br />
				 <a href='admin_review.do' style="color: white !important;"
				>-후기게시판 관리</a><br />
				 <a href='admin_relpy.do' style="color: white !important;"
				>-댓글 관리 </a><br />
				 <a href='#' style="color: white !important;"
				>-문의 관리 </a>
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>문의 관리</b></h6>
		<ul class='helpbox'>
			<li> 사용자들의 문의 사항에 답변을 할 수 있는 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg active text-white text-opacity-75">
                	<th class="f_tab_th">#</th>
                	<th class="f_tab_th">문의번호</th>
                	<th class="f_tab_th">회원번호</th>
                	<th class="f_tab_th">제목</th>
                	<th class="f_tab_th">작성일</th>
                	<th class="f_tab_th">답변상태</th>
                    <th class="f_tab_th" width="200">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>문의 내역이 없습니다.</b>
                		</td>
                	</tr>
                </c:if>
                <c:forEach var="list" items="${list}" varStatus="status">
                <tr>
                	<td class="f_tab_td">${(cp-1)*listSize+status.index+1}</td>
                	<td class="f_tab_td">
	                	${list.inquiry_idx}
	                	<input id="inquiry_idx${status.index}" type="hidden" value="${list.inquiry_idx}">
                	</td>
                    <td class="f_tab_td">${list.member_idx}</td>
                	<td class="f_tab_td">${list.inquiry_subject}</td>
                    <td class="f_tab_td">${list.inquiry_writedate}</td>
                    <c:if test="${list.inquiry_status=='n'}">
                    <td class="f_tab_td" style="color:red;font-weight:800;">
                    	답변요청
                    </td>	
                    </c:if>
                    <c:if test="${list.inquiry_status=='y'}">
					<td class="f_tab_td" style="color:green;font-weight:800;">
                    	답변완료
                    </td>
                    </c:if>
                    <td class="f_tab_td" width="220">
	                    <input id="detail_btn${status.index}" class="btn btn-secondary" type="button" onclick="inquiry_Details(${status.index},${size})" value="답변하기">
                    </td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                	<td colspan="8" align="center" class="f_tab_td">
					${pageStr}
					</td>
                </tr>
                </tfoot>
        </table>
        </fieldset>
        <div id="inquiryDiv"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>