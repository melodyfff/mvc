<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/sweetalert.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/layui/plugins/font-awesome/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/static/sweetalert.min.js"></script>

</head>

<body>
<p id="updateinfo" style="display: none">1</p>
<p id="sellerId" style="display: none">${id}</p>
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
                <c:if test="${role=='商家'}">
                <li class="layui-nav-item" id="foodlist">
                    <a href="javascript:;">
                        <i class="fa fa-shopping-bag" ></i>
                        <cite>菜单管理</cite>
                    </a>
                </li>
                    <li class="layui-nav-item" id="sellerinfo">
                        <a href="javascript:;">
                            <i class="fa fa-gears"></i>
                            <cite>店铺信息设置</cite>
                        </a>
                    </li>
                </c:if>
                <li class="layui-nav-item" id="orderInfo">
                    <a href="javascript:;">
                        <i class="fa fa-tv"></i>
                        <cite>订单管理</cite>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="${pageContext.request.contextPath}/layui/images/0.jpg"/>
                        <span>${userName}(${role})</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd id="userinfo">
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
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
                    <cite>选餐面板</cite>
                    <p id="usersid" style="display: none">${id}</p>
                    <p id="roletemp" style="display: none">${role}</p>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">

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
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/datas/nav.js"></script>
    <script src="${pageContext.request.contextPath}/layui/js/index.js"></script>
    <script>
        layui.use('layer', function () {
            var $ = layui.jquery,
                layer = layui.layer;

            $('.layui-btn').on('click',function () {
                layer.msg('hello');
            });

            var myid = $('#sellerId').text();
            //插入content
            $.get("${pageContext.request.contextPath}/order/orderlist?id="+myid, function(data){
                var qqq = $('.layui-tab-content');
                qqq.append(data);
            });

            $('#sellerinfo').off('click').on('click',function () {
                var updateid = $('#sellerId').text();
                layer.open({

                    type: 2,
                    title:'店铺信息',
                    area: ['800px','60%'],
                    skin: 'layui-layer-rim', //加上边框
                    content: ['${pageContext.request.contextPath}/admin/sellerinfo?updateid='+updateid],
                    cancel: function(){
                        //右上角关闭回调
                        $('#updateinfo').text(0);
                        $('#sellerinfo').removeClass('layui-this');
                        //return false 开启该代码可禁止点击该按钮关闭
                    },
                    end: function () {
                        var info = $('#updateinfo').text();
                        if(info!='0'){
                            swal({
                                title:"修改成功!",
                                text:"信息已经修改!",
                                type:"success"
                            },function () {
                                location.reload();
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });

            $('#userinfo').off('click').on('click',function () {
                var updateid = $('#sellerId').text();
                layer.open({
                    type: 2,
                    title:'修改用户',
                    area: ['800px','60%'],
                    skin: 'layui-layer-rim', //加上边框
                    content: ['${pageContext.request.contextPath}/admin/userinfo?updateid='+updateid],
                    cancel: function(){
                        //右上角关闭回调
                        $('#updateinfo').text(0);
                        //return false 开启该代码可禁止点击该按钮关闭
                    },
                    end: function (data) {
                        var info = $('#updateinfo').text();
                        if(info!='0'){
                            swal({
                                title:"修改成功!",
                                text:"信息已经修改!",
                                type:"success"
                            },function () {
                                location.reload();
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });

            $('#foodlist').off('click').on('click',function () {
                var sellerId = $('#sellerId').text();
                var index =layer.open({
                    type: 2,
                    title:'菜单管理',
                    area: ['80%','80%'],
                    skin: 'layui-layer-rim', //加上边框
                    maxmin: true,
                    content: ['${pageContext.request.contextPath}/food/main?sellerId='+sellerId],
                    cancel: function(){
                        //右上角关闭回调
                        $('#updateinfo').text(0);
                        $('#foodlist').removeClass('layui-this');
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                });
                layer.full(index);
            });
            $(document).off('click','#orderInfo').on("click",'#orderInfo',function () {
                var userId = $('#usersid').text();
                var sellerId=$('#sellerId').text();
                var role = $('#roletemp').text();
                layer.open({
                    type: 2,
                    title:'订单管理',
                    area: ['80%','60%'],
                    skin: 'layui-layer-rim', //加上边框
                    content: ['${pageContext.request.contextPath}/order/orderInfo?id='+userId+'&role='+role],
                    cancel: function(){
                        //右上角关闭回调
                        $('#updateinfo').text(0);
                        $('#orderInfo').removeClass('layui-this');
                        //return false 开启该代码可禁止点击该按钮关闭
                    },
                    end: function () {
                        var info = $('#updateinfo').text();
                        if(info!='0'){
                            swal({
                                title:"修改成功!",
                                text:"信息已经修改!",
                                type:"success"
                            },function () {
//                                location.reload();
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });

        });
    </script>
</div>
</body>

</html>
