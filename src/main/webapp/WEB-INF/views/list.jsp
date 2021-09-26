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
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
<%--        表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageinfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
<%--        分页信息--%>
        <div class="row">
<%--            分页文字信息--%>
            <div class="col-md-6">
                当前 ${pageinfo.pageNum} 页 , 总 ${pageinfo.pages} 页 , 总 ${pageinfo.total} 条记录
            </div>
<%--            分页条--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${!pageinfo.isFirstPage}">
                            <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        </c:if>
                        <c:if test="${pageinfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageinfo.navigatepageNums}" var="page">
                            <c:if test="${page == pageinfo.pageNum}">
                                <li class="active"><a href="#">${page}</a></li>
                            </c:if>
                            <c:if test="${page != pageinfo.pageNum}">
                                <li><a href="${APP_PATH}/emps?pn=${page}">${page}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageinfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageinfo.isLastPage}">
                            <li><a href="${APP_PATH}/emps?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>



    </div>
</body>
</html>
