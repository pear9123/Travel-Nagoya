<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/WEB-INF/views/admin/inc/AdminHeader.jsp"/>
<!-- Begin Page Content -->
<div class="container-fluid">

	<form action="/AdminImgUploadProc.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
		<label for="exampleFormControlFile1">여러 파일 업로드</label>
		<input multiple="multiple" type="file" name="file" class="form-control-file" id="exampleFormControlFile1">
		</div>
		<div class="form-group" >
		<label for="exampleFormControlInput1">간편 제목입력</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목" name="title">
		</div>
		<div class="form-group">
		<label for="exampleFormControlTextarea1">간편 내용입력</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="contents"></textarea>
		</div>
	  	<button type="submit" class="btn btn-primary mb-2">Submit</button>
	</form>



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