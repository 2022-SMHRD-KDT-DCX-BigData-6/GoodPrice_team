package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class tb_storeDTO {
    private Double shop_idx;
    private String shop_name;
    private String shop_addr;
    private String shop_tel;
    private String shop_business;
    private String shop_items;
    private String shop_delivery;
    private String shop_img;
    private String shop_parking;
    @NonNull private Double lat;
    @NonNull private Double lng;
}
