package com.smhrd.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	
	// Interface : 틀 ex)이력서
	// 추상메서드 : body는 없지만 메서드의 기본값을 설정해주는 역할 ex)증명사진, 이름, 나이...
	public String execute(HttpServletRequest request, HttpServletResponse response);

}
