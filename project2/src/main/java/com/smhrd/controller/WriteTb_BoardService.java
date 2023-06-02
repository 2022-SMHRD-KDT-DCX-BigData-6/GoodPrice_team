package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.Command;
import com.smhrd.model.tb_boardDAO;
import com.smhrd.model.tb_boardDTO;

public class WriteTb_BoardService implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
    	
        // 파일 업로드 -> MultipartRequest -> cos.jar
        // 1. 모든 요청정보가 담겨있는 request객체
        // 2. 업로드 된 파일(이미지)을 저장할 경로
        String path = request.getServletContext().getRealPath("./img_file");
        System.out.println("저장경로 : " + path);
        
        // 3. 파일의 max size
        int maxSize = 1024 * 1024 * 10; // 10MB
        
        // 4. 인코딩 방식
        String encoding = "UTF-8";
        
        // 5. 중복제거 -> 파일명 뒤에 숫자를 붙여주는 객체
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
        
        MultipartRequest multi;
        int cnt = 0;
        try {
            multi = new MultipartRequest(request, path, maxSize, encoding, rename);
            
            // DB에 저장하기 위해서 게시글 정보 가져오기
            String b_title = multi.getParameter("b_title");
            String m_id = multi.getParameter("m_id");
            String b_file = multi.getFilesystemName("b_file");
            String b_content = multi.getParameter("b_content");

            
            System.out.println("title : " + b_title);
            System.out.println("writer : " + m_id);
            System.out.println("filename : " + b_file);
            System.out.println("content : " + b_content);
            
            tb_boardDTO dto = new tb_boardDTO(b_title, b_content, b_file, m_id);
            cnt = new tb_boardDAO().tb_boardUpload(dto);

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        if (cnt > 0) {
            System.out.println("업로드 성공");
        } else {
            System.out.println("업로드 실패");
        }
        
        return "Board_List_check.jsp";
    }

}