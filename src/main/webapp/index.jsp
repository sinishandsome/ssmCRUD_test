<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2021-09-21
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());

    %>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>
<%--员工新增的模态框--%>
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--员工修改模态框--%>
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_update_input"
                                       placeholder="email@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M"
                                           checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_update_select"></select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!--搭建显示页面 -->
<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--        按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--        表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--        分页信息--%>
    <div class="row">
        <%--            分页文字信息--%>
        <div class="col-md-6" id="page_info_area"></div>
        <%--            分页条--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">

    //总记录数
    var totalRecord,currentPage;

    $(function (){
        toPage(1);
    });

    //查询列表的通用ajax方法
    function toPage(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success:function(result){
                //解析并显示员工信息
                build_emps_table(result);
                //解析并显示分页信息
                build_page_info(result);
                //解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //解析员工表格
    function build_emps_table(result){
        //清空table表格
        $("#emps_table tbody").empty();
        var emps = result.extend.pageinfo.list;
        $.each(emps,function (index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义属性，用来表示当前员工id，方便点击按钮时的查询
            editBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性表示当前删除的员工id
            delBtn.attr("del-id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");

        });
    }



    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 " + result.extend.pageinfo.pageNum + " 页 , 总 " + result.extend.pageinfo.pages + " 页 , 总 " + result.extend.pageinfo.total + " 条记录");
        totalRecord = result.extend.pageinfo.total;
        currentPage = result.extend.pageinfo.pageNum;
    }

    //解析分页条
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!result.extend.pageinfo.hasPreviousPage) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            prePageLi.click(function () {
                toPage(result.extend.pageinfo.pageNum - 1);
            });
            firstPageLi.click(function () {
                toPage(1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (!result.extend.pageinfo.hasNextPage) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                toPage(result.extend.pageinfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                toPage(result.extend.pageinfo.pages);
            });

        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageinfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageinfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item);
            })
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击新增按钮弹出模态框
    $("#emp_add_model_btn").click(function () {
        //清除模态框表单内容（文字+样式）
        reset_form("#empAddModel form");
        //发送ajax请求，查出部门信息显示在下拉菜单中
        getDepts("#dept_add_select");
        //弹出模态框
        $("#empAddModel").modal();
    });
    //查出所有的部门信息并显示在下拉列表中
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                //显示部门信息在下拉列表中
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    $("#empName_input").change(function () {
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkEmpName",
            data: "empName=" + empName,
            type:"POST",
            success:function (result){
                if (result.code == 100) {
                    show_validate_msg("#empName_input", "success", "用户名可用！");
                    $("#emp_save_btn").attr("ajax-va", "success");
                } else {
                    show_validate_msg("#empName_input", "fail", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va", "fail");

                }
            }
        })

    });


    //为保存员工按钮绑定单击事件
    $("#emp_save_btn").click(function () {
        //先对要提交的数据进行校验
        if (!validate_add_form()) {
            return false;
        }
        //将模态框中填写的表单数据提交给服务器
        if ($(this).attr("ajax-va") == "fail") {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModel form").serialize(),
            success: function (result) {
                //alert(result.msg);
                //员工保存成功
                if (result.code == 100) {
                    //1.关闭模态框
                    $("#empAddModel").modal('hide');
                    //2.来到最后一些显示刚才的数据
                    toPage(totalRecord);
                } else {
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#email_input", "fail", "装啥啊，邮箱格式错误");
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#empName_input", "fail", "装啥啊，用户名应为2-5位中文或6-16位英文和数字组合");
                    }
                }

            }
        });
    });

    function validate_add_form() {
        //校验用户名
        var empName = $("#empName_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            // alert("用户名应为2-5位中文或6-16位英文和数字组合");
            show_validate_msg("#empName_input", "fail", "用户名应为2-5位中文或6-16位英文和数字组合");
            return false;
        } else {
            show_validate_msg("#empName_input", "success", "");
        }
        //校验邮箱
        var email = $("#email_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            // alert("邮箱格式不正确！");
            show_validate_msg("#email_input", "fail", "邮箱格式错误");
            return false;
        } else {
            show_validate_msg("#email_input", "success", "");
        }
        return true;
    }

    function show_validate_msg(ele, status, msg) {
        //首先清除当前元素校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);

        } else if ("fail" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //为每个员工的删除按钮绑定单击事件
    $(document).on("click", ".delete_btn", function () {
        //弹出确认对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        if (confirm("确认删除【 " + empName + " 】吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    toPage(currentPage);
                }
            })
        }
    });


        // 为每个员工的编辑按钮添加单击事件
    // 不能用click，因为页面加载时ajax请求还未生成编辑按钮
    $(document).on("click", ".edit_btn", function () {
        //查出部门信息并显示
        getDepts("#empUpdateModel select");
        //查出员工信息并显示
        getEmp($(this).attr("edit-id"));
        //把员工id传递给模态框更新按钮
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        //弹出模态框，查出部门信息并显示
        $("#empUpdateModel").modal();
    });

    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type:"GET",
            success: function (result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModel input[name=gender]").val([empData.gender]);
                $("#empUpdateModel select").val([empData.dId]);
            }
        });
    }

    $("#emp_update_btn").click(function () {
        //验证邮箱
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "fail", "邮箱格式错误");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }

        //发送ajax请求保存修改
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type: "POST",
            data: $("#empUpdateModel form").serialize() + "&_method=PUT",
            success: function (result) {
                $("#empUpdateModel").modal("hide");
                toPage(currentPage);
            }
        })
    });

    //全选/全不选功能
    $("#check_all").click(function () {
        //attr获取checked是未定义，
        //获取dom的原生属性使用prop，
        //attr用来获取自定义属性
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //每个check_item的单击事件
    $(document).on("click", ".check_item", function () {
        //判断当前页面是否为全选，若为全选，取消一个选择则全选按钮取消选择状态
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    //点击删除批量删除
    $("#emp_delete_all_btn").click(function () {
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            //组装员工姓名字符串
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id字符串，格式”X-X-X-X“
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去掉末尾逗号
        var empNames = empNames.substring(0, empNames.length - 1);
        //去掉末尾-号
        var del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        if (confirm("确认删除？【 " + empNames + " 】吗")) {
            //发送ajax请求删除
            $.ajax({
                url: "${APP_PATH}/emp/" + del_idstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    toPage(currentPage);
                }
            })
        }
    });
</script>
</body>
</html>
