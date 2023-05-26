package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class tb_reviewDTO {

    private Double review_idx;
    private Double store_idx;
    private String review_content;
    private String review_file;
    private Double review_rating;
    private Date review_dt;
    private String m_id;
}
