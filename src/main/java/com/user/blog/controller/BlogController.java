package com.user.blog.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.user.admin.service.BlogAdminService;
import com.user.blog.service.BlogService;


@Controller
public class BlogController {
	
	@Autowired
	private BlogService BLOGSERVICE;
	@Autowired
	private BlogAdminService BLOGADMINSERVICE;
	
	/* BLOG LIST MAIN */
	@RequestMapping(value = "/BlogMain.do")
	public String BlogMain(Model model, Principal principal, HttpServletRequest request) throws Exception {
		System.out.println("=============== BLOG LIST MAIN ===============");
		
		// SECURITY INFO
		String username = principal.getName();
		System.out.println("USERNAME : "+username);
		// SELECT MEMBER INFO
		Map<String, Object> map =  BLOGSERVICE.selectmember(username);
		// SELECT MODEL
		model.addAttribute("map", map);
		System.out.println("IMG : "+map.get("IMG"));
		// SELECT NOTICE
		List<Map<String, Object>> notice = BLOGSERVICE.selectnotice();
		System.out.println("NOTICE 1번 : "+notice.get(0).get("notice"));
		model.addAttribute("notice", notice);
		
		// BLOG CONTENTS LIST
		List<Map<String, Object>> Listmap = BLOGSERVICE.selectbloglist();
		model.addAttribute("list", Listmap);
		
		// BLOG SEARCH
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			int searchpid = (Integer)flashMap.get("searchpid");
			model.addAttribute("search_pid", searchpid);
		} else {
			model.addAttribute("search_pid", "nodate");
		}
		
		return "blog/main";
	}
	
	/* BLOG DETAIL */
	@RequestMapping(value = "/BlogDetail.do")
	public String BlogDetail(Model model, HttpServletRequest request, Principal principal) throws Exception {
		System.out.println("=============== BLOG DETAIL ===============");
		String pid = request.getParameter("pid");
		
		// UPDATE COUNT
		BLOGSERVICE.updatecount(pid);
		
		// SELECT IMAGES
		List<Map<String, Object>> list = BLOGSERVICE.selectblogimages(pid);
		model.addAttribute("list", list);
		
		// SELECT INFO
		Map<String, Object> map = BLOGSERVICE.selectbloginfo(pid);
		model.addAttribute("map", map);
		
		// SELECT USER INFO
		String username = principal.getName();
		Map<String, Object> usermap = BLOGSERVICE.selectmember(username);
		model.addAttribute("usermap", usermap);
		
		// SELECT REPLY COUNT
		String count = BLOGSERVICE.selectreplycount(pid);
		model.addAttribute("count", count);
		
		return "blog/detail";
	}
	
	/* BLOG REPLY VIEW */
	@RequestMapping("/BlogReply.do")
	public String BlogReply(HttpServletRequest request, Model model) throws Exception {
		
		String uid = request.getParameter("uid");
		model.addAttribute("uid", uid);
		
		List<Map<String, Object>> listmap = BLOGSERVICE.selectreply(uid);
		model.addAttribute("listmap", listmap);
		
		return "blog/reply";
	}
	
	/* BLOG REPLY PROC */
	@RequestMapping("/BlogReplyProc.do")
	public String BlogReplyProc(HttpServletRequest request, Principal principal) throws Exception {
		String reply = request.getParameter("reply");
//		int uid = Integer.parseInt(request.getParameter("uid"));
		String uid = request.getParameter("uid");
		String name = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply", reply);
		map.put("uid", uid);
		map.put("name", name);
		
		// INSERT REPLY
		BLOGSERVICE.insertreply(map);
		
		return "redirect:/BlogReply.do";
	}
	
	/* BLOG MAIN IMAGE UPDATE */
	@RequestMapping("/BlogMainImageUpdate.do")
	public String BlogMainImageUpdate(MultipartHttpServletRequest mtfRequest, HttpSession session, HttpServletRequest request ) throws Exception {
		
		MultipartFile fileList = mtfRequest.getFile("file");
		String email = request.getParameter("EMAIL");
        long CurrentTime_temp = System.currentTimeMillis(); // Name 동기화
        String CurrentTime = String.valueOf(CurrentTime_temp);
        
        // CONFIG PATH
        String path = BLOGADMINSERVICE.configimgpath();
        
        // BLOG CONTENT INSERT
        Map<String, Object> ContentMap = new HashMap();
        String IMG = path +""+CurrentTime+""+ fileList.getOriginalFilename();
        ContentMap.put("EMAIL", email);
        ContentMap.put("IMG", IMG);
        BLOGSERVICE.updatemainimage(ContentMap);
        

        String originFileName = fileList.getOriginalFilename(); // 원본 파일 명
        String fileSize = String.valueOf(fileList.getSize()); // 파일 사이즈
        String dbsavefile = CurrentTime +""+ originFileName;
        
        // 로컬주소
//        String safeFile = "D:\\STS\\contents\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Nagoya\\resources\\file\\"+dbsavefile;
        // 서버주소
        String safeFile = "/pear9123/tomcat/webapps/ROOT/resources/file/"+dbsavefile;
        System.out.println("safeFile : "+safeFile);
            
	        try {
	        	fileList.transferTo(new File(safeFile));
	        } catch (IllegalStateException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
        
        
		return "redirect:/BlogMain.do";
	}
	
	/* BLOG CONTENT SEARCH */
	@RequestMapping("/BlogContentSearch.do")
	public String BlogContentSearch(HttpServletRequest request, RedirectAttributes redirect) throws Exception{
		String title = request.getParameter("title");
		Map<String, Object> map = new HashMap<String, Object>();
		map = BLOGSERVICE.blogcontentsearch(title);
		int pid = (Integer)map.get("pid");
		redirect.addFlashAttribute("searchpid", pid);
		return "redirect:/BlogMain.do";
	}

}
