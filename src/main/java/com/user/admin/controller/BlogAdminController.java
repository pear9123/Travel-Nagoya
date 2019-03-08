package com.user.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.user.admin.service.BlogAdminService;

@Controller
public class BlogAdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogAdminController.class);
	// 의존 주입
	@Autowired
	private BlogAdminService BLOGADMINSERVICE;
	
	

	@RequestMapping("/AdminBlog.do")
	public String BlogAdminMain() {
		return "admin/AdminBlog";
	}
	
	@RequestMapping("/AdminImgUpload.do")
	public String AdminImgUpload() {
		return "admin/AdminImageUpload";
	}
	
	@RequestMapping("/AdminImgUploadProc.do")
	public String AdminImgUploadProc(MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String title = mtfRequest.getParameter("title");
        String contents = mtfRequest.getParameter("contents");
        long CurrentTime_temp = System.currentTimeMillis(); // Name 동기화
        String CurrentTime = String.valueOf(CurrentTime_temp);
        
        // CONFIG PATH
        String path = BLOGADMINSERVICE.configimgpath();
        
        // BLOG CONTENT INSERT
        Map<String, String> ContentMap = new HashMap();
        String thumbnail = path +""+CurrentTime+""+ fileList.get(0).getOriginalFilename();
        ContentMap.put("title", title);
        ContentMap.put("contents", contents);
        ContentMap.put("thumbnail", thumbnail);
        BLOGADMINSERVICE.contentinsert(ContentMap);
        
        
        logger.debug("---------------file upload start---------------");
        logger.debug("title : "+ContentMap.get("title"));
        logger.debug("content : "+ContentMap.get("contents"));
        

        for (MultipartFile mf : fileList) {
        	Map<String, String> map = new HashMap();
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            String fileSize = String.valueOf(mf.getSize()); // 파일 사이즈
           
            
            String dbsavefile = CurrentTime +""+ originFileName;
//            String safeFile = path + System.currentTimeMillis() + originFileName;
//            String safeFile1 = session.getServletContext().getRealPath("/");
            String safeFile = "D:\\STS\\contents\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Nagoya\\resources\\file\\"+dbsavefile;
            System.out.println("safeFile : "+safeFile);
            
            map.put("path",path);
            map.put("filename", dbsavefile);
            map.put("filesize", fileSize);
            logger.debug("filename : "+map.get("filename"));
            logger.debug("filesize : "+map.get("filesize"));

            BLOGADMINSERVICE.InsertImage(map);

           
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        logger.debug("---------------file upload end---------------");

        return "redirect:/AdminImgUpload.do";
    }
}
