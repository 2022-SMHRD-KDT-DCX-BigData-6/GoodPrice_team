package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewListDTO {
	private String m_nick;
	private String review_content;
	private Double review_score;
	private String review_dt;
	
}
