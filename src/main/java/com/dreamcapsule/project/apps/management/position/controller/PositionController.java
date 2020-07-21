package com.dreamcapsule.project.apps.management.position.controller;

import com.dreamcapsule.project.apps.management.position.service.PositionService;
import com.dreamcapsule.project.domain.PageMaker;
import com.dreamcapsule.project.domain.PositionVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.Position;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/management/position")
public class PositionController { // 직급 관리

    private static final Logger log = LoggerFactory.getLogger(PositionController.class);

    @Autowired
    public PositionService positionService;

    /**
     * 리스트 페이지
     * @param conn
     * @return
     * */
    @RequestMapping("/list")
    public String list(PositionVO conn, Model model){
        List<PositionVO> result = positionService.page(conn);
        model.addAttribute("result",result);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(conn);
        pageMaker.setTotalCount(positionService.listCnt());
        model.addAttribute("pageMaker", pageMaker);

        return "management/position/list";
    }

    /**
     * 상세 페이지
     * @param conn
     * @return
     * */
    @RequestMapping("/form")
    public String form(@ModelAttribute("conn") PositionVO conn,  Model model){

        if(StringUtils.isNotEmpty(conn.getSeq())){ // 수정
            model.addAttribute("result",positionService.findByDetail(conn));
            model.addAttribute("isUpdate",true);
        } else { // 저장
            model.addAttribute("isUpdate",false);
        }

        return "management/position/form";
    }


    /**
     * 저장, 수정
     * @param conn
     * @return
     * @ResponseBody 응답 : 서버 > 클라이언트로 응답 데이터를 전송하기 위해 사용하며 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송
     * @RequestBody 요청 : 자바 객체로 변환 시 HttpMessageConverter를 사용하여 헤더에 담긴 ContentType을 보고
     * 어떤 Message Converter를 사용할 지 판단 후 요청 본문에 담긴 값을 Java Object로 변환
     * */
    @RequestMapping("/save")
    @ResponseBody
    public PositionVO save(@RequestBody PositionVO conn){ /* @PathVariable("id") String id  > Mapping {id} 중괄호에 명시된 값을 변수로 받음*/

        // 시퀀스 존재에 따라 insert, update 처리
        if(StringUtils.isEmpty(conn.getSeq())){
            positionService.insert(conn);
        }
        else {
            positionService.update(conn);
        }
        return conn;
    }

    /**
     * 삭제 DEL_YN > Y
     * @param conn
     * */
    @RequestMapping("/delete")
    @ResponseBody
    public PositionVO delete(@RequestBody PositionVO conn){

        positionService.delUpdate(conn);
        return conn;
    }


}
