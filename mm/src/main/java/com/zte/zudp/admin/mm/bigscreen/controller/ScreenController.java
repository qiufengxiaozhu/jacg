package com.zte.zudp.admin.mm.bigscreen.controller;

import com.zte.zudp.admin.mm.bigscreen.service.ScreenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * 吉安大屏控制器层
 * @Description ${}
 * @Author ScreenController
 * @Date 2019/12/24 15:13
 **/

@Controller
@RequestMapping(value = "/mm/screen")
public class ScreenController {

    @Autowired
    private ScreenService screenService;
}
