package com.solrecipe.recipe.mypage;

import java.sql.Date;

import lombok.Data;

@Data
public class MyVideoVO {
	private int video_num;
	private String video_id;
	private String video_title;
	// markvideo_tb의 firstdate 변수이다.
	private Date firstdate;
}
