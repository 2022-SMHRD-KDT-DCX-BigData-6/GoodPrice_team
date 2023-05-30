package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class tb_boardDTO {
	
	private Double b_idx;
    @NonNull private String b_title;
    @NonNull private String b_content;
    @NonNull private String b_file;
    @NonNull private String m_id;
    private Date b_dt;
    private Double b_views;
    private Double b_likes;
}
