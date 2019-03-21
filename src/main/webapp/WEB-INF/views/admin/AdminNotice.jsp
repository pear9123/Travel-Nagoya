<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<jsp:include page="/WEB-INF/views/admin/inc/AdminHeader.jsp"/>

<script>
	function deletenotice(uid){
		var result = confirm('삭제하시겠습니까?');
		if(result){
			$("#delete_uid").val(uid);
			$("#deleteform").submit();
		}
	}
</script>

<!-- Begin Page Content -->
<form action="/AdminNoticeDelete.do" id="deleteform">
	<input type="hidden" name="delete_uid" id="delete_uid">
</form>
<div class="container-fluid">
		
		<form class="form-inline" action="/AdminNoticeProc.do" method="post">
  			<div class="form-group mb-2">
    			<label for="staticEmail2" class="sr-only">공지사항 간편입력</label>
    			<input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="공지사항 간편입력">
  			</div>
  			<div class="form-group mx-sm-3 mb-2">
    		<label for="inputPassword2" class="sr-only">input...</label>
    			<input type="text" class="form-control" name="notice"/>
  			</div>
  				<button type="submit" class="btn btn-primary mb-2">Confirm</button>
		</form>
		
		<!-- Circle Buttons -->
		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col" width="85%">공지사항</th>
			      <th scope="col" width="15%">삭제</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="list" items="${list }">
			  		<tr>
				      <td>${list.notice }</td>
				      <td><a onclick="deletenotice('${list.uid}')" href="#" class="btn btn-danger btn-circle btn-sm">
	                    	<i class="fas fa-trash"></i>
	                  	</a></td>
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
	</div>
	
	
</div>
<!-- End of Main Content -->
      
<jsp:include page="/WEB-INF/views/admin/inc/AdminFooter.jsp"/>