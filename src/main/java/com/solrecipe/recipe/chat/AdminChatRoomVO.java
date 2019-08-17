package com.solrecipe.recipe.chat;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminChatRoomVO {
	
	int chatroom_num;
	int user_num;
	String chat_address;
	String chat_title;
	Date firstdate;
	String user_nickname;
	String type;//물물교환, 공동구매로 나뉜다
	
}

/*
 
select  a.chatroom_num,a.chat_address,a.user_num,a.chat_title,a.firstdate,b.user_nickname,type from
(
(select chatroom_num,chat_address,user_num,chat_title,chat_status,firstdate,type from change_tb z1 inner JOIN (select 0 as type from dual) z2 ON 1=1)
    UNION ALL
(select chatroom_num,chat_address,user_num,chat_title,chat_status,firstdate,type from with_tb y1 inner JOIN (select 1 as type from dual) y2 ON 1=1)
) a INNER JOIN USER_DETAIL_TB b ON a.user_num = b.user_num  where a.chat_status = 0 -- and REGEXP_LIKE(a.chat_address, '대구')  ==> 검색을 할 땐 이렇게 
order by a.firstdate desc ;
  
 */
 