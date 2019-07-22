//package com.solrecipe.recipe.user.api;
//
//import java.io.IOException;
//import java.io.UnsupportedEncodingException;
//import java.util.*;
//
//import org.apache.http.HttpResponse;
//import org.apache.http.client.ClientProtocolException;
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.entity.UrlEncodedFormEntity;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.impl.client.HttpClientBuilder;
//import org.apache.http.message.BasicNameValuePair;
//import org.omg.CORBA.NameValuePair;
//
//import com.fasterxml.jackson.databind.JsonNode;
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//public class Kakao_restapi {
//	public JsonNode getAccessToken(String autorize_code) {
//        
//        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
// 
//        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
//        
//        //포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
//        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
// 
//        postParams.add(new BasicNameValuePair("client_id", "자신의 RESTAPI 코드"));
// 
//        postParams.add(new BasicNameValuePair("redirect_uri", "리다이렉션주소")); //예 : http://아이피:포트/최상위폴더/리다이렉션경로
// 
//        postParams.add(new BasicNameValuePair("code", autorize_code));
//        //기타 설명은 생략 자세히 알고 싶으면 구글링하세요.
//        final HttpClient client = HttpClientBuilder.create().build();
// 
//        final HttpPost post = new HttpPost(RequestUrl);
// 
//        JsonNode returnNode = null;
// 
//        try {
// 
//            post.setEntity(new UrlEncodedFormEntity(postParams));
// 
//            final HttpResponse response = client.execute(post);
// 
//            ObjectMapper mapper = new ObjectMapper();
// 
//            returnNode = mapper.readTree(response.getEntity().getContent());
// 
//        } catch (UnsupportedEncodingException e) {
// 
//            e.printStackTrace();
// 
//        } catch (ClientProtocolException e) {
// 
//            e.printStackTrace();
// 
//        } catch (IOException e) {
// 
//            e.printStackTrace();
// 
//        } finally {
// 
//        }
// 
//        return returnNode;
// 
//    }
//	
//	
//	public JsonNode Logout(String autorize_code) {
//        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
// 
//        final HttpClient client = HttpClientBuilder.create().build();
// 
//        final HttpPost post = new HttpPost(RequestUrl);
// 
//        post.addHeader("Authorization", "Bearer " + autorize_code);
// 
//        JsonNode returnNode = null;
// 
//        try {
// 
//            final HttpResponse response = client.execute(post);
// 
//            ObjectMapper mapper = new ObjectMapper();
// 
//            returnNode = mapper.readTree(response.getEntity().getContent());
// 
//        } catch (UnsupportedEncodingException e) {
// 
//            e.printStackTrace();
// 
//        } catch (ClientProtocolException e) {
// 
//            e.printStackTrace();
// 
//        } catch (IOException e) {
// 
//            e.printStackTrace();
// 
//        } finally {
// 
//        }
// 
//        return returnNode;
// 
//    }
//
//
//
//}
