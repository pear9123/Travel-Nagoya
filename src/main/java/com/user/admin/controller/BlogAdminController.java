package com.user.admin.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.user.admin.service.BlogAdminService;
import com.user.blog.service.BlogService;

@Controller
public class BlogAdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlogAdminController.class);
	// 의존 주입
	@Autowired
	private BlogAdminService BLOGADMINSERVICE;
	@Autowired
	private BlogService BLOGSERVICE;
	

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
            // 로컬 주소
//          String safeFile = "D:\\STS\\contents\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Nagoya\\resources\\file\\"+dbsavefile;
            // 서버 주소
            String safeFile = "/pear9123/tomcat/webapps/ROOT/resources/file/"+dbsavefile;
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
	
	// AdminNotice view 
	@RequestMapping("/AdminNotice.do")
	public String AdminNotice(Model model) throws Exception{
		List<Map<String, Object>> list = BLOGADMINSERVICE.selectnotice();
		model.addAttribute("list", list);
		return "admin/AdminNotice";
	}
	
	// AdminNotice view Proc
	@RequestMapping("/AdminNoticeProc.do")
	public String AdminNoticeProc(HttpServletRequest request, Principal principal) throws Exception {
		String notice = request.getParameter("notice");
		String writer = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice", notice);
		map.put("writer", writer);
		
		BLOGADMINSERVICE.insertnotice(map);
		
		return "admin/AdminBlog";
	}
	
	// AdminNoticeDelete
	@RequestMapping("/AdminNoticeDelete.do")
	public String AdminNoticeDelete(HttpServletRequest request) throws Exception{
		String uid = request.getParameter("delete_uid");
		BLOGADMINSERVICE.deletenotice(uid);
		return "redirect:/AdminNotice.do";
	}
	
	// AdminContentList
	@RequestMapping("/AdminContentList.do")
	public String AdminContentList(Model model) throws Exception{
		// BLOG CONTENTS LIST
		List<Map<String, Object>> Listmap = BLOGSERVICE.selectbloglist();
		model.addAttribute("list", Listmap);
		return "admin/AdminContentList";
	}
	
	// AdminConteDelete
	@RequestMapping("/AdminContentDelete.do")
	public String AdminContentDelete(HttpServletRequest request) throws Exception {
		String pid = request.getParameter("delete_pid");
		BLOGADMINSERVICE.deletecontent(pid);
		return "redirect:/AdminContentList.do";
	}
}
