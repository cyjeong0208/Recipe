package com.solrecipe.recipe.foodvideo;

import java.sql.Date;

/*
video_num number primary key,
video_id varchar2(200),
video_playlist varchar2(200),
video_title varchar2(300),
video_content CLOB,
video_thumbnail varchar2(200),
firstdate DATE,
video_mark_cnt number default 0
*/

import lombok.Data;

@Data
public class FoodVideoVO {
	private int video_num;
	private String video_id;
	private String video_playlist;
	private String video_title;
	private String video_content;
	private String video_thumbnail;
	private Date firstdate;
	private int video_mark_cnt;
}
