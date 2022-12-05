package com.Spring_movie01.testWebSocket;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

public class TestWebSocket extends TextWebSocketHandler {
	
	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// WebSocketSession session : 접속을 하면 브라우저에 있는 session의 데이터를 가져온 것. 
		// 다만, 접속 할때 마다 session값은 계속 바뀐다.
		// Socket에 들어가면 실행된다는 의미는 없지만, 자동으로 실행이 되도록 WebSocket에서 만들었기 때문에 메소드의 이름을 임의적으로 바꾸는 것은 불가능 하다.
		// 이미 정해져 있는 메소드를 가져다가 사용하여 작동을 한다는 원리.
		
		
		
		System.out.println("afterConnectionEstablished() 호출");
		// 접속
		System.out.println("session.getId() : "+session.getId());
		// 접속할 때 마다 getId가 생성되서 브라우저에 있는 session의 데이터를 가져오는 원리.
		// 다만 접속할 때 마다 getId는 임의적으로 생성되기 때문에 session의 데이터는 달라진다.
		
		sessionList.add(session);
		// 접속학 때 마다 getId가 생성되면 sessionList에 저장하여 1번, 2번식으로 차곡차곡 저장해서 분류한다. 		
		System.out.println("sessionList.size() : "+sessionList.size());
	}

	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		System.out.println("session.getId() : "+session.getId());
		sessionList.remove(session); // 페이지를 나가기전까지 session 계속 유지가 된다.	
		System.out.println("sessionList.size() : "+sessionList.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage() 호출");
		System.out.println("session.getId() : "+session.getId());
		System.out.println("message.getPayload() : "+message.getPayload()); 
		// message.getPayload() : message를 String타입으로 return해준다.
		
		Gson gson = new Gson();
		TestMsgDto testMsg = gson.fromJson(message.getPayload(), TestMsgDto.class);
		System.out.println(testMsg);
		// 여기서 service, dao 등을 호출하여 채팅 내역을 db에 저장할 수 있다.
		// 만약 이를 DB에 저장한다면
		// testDao.insert(testMsg);
		// >> INSERT .....
		
		// HttpSession과 WebSocketSession은 같은 Session을 쓰지만, 사용하는 방법이 다르다.
		session.getAttributes(); 
		// map객체를 반환 : key - value값을 같는 객체
		
		for(int i = 0; i < sessionList.size(); i++) {
			if(!sessionList.get(i).getId().equals(session.getId())){ 
				// 보낼 메세지의 아이디가 같지 않을 경우만 if문이 진행된다.
				
				
				Map<String, Object> sessionMap = sessionList.get(i).getAttributes();
				String LoginMid = (String)sessionMap.get("LoginMid");
				System.out.println("LoginMid : "+LoginMid);
				if(LoginMid != null) {
				sessionList.get(i).sendMessage(new TextMessage( message.getPayload() ) );
				// 다음 session에 메세지를 보낸다.(새로운 TextMessage객체(전송받은 메세지를 담아서 보낸다))
				}
				
			}
			
		}
		
		
	}
}