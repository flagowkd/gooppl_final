<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
    <div id="di2">
        <fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
                margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-12 mb-1">
                    <h5>광고 정보</h5>
                </div>
            </div>
                <div class="row">
                	<form name="admin_update" action="admin_update.do" method="post">
			            <table class="table table-bordered" style="font-size: 13px;">
			            	<tr>
                                <td rowspan="7" style="width:400px;">
                                	<img src="${odto.firstimg}" style="width:100%; height:100%;"/>
                                </td>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">광고번호</th>
                                    <td>${adto.ad_idx}
                                        <input type="hidden" value="${odto.member_idx}" name="member_idx" id="member_idx">
                                        <input type="hidden" value="${odto.owner_idx}" name="owner_idx" id="owner_idx">
                                        <input type="hidden" value="${pdto.amount}" name="amount" id="amount">
                                        <input type="hidden" value="${pdto.merchant_uid}" name="merchant_uid" id="merchant_uid">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">상호명</th>
                                    <td>${odto.title}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">이름</th>
                                    <td>${odto.name}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">이메일</th>
                                    <td>${odto.email}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">광고시작일</th>
                                    <td>${adto.ad_startDate}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">광고종료일</th>
                                    <td>${adto.ad_endDate}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">광고상태</th>
                                    <td>${adto.ad_state}</td>
                                </tr>
	                            
                            </table>
                        </form>
                </div>
        </fieldset>
    </div>