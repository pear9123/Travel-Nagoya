<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/WEB-INF/views/admin/inc/AdminHeader.jsp"/>

<!-- Begin Page Content -->
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

	</div>
</div>
<!-- End of Main Content -->
      
<jsp:include page="/WEB-INF/views/admin/inc/AdminFooter.jsp"/>