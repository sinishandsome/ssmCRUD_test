package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employ;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenxin
 * @create 2021-09-21 13:10
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployService employService;

    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids") String ids) {
        if (ids.contains("-")) {
            //批量删除
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String string : str_ids) {
                int i = Integer.parseInt(string);
                del_ids.add(i);
            }
            employService.deleteBatch(del_ids);
            return Msg.success();
        } else {
            //单个删除
            Integer id = Integer.parseInt(ids);
            employService.deleteEmp(id);
            return Msg.success();
        }

    }


    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employ employ) {
        employService.updateEmp(employ);
        return Msg.success();
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employ employee = employService.getEmp(id);
        return Msg.success().add("emp", employee);
    }


    @RequestMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(String empName) {
        //后端用户名格式校验
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
        if (!empName.matches(regx)) {
            return Msg.fail().add("va_msg", "用户名应为2-5位中文或6-16位英文和数字组合");
        }
        boolean b = employService.checkUser(empName);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }

    //JSON方法
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Employ> emps = employService.getAll();
        PageInfo page = new PageInfo(emps, 5);
        return Msg.success().add("pageinfo",page);
    }

    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employ employ, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employService.saveEmp(employ);
            return Msg.success();
        }
    }

//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
//        PageHelper.startPage(pn, 5);
//        List<Employ> emps = employService.getAll();
//        PageInfo page = new PageInfo(emps, 5);
//        model.addAttribute("pageinfo", page);
//        return "list";
//    }

}
