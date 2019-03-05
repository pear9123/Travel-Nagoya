<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/WEB-INF/views/admin/inc/AdminHeader.jsp"/>



        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <form name="fileForm" action="/AdminImgUploadProc.do" method="post" enctype="multipart/form-data">
          	<input multiple="multiple" type="file" name="file" />
          	<input type="text" name="title"/>
        	<input type="text" name="contents" />
        	<input type="submit" value="전송" />
    	  </form>
        </div>
        <!-- /.container-fluid -->

      </div>
<!-- End of Main Content -->
      
<jsp:include page="/WEB-INF/views/admin/inc/AdminFooter.jsp"/>