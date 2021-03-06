<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.tr_bg{
   --bs-table-accent-bg: #24292f !important;
}
.tb_hover{
	--bs-table-hover-bg: lightgray !important;
	border-top:none !important;
}
caption{
	display:none;
}
.table>:not(:first-child) {
	border-top:2px solid #e3e3e3 !important;
}
</style>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>회원관리</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_member_list.do' style="font-size: 13px; background-color: #24292f; padding-left: 41px; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_member_list.do'></use></svg>
          회원목록
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_member_out.do' class="nav-link text-white" style="font-size: 13px; padding-left: 28px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_member_out.do'></use></svg>
          탈퇴회원목록
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_formmail_settings.do' class="nav-link text-white" style="font-size: 13px; padding-left: 32px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_formmail_settings.do'></use></svg>
          폼메일 관리
        </a>
      </li>
    </ul>
    <hr>
     </div>
	<div id="contents">
		<h3>폼메일 관리</h3>
			<ul class='helpbox'>
				<li>여러가지 상황(회원가입축하 메일,비밀번호찾기 메일 등)에 따른 폼메일을 관리할 수 있습니다.</li>
			</ul>
<script type="text/javascript">
function changeCode(item) {
	var param = item.options[item.selectedIndex].value;
	location.href="admin_formmail_settings.do?form_type="+param;
}

function openPreview(form_no) {
	var form_type = document.getElementById('form_type').value;
	var form_title = document.getElementById('form_title').value;
	var form_content = document.getElementById('form_content').value;
	form_content = encodeURIComponent(form_content);	
	window.open('mail_form_preview_pop.do?form_no='+form_no+'&form_type='+form_type+'&form_title='+form_title+'&form_content='+form_content	, 'previewMailForm' , 'width=900px,height=700px,top=300,left=800');

}

function formmailUpdate(form_no){
	Swal.fire({
		title: '수정하시겠습니까?',
		text: "",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var form_type = document.getElementById('form_type').value;
	  		var form_title = document.getElementById('form_title').value;
	  		var form_content = document.getElementById('form_content').value;
	  		form_content = encodeURIComponent(form_content);	
			$.ajax({
				type: "GET",
				url: 'form_update.do?form_no='+form_no+'&form_type='+form_type+'&form_title='+form_title+'&form_content='+form_content,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==0){
						Swal.fire({
					      title: result.msg,
					      icon:'warning',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#d33',
					      showLoaderOnConfirm: true,
					      allowOutsideClick:false
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}else if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399',
					      showLoaderOnConfirm: true,
					      allowOutsideClick:false
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
	
	<form name="Frm" action="formmail_update.do" method="post">
			<table class="table table-bordered" >
			<caption>폼메일 수정</caption>
			<colgroup><col width="130"><col width="*"></colgroup>
			<thead style="border-top:none !important;">
				<tr>
					<th class="text-center tr_bg active text-white" style="border-top:1px solid #e3e3e3 !important;">폼메일</th>
					<td>
					<select id='form_type' name='form_type' onChange='changeCode(this);' >
						<c:forEach var="list" items="${list}">
							<option value='${list.form_type}'>${list.form_type}</option>
						</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<th class="text-center tr_bg active text-white">메일 제목</th>
					<td>
						<input id="form_title" class="text_input" style="width:98%" value="${fdto.form_title}" maxlength="100">
					</td>
				</tr>
			</thead>
			<tbody style="border-top:none !important;">
			<tr>
				<td colspan="2" style="padding:0" class="text-center">
					<textarea id="form_content" class="text_input" style="height:350px;width:99%;border:0">${fdto.form_content}</textarea>
				</td>
			</tr>
			</tbody>
			<tfoot style="border-top:0px;">
				<tr>
					<td colspan="2" class="text-center">
					<button class="btn btn-dark" style="border-radius: 3px;" type="button" onClick="openPreview(${fdto.form_no})">미리보기</button>
					<button class="btn btn-dark" style="border-radius: 3px;" type="button" onClick="formmailUpdate(${fdto.form_no})">확인</button>
					</td>
				</tr>
			</tfoot>
			</table>
	</form>
	
	<!-- 설명 -->
			<div class="mgt20"><img src="${pageContext.request.contextPath}/resource/img/icon_tip.gif" alt="TIP" /></div>
	
			<div class="replacement">
				<h2>※ 치환코드<span>(내용 중 프로그램으로 된 정보를 뿌려줄때 아래와 같이 코드를 삽입합니다.)</span></h2>
				<p>회원가입</p>
				<ul>
					<li><span>{{NICKNAME}}</span> : 닉네임</li>
				</ul>
				<p>이메일 인증</p>
				<ul>
					<li><span>{{EMAILTOKEN}}</span> : 인증번호</li>
				</ul>
				<p>비밀번호 찾기</p>
				<ul>
					<li><span>{{GOO_ID}}</span> : 닉네임</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>