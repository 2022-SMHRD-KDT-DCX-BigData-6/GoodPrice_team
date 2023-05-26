package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class tb_memberDTO {

    private String m_id;
    private String m_pw;
    private String m_name;
    private String m_nick;
    private Date m_birthdate;
    private String m_gender;
    private String m_addr;
    private Double m_point;
    private Date m_joindate;
    private String admin_yn;
}