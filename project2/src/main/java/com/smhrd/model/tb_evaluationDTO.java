package com.smhrd.model;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class tb_evaluationDTO {
	
	private Double ev_idx;
    private Double store_idx;
    private Double ev_tastee;
    private Double ev_service;
    private Double ev_price;
    private Double ev_clean;
    private String m_id;
}
