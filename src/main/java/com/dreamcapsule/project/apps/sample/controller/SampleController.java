package com.dreamcapsule.project.apps.sample.controller;

import com.dreamcapsule.project.apps.sample.service.SampleService;
import com.dreamcapsule.project.domain.SampleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class SampleController {

    @Autowired
    private SampleService sampleService;

    @RequestMapping("/sample")
    public String test(Model model){
        List<SampleVO> result = sampleService.findAll();

        model.addAttribute("result",result);

        return "sample/board";
    }

    @RequestMapping("/sample2")
    public String test2(){

        return "sample/board";
    }


}
