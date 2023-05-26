package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class tb_wishlistDTO {

    private Double wish_idx;
    private Double store_idx;
    private Date wish_dt;
    private String m_id;
}
