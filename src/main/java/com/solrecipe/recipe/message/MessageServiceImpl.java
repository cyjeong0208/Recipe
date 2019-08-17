package com.solrecipe.recipe.message;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageMapper messageMapper;

	@Override
	public List<MessageVO> getList(int user_num, int page) {
		int startNum = ((page-1)*10+1);
		int endNum = page*10;
		ArrayList<MessageVO> list = (ArrayList<MessageVO>)messageMapper.getList(user_num, startNum, endNum);
		for(int i=0; i<list.size(); i++) {
			MessageVO vo = list.get(i);
			// 작게 띄워줄 내용(제목대신)
			String content;
			if(vo.getIsRecvSend()==1) {
				if(vo.getRecv_content().length()>10) {
					content = vo.getRecv_content().substring(0, 10) + ".....";
				}else {
					content = vo.getRecv_content();
				}
			}else {
				if(vo.getSend_content().length()>10) {
					content = vo.getSend_content().substring(0, 10) + ".....";
				}else {
					content = vo.getSend_content();
				}
			}
			vo.setIndex_content(content);
			
			int uNum = list.get(i).getSender_num();
			vo.setSender_nickname(messageMapper.getNickname(uNum));
			uNum = vo.getRecver_num();
			vo.setRecver_nickname(messageMapper.getNickname(uNum));
		}
		
		return list;
	}

	@Override
	public int sendMsg(MessageVO vo) {
		return messageMapper.sendMsg(vo);
	}

	@Override
	public MessageVO getDetailMsg(int message_num) {
		return messageMapper.getDetailMsg(message_num);
	}
	
	@Override
	public int answerMsg(MessageVO vo) {
		return messageMapper.answerMsg(vo);
	}
}
