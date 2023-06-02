package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor

public class tb_boardDTO {
	private int b_idx;
	@NonNull private String b_title;
	@NonNull private String b_content;
	@NonNull private String b_file;
	private Date b_dt;
	@NonNull private String m_id;
	private int b_views;
	private int b_likes;
	public tb_boardDTO(int b_idx, @NonNull String b_title, @NonNull String b_content, @NonNull String b_file,
			@NonNull String m_id) {
		super();
		this.b_idx = b_idx;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_file = b_file;
		this.m_id = m_id;
	}
}