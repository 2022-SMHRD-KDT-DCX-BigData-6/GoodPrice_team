package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class tb_commentDTO {
    private int cmt_idx;
    @NonNull private int b_idx;
    @NonNull private String cmt_content;
    private Date cmt_dt;
    @NonNull private String m_id;
}
