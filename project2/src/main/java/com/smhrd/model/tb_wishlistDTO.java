package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class tb_wishlistDTO {

    private Double wish_idx;
    @NonNull private Double store_idx;
    private Date wish_dt;
    @NonNull private String m_id;
}
