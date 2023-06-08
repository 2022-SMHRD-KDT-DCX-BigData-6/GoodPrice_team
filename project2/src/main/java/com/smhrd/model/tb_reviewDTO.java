package com.smhrd.model;

import java.math.BigDecimal;
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
    

	public tb_reviewDTO(@NonNull Double review_service, @NonNull Double review_price, @NonNull Double review_clean) {
		super();
		this.review_service = review_service;
		this.review_price = review_price;
		this.review_clean = review_clean;
	}


	public tb_reviewDTO(Double review_idx, Date review_dt) {
		super();
		this.review_idx = review_idx;
		this.review_dt = review_dt;
	}

}
