package com.user.moim.controller;

import java.io.File;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sourceforge.tess4j.*;

@Controller
public class MoimController {

	@RequestMapping("/MoimMain.do")
	public String MoimMain(String filename) {
		 File imageFile = new File("D:\\STS\\test\\test.jpg");
	        ITesseract instance = new Tesseract();  // JNA Interface Mapping
	        // ITesseract instance = new Tesseract1(); // JNA Direct Mapping
	        instance.setDatapath("D:\\Tesseract-OCR"); // path to tessdata directory

	        try {
	            String result = instance.doOCR(imageFile);
	            System.out.println(result);
	        } catch (TesseractException e) {
	            System.err.println(e.getMessage());
	        }
		
		return "moim/main";
	}
	
}
