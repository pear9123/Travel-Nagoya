package com.user.travel.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

// 네이버 기계번역 (Papago SMT) API 예제
public class KakaoRestApiHelper {

	public List<Map<String,Object>> KakaoRestAPI(String isend) {
        String clientSecret = "8c4491d6abb54faa9a4448b3744a254c";//REST API 키
        String decode_result = "";
        try {
        	String text = URLEncoder.encode(isend,"UTF-8");
            String apiURL = "https://dapi.kakao.com/v2/local/search/address.json?query="+text;
            System.out.println("APIURL : "+ apiURL);
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", "KakaoAK "+clientSecret);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "euc-kr"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "euc-kr"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
                System.out.println("readLine : "+br.readLine());
            }
            br.close();
            System.out.println(response.toString());
            String result = response.toString();
            decode_result = new String(result.getBytes("UTF-8"),"UTF-8");
        } catch (Exception e) {
            System.out.println(e);
        }
        
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        HashMap<String, String> map = new HashMap<String, String>();
        JSONParser parser = new JSONParser();
        JSONObject univ;
		try {
			univ = (JSONObject)parser.parse(decode_result);
			JSONArray arr = (JSONArray)univ.get("documents");
			data = utils.getListMapFromJsonArray(arr);
            System.out.println("==data=="+data);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        return data;
    }
	
	public List<Map<String,Object>> KakaoRestAPI_Keyword(Map<String, Object> map) {
        String clientSecret = "8c4491d6abb54faa9a4448b3744a254c";//REST API 키
        String decode_result = "";
        String result = "";
        try {
        	String x_position = URLEncoder.encode((String)map.get("x_position"),"UTF-8");
        	String y_position = URLEncoder.encode((String)map.get("y_position"),"UTF-8");
        	String radius = URLEncoder.encode((String)map.get("radius"),"UTF-8");
        	String query = URLEncoder.encode((String)map.get("query"),"UTF-8");
//        	String x_position = (String)map.get("x_position");
//        	String y_position = (String)map.get("y_position");
//        	String radius = (String)map.get("radius");
//        	String query = (String)map.get("query");
        	
            String apiURL = "https://dapi.kakao.com/v2/local/search/keyword.json?query="+query+"&x="+x_position+"&y="+y_position+"&redius="+radius;
            System.out.println("APIURL : "+ apiURL);
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", "KakaoAK "+clientSecret);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
                System.out.println("readLine : "+br.readLine());
            }
            br.close();
            System.out.println(response.toString());
            result = response.toString();
//            decode_result = new String(result.getBytes("UTF-8"),"UTF-8");
        } catch (Exception e) {
            System.out.println(e);
        }
        
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        JSONParser parser = new JSONParser();
        JSONObject univ;
		try {
			univ = (JSONObject)parser.parse(result);
			JSONArray arr = (JSONArray)univ.get("documents");
			data = utils.getListMapFromJsonArray(arr);
            System.out.println("==data=="+data);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        return data;
    }
}