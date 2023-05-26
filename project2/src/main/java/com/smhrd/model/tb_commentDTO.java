package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class tb_commentDTO {

	private Double cmt_idx;
	private Double b_idx;
	private String cmt_content;
	private Date cmt_dt;
	private String m_id;
}
