package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class tb_pointDTO {
	
	private Double point_idx;
    private String m_id;
    private Double review_point;
    private String point_memo;
    private Date point_dt;
}
