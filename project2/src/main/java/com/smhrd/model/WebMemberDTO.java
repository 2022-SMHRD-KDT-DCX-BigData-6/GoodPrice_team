package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class WebMemberDTO {
	@NonNull private String email;
	@NonNull private String pw;
	private String tel;
	private String address;
	
	public WebMemberDTO(String email) {
		this.email = email;
	}
}
