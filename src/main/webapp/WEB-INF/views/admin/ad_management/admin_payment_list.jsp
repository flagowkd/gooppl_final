<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
}
.tr_aling{
	vertical-align: middle;
}
</style>
<script>
function payment_Info(index,size){
	var param=document.getElementById("imp_uid"+index).value;
	var detail_btn=document.getElementById("detail_btn"+index);
	
		
	if(detail_btn.value=='상세보기'){
		sendRequest('admin_payment_details.do?imp_uid='+param,null,showResult,'GET');
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			if(i==index){
				detail_btn.value='접기';
			}else{
				detail_btn.value='상세보기';
			}
			
		}
		
	}else if(detail_btn.value=='접기'){
		var divNode=document.all.paymentDetail;
		divNode.remove();
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			detail_btn.value='상세보기';
		}
	}
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.all.di;
			divNode.innerHTML=data;
		}
	}
}

//리스트에서 환불
function payment_refund(index){
	Swal.fire({
		title: '결제를 취소하시겠습니까?',
		text: "해당광고는 내려가게됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '결제취소',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var imp_uid = document.getElementById("imp_uid"+index).value;
			var merchant_uid = document.getElementById("merchant_uid"+index).value;
			var amount = document.getElementById("amount"+index).value;
			console.log('imp_uid:'+imp_uid);
			console.log('merchant_uid:'+merchant_uid);
			console.log('amount: '+amount);
	  		
	  		
			jQuery.ajax({
				"url": "https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel?_token=8f60e798e922a4b66c24a82472de9cec57dc7603", // 예: http://www.myservice.com/payments/cancel
			    "type": "POST",
			    "contentType": "application/json",
			    "data": JSON.stringify({
			    	"imp_uid": imp_uid,
			        "merchant_uid": merchant_uid, // 예: ORD20180131-0000011
			        "cancel_request_amount": amount, // 환불금액
			        "reason": '관리자환불' // 환불사유
			    }),
			    "dataType": "json"
			}).done(function(result) { //환불 성공시 로직
				var param = 'imp_uid='+imp_uid;
				sendRequest('admin_refund_Ok.do', param, showResult2, 'GET');

			}).fail(function(error) { //환불 실패시 로직
				Swal.fire({
				      title: '환불 실패',
				      icon:'error',
				      confirmButtonText: '확인',
				      confirmButtonColor: '#d33'
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.reload();
				    	}
				    })
				   
			});
		}
	})
}

function showResult2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			console.log('db넘어와따!');
			var data = XHR.responseText;
			data = eval('('+data+')');
			console.log(data);
			console.log(data.code);
			if(data.code==1){
				Swal.fire({
					title: '환불이 완료되었습니다.',
					icon:'success',
					confirmButtonText: '확인',
					confirmButtonColor: '#A4C399'
				}).then((result) => {
					if (result.isConfirmed) {
						location.reload();
				    }
				});
			}else if(data.code==2){
				Swal.fire({
				    title: 'Data ERROR',
				    text: data.msg,
				    icon:'error',
				    confirmButtonText: '확인',
				    confirmButtonColor: '#d33'
			    }).then((result) => {
			    	if (result.isConfirmed) {
			    		location.reload();
			    	}
			    });
			}
		}else if(data.code==0){
			Swal.fire({
			    title: 'ERROR',
			    icon:'error',
			    confirmButtonText: '확인',
			    confirmButtonColor: '#d33'
		    }).then((result) => {
		    	if (result.isConfirmed) {
		    		location.reload();
		    	}
		    });
		}
	}
}

//상세보기에서 환불
function admin_refundD(imp_uid, merchant_uid, amount){
	Swal.fire({
		title: '결제를 취소하시겠습니까?',
		text: "해당광고는 내려가게됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '결제취소',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
			console.log('imp_uid:'+imp_uid);
			console.log('merchant_uid:'+merchant_uid);
			console.log('amount: '+amount);
	  		
	  		
			jQuery.ajax({
				"url": "https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel?_token=bc4659bff8d33f99b74245c56b465eadf4735715", // 예: http://www.myservice.com/payments/cancel
			    "type": "POST",
			    "contentType": "application/json",
			    "data": JSON.stringify({
			    	"imp_uid": imp_uid,
			        "merchant_uid": merchant_uid, // 예: ORD20180131-0000011
			        "cancel_request_amount": amount, // 환불금액
			        "reason": '관리자환불' // 환불사유
			    }),
			    "dataType": "json"
			}).done(function(result) { //환불 성공시 로직
				var param = 'imp_uid='+imp_uid;
				sendRequest('admin_refund_Ok.do', param, showResult2, 'GET');

			}).fail(function(error) { //환불 실패시 로직
				Swal.fire({
				      title: '환불 실패',
				      icon:'error',
				      confirmButtonText: '확인',
				      confirmButtonColor: '#d33'
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.reload();
				    	}
				    })
				   
			});
		}
	})
}


</script>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>광고관리</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_ownerAppli.do' style="padding-left:18px; font-size: 13px; background-color: #24292f; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_ownerAppli.do'></use></svg>
          광고주 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_allOwner.do' class="nav-link text-white" style="padding-left:18px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_allOwner.do'></use></svg>
          광고주 정보 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adAppli.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adAppli.do'></use></svg>
          광고 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adCancel.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adCancel.do'></use></svg>
          환불 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_paymentStatus.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_paymentStatus.do'></use></svg>
          결제 내역 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adStatus.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adStatus.do'></use></svg>
          광고 상태 관리
        </a>
      </li>
    </ul>
    <hr>
     </div>
	<div id="contents">
    	<h6><b>결제 내역 관리</b></h6>
    	<ul class='helpbox'>
				<li>결제 내역을 확인하고 관리할 수 있는 메뉴입니다.</li>
			</ul>
		
			<div class="row">
				<div class="col-md-12 text-left">
					<label><b>총 결제수:${totalPayment}</b></label>
				</div>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-center active text-white text-opacity-75" style="width:4%;">번호</th>
                    <th class="text-center active text-white text-opacity-75" style="width:12%;">결제번호</th>
					<th class="text-center active text-white text-opacity-75" style="width:10%;">결제금액</th>
					<th class="text-center active text-white text-opacity-75" style="width:30%;">주문번호</th>
					<th class="text-center active text-white text-opacity-75" style="width:14%;">결제일</th>
					<th class="text-center active text-white text-opacity-75" style="width:10%;">상태</th>
					<th class="text-center active text-white text-opacity-75" style="width:15%;">기능</th>
				</tr>
		</thead>
			<tfoot style="border-top: 0px">
		      <tr>
				<td colspan="10" class="text-center">${pageStr}</td>
		     </tr>
		  	</tfoot>
		  <tbody>
		  	<c:if test="${empty list}">
		  		<tr>
				<td colspan="10" align="center">
				<b>등록된 회원이 없습니다.</b>
				</td>
			</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${list}" varStatus="status">
		  		<tr class="tr_aling">
			      <td class="text-center" style="width:4%;">${(cp-1)*listSize+status.index+1}</td>
			      <td class="text-center" style="width:12%;">${list.imp_uid}
			      	<input id="imp_uid${status.index}" type="hidden" value="${list.imp_uid}">
			      	<input id="merchant_uid${status.index}" type="hidden" value="${list.merchant_uid}">
			      	<input id="amount${status.index}" type="hidden" value="${list.amount}">
			      </td>
			      <td class="text-center" style="width:10%;">${list.amount} \</td>
			      <td class="text-center" style="width:30%;">${list.merchant_uid}</td>
			      <td class="text-center" style="width:14%;">${list.payDate}</td>
			      <td class="text-center" style="width:10%;">${list.status}</td>
			      <td class="text-center" style="width:15%;">
			      <c:if test="${list.status.equals('paid')}">
			      	<input id="detail_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-secondary" value="상세보기" onclick="payment_Info(${status.index},${size})">
			      	<input id="refund_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-danger" value="환불" onclick="payment_refund(${status.index})">
			      </c:if>
			      <c:if test="${list.status.equals('cancelled')}">
			      	<input id="detail_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-secondary" value="상세보기" onclick="payment_Info(${status.index},${size})">
			      </c:if>
			      </td>
			    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
		<div id="di"></div>
       </div> 
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>