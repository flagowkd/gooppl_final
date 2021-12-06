<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
    <div id="ownerDetail">
        <fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
			margin-bottom: 20px;">            <div class="row">
                <div class="col-md-12 mb-1">
                <div class="row">
                	<div class="col-md-7">
                    	<h5>광고주 정보</h5>
                	</div>
                	<div class="col-md-5">
                       <div class="row">
                          <div class="col-md-6">
                           <select class="form-select" id="areacode" name="areacode" onchange="changeAreacode()" required>
                               <option value="${dto.areacode}" selected>${dto.areacode }</option>
                               	<c:forEach var="areadto" items="${arealist}">
                           			<option value="${areadto.areacode}" data-value="${areadto.latitude },${areadto.longitude}">${areadto.areaname }</option>
                        		</c:forEach>
                          </select>  
                          </div>
                          <div class="col-md-6">
                           <select class="form-select" name="sigungucode" id="sigungucode"  required>
                         <option value="${dto.sigungucode}" selected>${dto.sigungucode }</option>
                        <c:forEach var="sigungudto" items="${sigungulist}">
                           <option value="${sigungudto.sigungucode }" class="${sigungudto.areacode }" style="display:none;">${sigungudto.sigungu_name }</option>
                        </c:forEach>
                     </select>                    
                          </div>
                       </div>
                    </div>
                </div>
                </div>
            </div>
                <div class="row">
                        <form name="ownerForm" action="admin_ownerUpdate.do" method="post" enctype="multipart/form-data">
                            <table class="table table-bordered" style="font-size: 13px;">
                                <tr>
                                <td rowspan="9" style="width:400px;">
                                	<img src="resource/img/gapyeong.jpg" style="width:100%; height:100%;"/>
                                </td>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c; width:30%s">광고주번호 / 회원번호</th>
                                    <td>${dto.owner_idx} / ${dto.member_idx}
                                        <input type="hidden" value="${dto.member_idx}" name="member_idx" id="member_idx">
                                        <input type="hidden" value="${dto.owner_idx}" name="owner_idx" id="owner_idx">
                                    	<input type="hidden" value="${dto.contenttype}" name="contenttype" id="contenttype">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">사업자번호</th>
                                    <td><input type="text" id="business_number" name="business_number" value="${dto.business_number}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">상호명</th>
                                    <td>
                                    	<input type="text" id="title" name="title" value="${dto.title}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">사업자명</th>
                                    <td><input type="text" id="name" name="name" value="${dto.name}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">이메일</th>
                                    <td><input type="text" id="email" name="email" value="${dto.email}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">전화번호</th>
                                    <td><input type="text" id="tel" name="tel" value="${dto.tel}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">업체번호</th>
                                    <td><input type="text" id="business_tel" name="business_tel" value="${dto.business_tel}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">주소</th>
                                    <td>
                                    <input type="text" id="addr" name="addr" value="${dto.addr}" required>
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                    <input type="text" id="detailed_addr" name="detailed_addr" value="${dto.detailed_addr}">
                                    
                                    <input type="hidden" id="mapx" name="mapx" value="${dto.mapx}">
                                    <input type="hidden" id="mapy" name="mapy" value="${dto.mapy}">
                                    
                                    
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                		<input type="file" id="firstimg" name="firstimg">
                                	</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;" colspan="3">설명</th>
                                </tr>
                                <tr>    
                                    <td colspan="3">
                                    <textarea id="ad_content" name="ad_content" rows="6" style="width:100%;" >${dto.ad_content}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-center">
                                        <input class="bt btn-secondary" type="submit" value="수정">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
        </fieldset>
    </div>
</body>
</html>