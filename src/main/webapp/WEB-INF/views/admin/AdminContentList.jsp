<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<jsp:include page="/WEB-INF/views/admin/inc/AdminHeader.jsp"/>
<script>
	function content_delete(pid){
		console.log(pid);
		var conf = confirm("정말 삭제 하시겠습니까?");
		$('#delete_pid').val(pid);
		if(conf){
			$('#admin_delete').submit();
		} else {
			window.location.href = "/AdminContentList.do";
		}
		
	}
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<form action="/AdminContentDelete.do" method="post" id="admin_delete">
		<input type="hidden" id="delete_pid" name="delete_pid" >
	</form>
	
	<c:forEach var="list" items="${list }" varStatus="status">
		<p>
			<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse_${list.pid }" aria-expanded="false" aria-controls="collapse_${list.pid }">
				${status.count }. ${list.title }
			</button>
		</p>
		<div class="collapse" id="collapse_${list.pid }">
			<div class="card card-body">
				<img alt="" src="${list.thumbnail }" style="max-width: 100%">
				${list.content } 
		    	<button class="btn btn-primary" type="button" onclick="content_delete('${list.pid}')">삭제</button>
			</div>
		</div>
	</c:forEach>


	</div>
</div>

        <!-- Begin Page Content -->
<!--         <div class="container-fluid"> -->

<!--           Page Heading -->
<!--           <form name="fileForm" action="/AdminImgUploadProc.do" method="post" enctype="multipart/form-data"> -->
<!--           	<input multiple="multiple" type="file" name="file" /> -->
<!--           	<input type="text" name="title"/> -->
<!--         	<input type="text" name="contents" /> -->
<!--         	<input type="submit" value="전송" /> -->
<!--     	  </form> -->
<!--         </div> -->
        <!-- /.container-fluid -->

<!-- </div> -->
<!-- End of Main Content -->
      
<jsp:include page="/WEB-INF/views/admin/inc/AdminFooter.jsp"/>