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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/sweetalert.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/layui/plugins/font-awesome/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/static/sweetalert.min.js"></script>

</head>

<body>
<p id="updateinfo" style="display: none">1</p>
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
            <div class="layui-tab-content" style="min-height: 150px; padding: 20px 20px 20px 20px;">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>用户管理</legend>
                </fieldset>

                <div style="text-align: right">

                        <div style="float: right"><button class="layui-btn layui-btn-big" id="addbtn"><i class="layui-icon">&#xe654;</i>新增</button></div>
                <div class="layui-form">
                    <div style="text-align: left;width: 200px">
                        <div class="" style="width: 100px">
                            <input id="mysearch" type="text" lay-verify="" autocomplete="off" placeholder="搜索" class="layui-input">
                        </div>
                    </div>

                    <table class="layui-table">
                        <colgroup>
                            <col width="50">
                            <col width="150">
                            <col width="20">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>角色</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>地址</th>
                            <th>邮箱</th>
                            <th>性别</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="user_list">


                        </tbody>
                    </table>
                </div>
                <div id="demo8" style="text-align:center"></div>
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

            //调用分页
            //渲染
            var render = function(curr){
                var search  = $("#mysearch")[0].value
                var result='';
                $.get('${pageContext.request.contextPath}/admin/userList?curr='+curr+'&search='+search,function (data) {
                    var size = data.size;
                    for(var i = 0; i < size; i++){
                        var id = data.list[i].id;
                        var userName = data.list[i].userName;
                        var role = data.list[i].role;
                        var phone = data.list[i].phone;
                        var name = data.list[i].name;
                        var address = data.list[i].address;
                        var email = data.list[i].email;
                        var sexual = data.list[i].sexual;
                        var createTime = data.list[i].createTime;
                        result += '<tr><td>'+userName+'</td>' +
                            '<td>'+role+'</td>' +'<td>'+name+'</td>'+'<td>'+phone+'</td>'+'<td>'+address+'</td>'+'<td>'+email+'</td>'+'<td>'+sexual+'</td>'+'<td>'+createTime+'</td>'+
                            '<td style="text-align: center"><button class="layui-btn layui-btn-normal layui-btn-small" id="updatebtn" updateid="'+id+'">修改<i class="layui-icon"></i></button>' +
                            '<button class="layui-btn layui-btn-danger layui-btn-small" id="deletebtn" deleteid="'+id+'">删除<i class="layui-icon"></i></button></td></tr>';
                    }
                    document.getElementById('user_list').innerHTML =result;
                    laypage({
                        cont: 'demo8',
                        skin:'flow' ,
                        curr: curr
                        ,pages: data.pages //得到总页数
                        ,jump: function(obj,first){
                            if(!first){
                                render(obj.curr);
                            }
                        }
                    });
                });


            };

            //搜索分页
            $("#mysearch").on('input',function(e){
                render(1);
            });

            //页面加载绑定事件
            $(document).ready(function () {
                render(1);
                $('#addbtn').on('click',function () {
                    //页面层-自定义
                    //iframe层-禁滚动条
                    layer.open({
                        type: 2,
                        title:'新增用户',
                        area: ['800px','60%'],
                        skin: 'layui-layer-rim', //加上边框
                        content: ['${pageContext.request.contextPath}/admin/adduserpage'],
                        cancel: function(){
                            //右上角关闭回调
                            $('#updateinfo').text(0);
                            //return false 开启该代码可禁止点击该按钮关闭
                        },
                        end: function () {
                            var info = $('#updateinfo').text();
                            if(info!='0'){
                                swal({
                                    title:"新增成功!",
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


                $(document).on("click",'#updatebtn',function(){
                    console.log();
                    var updateid = $(this).attr('updateid');
                    //页面层-自定义
                    //iframe层-禁滚动条
                    layer.open({
                        type: 2,
                        title:'新增用户',
                        area: ['800px','60%'],
                        skin: 'layui-layer-rim', //加上边框
                        content: ['${pageContext.request.contextPath}/admin/updateuserpage?updateid='+updateid],
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
                $(document).on("click",'#deletebtn',function () {
                    var id  = $(this).attr('deleteid');
                    swal({

                        title: "您确定要删除吗？",

                        text: "您确定要删除这条数据？",

                        type: "warning",

                        showCancelButton: true,

                        closeOnConfirm: false,

                        confirmButtonText: "是的，我要删除",

                        confirmButtonColor: "#ec6c62"

                    }, function() {

                        $.ajax({

                            url: "${pageContext.request.contextPath}/admin/delete?deleteid="+id,

                            type: "GET",

                        }).done(function(data) {

                            swal({
                                title:"操作成功!",
                                text:"已成功删除数据！",
                                type:"success"
                            },function () {
                                location.reload();
                            })

                        }).error(function(data) {
                            swal("OMG", "删除操作失败了!", "error");
                        });

                    });
                });

            });





        });
    </script>
</div>
</body>

</html>
