package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class tb_boardDTO {
	
	private Double b_idx;
    private String b_title;
    private String b_content;
    private String b_file;
    private Date b_dt;
    private String m_id;
    private Double b_views;
    private Double b_likes;
}
