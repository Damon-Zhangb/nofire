package com.example.controller;


import com.example.mapper.auto.IfpMapper;
import com.example.model.auto.Ifp;
import com.example.service.IIfpService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author astupidcoder
 * @since 2020-12-28
 */
@RestController
@RequestMapping("ifp/")
public class IfpController {

    @Autowired
    IIfpService ifpService;

    @GetMapping("/getList")
    public List<Ifp> getinfo(){
        return ifpService.list();
    }

    @PostMapping("/mbpost")
    public String mbPost(@RequestBody Ifp ifp){
        ifpService.save(ifp);
        return "success";
    }

    @GetMapping("/update")
    public String updata(@Param("id") Integer id){
        Ifp ifp  = new Ifp();
        ifp.setDeviceId(id);
        ifp.setIdentification("y");
        ifpService.updateById(ifp);
        return "success";
    }
}
