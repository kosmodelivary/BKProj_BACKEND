<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<c:import url="/admin/include/loginCheck.jsp" />
  	<c:import url="/admin/include/head.jsp" />
  	
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	
  	<style type="text/css">
  		td {
  			top: 50%;
  		}
  		
  		.col {
  			text-align: center;
  			width:20%;
  		}
  		
  		.form-control {
  			width:auto;
  		}
  	</style>

  	<script type="text/javascript">
		var isAdd = function() {
			if (confirm('정말 추가하시겠습니까?') == true) {
				alert('추가합니다.');
				return true;
			} else {
				alert('추가하지 않습니다.');
				return false;
			}
		};

	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = fullAddr;
	            }
	        }).open();
	    }
  	</script>
  	
  </head>

  <body>
	<c:import url="/admin/include/navigator.jsp" />

    <div class="container-fluid">
      <div class="row">
      	<c:import url="/admin/include/leftSidebar.jsp" /><!-- sidebar -> leftSidebar로 변경 -->

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	     	<div class="row" style="padding-top:10px">
	     		<div class="col-md-7 text-right">
	     			<form class="form-inline" action="<c:url value='/ADMIN/STORE/Add.do' />" method="post">
			     		<table class="table table-bordered text-left">
			     			<tr>
			     				<td class="col">매장 이름</td>
			     				<td><input class="form-control" type="text" name="name"></td>
			     			</tr>
			     			<tr>
			     				<td class="col">매장 주소</td>
			     				<td>
			     					<input class="form-control" type="text" name="address" id="address" size="50" placeholder="주소">
			     					<input class="btn btn-default" type="button" onclick="execDaumPostcode()" value="주소 검색">
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >연락처</td>
			     				<td><input class="form-control" type="text" name="tel"></td>
			     			</tr>
			     			<tr>
			     				<td class="col" >딜리버리 시간 (주중)</td>
			     				<td>
			     					<select name="weekdayon">
			     						<c:forEach var="hour" begin="6" end="12" varStatus="loop" >
				     						<option <c:if test="${hour == 10 }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
									~
			     					<select name="weekdayoff">
			     						<c:forEach var="hour" begin="13" end="25" varStatus="loop" >
				     						<option <c:if test="${hour == 24 }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >딜리버리 시간 (주말)</td>
			     				<td>
			     					<select name="weekendon">
			     						<c:forEach var="hour" begin="6" end="12" varStatus="loop" >
				     						<option <c:if test="${hour == 10 }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
									~
			     					<select name="weekendoff">
			     						<c:forEach var="hour" begin="13" end="25" varStatus="loop" >
				     						<option <c:if test="${hour == 24 }">selected</c:if>>${hour }:00</option>
			     						</c:forEach>
			     					</select>
			     				</td>
			     			</tr>
			     			<tr>
			     				<td class="col" >최소 주문 금액</td>
			     				<td>
			     					<select name="minordermoney">
			     						<c:forEach var="money" begin="6000" end="10000" step="1000" varStatus="loop" >
				     						<option <c:if test="${money == 8000 }">selected</c:if>>${money }</option>
			     						</c:forEach>
			     					</select>
			     					원
			     				</td>
			     			</tr>
			     		</table>
			     		<input class="btn btn-primary" type="submit" value="매장 추가" onclick="return isAdd()">
			     		<a href="<c:url value='/ADMIN/STORE/List.do' />" class="btn btn-primary">취소</a>
		     		</form>
	     		</div>
	     	</div>
        </div>
        
      </div>
    </div>
  </body>
</html>