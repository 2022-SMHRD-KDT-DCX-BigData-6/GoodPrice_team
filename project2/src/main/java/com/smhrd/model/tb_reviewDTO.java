package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class tb_reviewDTO {

	private Double review_idx;
    @NonNull private Double store_idx;
    @NonNull private String m_id;
    @NonNull private Double review_service;
    @NonNull private Double review_price;
    @NonNull private Double review_clean;
    @NonNull private String review_content;
    @NonNull private String review_file;
    private Date review_dt;

    public tb_reviewDTO(@NonNull Double store_idx) {
    	super();
    	this.store_idx = store_idx;
    }

}
