<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome To KMU!</title>
    <%--<meta name="renderer" content="webkit">--%>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
    <%--<meta name="apple-mobile-web-app-status-bar-style" content="black">--%>
    <%--<meta name="apple-mobile-web-app-capable" content="yes">--%>
    <%--<meta name="format-detection" content="telephone=no">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/global.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/layui/plugins/font-awesome/css/font-awesome.min.css">

</head>

<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" href="${pageContext.request.contextPath}/garden/world">
                    <b>Welcome To KMU!</b>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                <%--<div class="admin-side-full">--%>
                <%--<i class="fa fa-life-bouy" aria-hidden="false"></i>--%>
                <%--</div>--%>
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                        <cite>商品管理</cite>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-module-id="3">
                        <i class="fa fa-users" aria-hidden="true"></i>
                        <cite>会员管理</cite>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="fa fa-tv" aria-hidden="true"></i>
                        <cite>订单管理</cite>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="fa fa-gears" aria-hidden="true"></i>
                        <cite>设置</cite>
                    </a>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="${pageContext.request.contextPath}/layui/images/0.jpg"/>
                        <span>${userName}(${role})</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true"
                                   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/login/main"><i class="fa fa-sign-out"
                                                                                       aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/login/main"><i class="fa fa-sign-out"
                                                                               aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <cite>控制台</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">


                <div class="layui-form">
                    <table class="layui-table">
                        <colgroup>
                            <col width="50">
                            <col width="150">
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                            <th>用户名${pageInfo.size}</th>
                        </tr>
                        </thead>
                        <tbody id="user_list">


                        </tbody>
                    </table>
                </div>
                <div id="demo8"></div>
            </div>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="${pageContext.request.contextPath}/layui/images/0.jpg"/>
            </div>
            <div class="admin-header-lock-name" id="lockUserName">beginner</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd"/>
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
    <!--锁屏模板 end -->

    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/datas/adminnav.js"></script>
    <script src="${pageContext.request.contextPath}/layui/js/admin.js"></script>
    <script>
        layui.use(['layer', 'form','laypage'] ,function () {
            var laypage = layui.laypage;
            var $ = layui.jquery,
                form = layui.form()
            ,layer = layui.layer;

            $('.layui-btn').on('click',function () {
                layer.msg('hello');
            });

            //全选
            form.on('checkbox(allChoose)', function(data){
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function(index, item){
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });
            //插入content
            <%--$.get("${pageContext.request.contextPath}/order/orderlist", function(data){--%>
                <%--var qqq = $('.layui-tab-content');--%>
                <%--qqq.append(data);--%>
            <%--});--%>
            //调用分页


            //渲染
            var render = function(curr){
                var result='';
                $.get('${pageContext.request.contextPath}/admin/userList?curr='+curr,function (data) {

                    //此处只是演示，实际场景通常是返回已经当前页已经分组好的数据
                    console.log(data);
                    var size = data.size;
                    for(var i = 0; i < size; i++){
                        var userName = data.list[i].userName;
                        result += '<tr><td><input type="checkbox" name="" lay-skin="primary"></td><td>'+userName+'</td></tr>';
                    }
//                    console.log(result);
//                    console.log(data);
                    document.getElementById('user_list').innerHTML =result;
                    console.log('进入分页');
                    laypage({
                        cont: 'demo8',
                        curr: curr
                        ,pages: data.pages //得到总页数
                        ,jump: function(obj,first){
                            console.log("first=="+first);
                            if(!first){
                                render(obj.curr);
                            }
                        }
                    });
                });


            };

            $(document).ready(function () {
                render(1);
            });

        });
    </script>
</div>
</body>

</html>
