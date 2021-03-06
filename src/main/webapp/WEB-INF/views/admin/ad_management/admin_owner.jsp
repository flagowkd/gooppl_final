<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

              	//주소-좌표 변환 객체를 생성
                var geocoder = new daum.maps.services.Geocoder();
                
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                
                geocoder.addressSearch(addr, function(results, status) {
                	if(status === daum.maps.services.Status.OK) {
	                	var result = results[0];
	                	var mapx = result.x;
	                	var mapy = result.y;
                		var x = document.getElementById('mapx');
                        var y = document.getElementById('mapy');
                        x.value = mapx;
                        y.value = mapy;
                	}
                	
                })
                
                
                
                

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr").value = addr;
            }
        }).open();
    }
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
<script>
//특별, 광역시, 도 단위 지역 이동시 처리할 함수
function changeAreacode(){
   var sigunguSelector=document.getElementById('sigungucode');
   var optionNodes=sigunguSelector.getElementsByTagName('option');
   for(var i=0;i<optionNodes.length;i++){
      var optionNode=optionNodes[i];
      optionNode.style.display='none';
   }
   sigunguSelector.value='';
   var areaSelector=document.getElementById('areacode');
   var areacodeVal=areaSelector.options[areaSelector.selectedIndex].value;
   var areacodeText=areaSelector.options[areaSelector.selectedIndex].text;
   var sigunguList = document.getElementsByClassName(areacodeVal);
   for(var i=0;i<sigunguList.length;i++){
      var sigungu=sigunguList[i];
      sigungu.style.display='block';
   }
}

function owner_Details(index,size){
	var param = document.getElementById("owner_idx"+index).value;
	var area = document.getElementById("areacode"+index).value;
	var sigungu = document.getElementById("sigungucode"+index).value;
	var detail_btn = document.getElementById("detail_btn"+index);
	
	if(detail_btn.value=='상세보기'){
		sendRequest('admin_owner_detail.do?owner_idx='+param+'&areacode='+area+'&sigungucode='+sigungu,null,showResult,'GET');
		for(var i=0; i<size; i++){
			detail_btn = document.getElementById("detail_btn"+i);
			if(i==index){
				detail_btn.value='접기';
			}else{
				detail_btn.value='상세보기';
			}
		}
	}else if(detail_btn.value=='접기'){
		var divNode = document.all.ownerDetail;
		divNode.remove();
		for(var i=0; i<size; i++){
			detail_btn = document.getElementById('detail_btn'+i);
			detail_btn.value='상세보기';
		}
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.all.ownerDiv;
			divNode.innerHTML=data;
		}
	}
}



function ownerD_Update(){
	$.ajax({
			type: "POST",
			data: new FormData($("#ownerForm")[0]),
			url: 'admin_ownerUpdate.do',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			cache: false,
			dataType: "json",
			error: function(result){
			},
			success: function(result){
				if(result.code==1){
					Swal.fire({
				      title: result.msg,
				      icon:'success',
				      confirmButtonText: '확인',
				      confirmButtonColor: '#A4C399',
				      showLoaderOnConfirm: true,
				      allowOutsideClick: false
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.href='/gooppl/admin_allOwner.do';
				    	}
				    })
				}else {
					Swal.fire({
				      title: result.msg,
				      icon:'error',
				      confirmButtonText: '확인',
				      confirmButtonColor: '#d33',
				      showLoaderOnConfirm: true,
				      allowOutsideClick: false
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.href='/gooppl/admin_allOwner.do';
				    	}
				    })
				}
			}
		
	});
}

//리스트의 삭제
function owner_Delete(index){
	Swal.fire({
		title: '광고주 정보를 삭제하시겠습니까?',
		text: "삭제된 정보는 복구가 불가능합니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#A4C399',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick: () => !Swal.isLoading()
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var owner_idx=document.getElementById("owner_idx"+index).value;
	  		var member_idx = document.getElementById("member_idx"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_owner_del.do?owner_idx='+owner_idx+'&member_idx='+member_idx,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399'
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}else {
						Swal.fire({
					      title: result.msg,
					      icon:'error',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#d33'
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}
				}
			});
	  }
	})	
}

//상세보기의 삭제
function ownerD_Delete(owner_idx, member_idx){
	Swal.fire({
		title: '요청을 거절하시겠습니까?',
		text: "신청된 정보는 삭제됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#A4C399',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick: () => !Swal.isLoading()
	}).then((result) => {
	  if (result.isConfirmed) {
	  		
			$.ajax({
				type: "GET",
				url: 'admin_owner_del.do?owner_idx='+owner_idx+'&member_idx='+member_idx,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399'
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}else {
						Swal.fire({
					      title: result.msg,
					      icon:'error',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#d33'
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}
				}
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
	<div id="contents"><h6><b>광고주 관리</b></h6>
		<ul class='helpbox'>
			<li>승인된 광고주 정보를 확인하고 수정 및 삭제를 할 수 있는 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg active text-white text-opacity-75">
                	<th class="f_tab_th">번호</th>
                	<th class="f_tab_th">광고주번호</th>
                	<th class="f_tab_th">사업자번호</th>
                	<th class="f_tab_th">사업자명</th>
                	<th class="f_tab_th">상호명</th>
                	<th class="f_tab_th">이메일</th>
                    <th class="f_tab_th" width="200">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>광고주 신청이 없습니다.</b>
                		</td>
                	</tr>
                </c:if>
                <c:forEach var="list" items="${list}" varStatus="status">
                <tr>
                	<td class="f_tab_td">${(cp-1)*listSize+status.index+1}</td>
                	<td class="f_tab_td">
	                	${list.owner_idx}
	                	<input id="owner_idx${status.index}" type="hidden" value="${list.owner_idx}">
                		<input id="member_idx${status.index}" type="hidden" value="${list.member_idx}">
                		<input id="areacode${status.index}" type="hidden" value="${list.areacode}">
                		<input id="sigungucode${status.index}" type="hidden" value="${list.sigungucode}">
                	</td>
                    <td class="f_tab_td">${list.business_number}</td>
                	<td class="f_tab_td">${list.name}</td>
                    <td class="f_tab_td">${list.title}</td>
                    <td class="f_tab_td">${list.email}</td>
                    <td class="f_tab_td" width="220">
	                    <input id="detail_btn${status.index}" class="bt btn-secondary" type="button" onclick="owner_Details(${status.index},${size})" value="상세보기">
	                    <input id="delete_btn${status.index}" class="bt btn-danger" type="button" onclick="owner_Delete(${status.index})" value="삭제">
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
        <div id="ownerDiv"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>