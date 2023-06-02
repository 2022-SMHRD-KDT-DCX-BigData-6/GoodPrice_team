package com.smhrd.model;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class tb_memberDTO {

	@NonNull private String m_id;
    private String m_pw;
    private String m_name;
    private String m_nick;
    private String m_age;
    private String m_gender;
    private String m_addr;
    private Double m_point;
    private Date m_joindate;
    private String admin_yn;
	
    public tb_memberDTO(String m_pw, String m_name) {
		super();
		this.m_pw = m_pw;
		this.m_name = m_name;
	}

	public tb_memberDTO(@NonNull String m_id, String m_pw, String m_name, String m_nick, String m_addr) {
		super();
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_nick = m_nick;
		this.m_addr = m_addr;
		this.m_id = m_id;
	}
    
    

    
	
	
}