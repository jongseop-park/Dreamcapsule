package com.dreamcapsule.project.apps.error.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    private static final String PATH = "/error";

    private static final String VIEW_PATH = "error/";

    private static final Logger log = LoggerFactory.getLogger(CustomErrorController.class);

@RequestMapping("/error")
public String handleError(HttpServletRequest request, Model model) {
    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
    HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
    int statusCode = Integer.valueOf(Integer.valueOf(status.toString()));
    log.info("HttpStatus : " + httpStatus.toString());

    if(status != null){

        if(statusCode == HttpStatus.NOT_FOUND.value()){
            return VIEW_PATH + "404";
        }
        if(statusCode == HttpStatus.FORBIDDEN.value()){
            return "error/403";
        }
        if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()){
            return "error/500";
        }

    }

    return "error/404";
}
    @Override
    public String getErrorPath(){
        return PATH;
    }
}
