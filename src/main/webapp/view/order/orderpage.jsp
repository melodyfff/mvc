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
    <style type="text/css">
        .mycenter {
            width: 500px;
            hight: 1000px;
            background-color: #000;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

</head>

<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" href="${pageContext.request.contextPath}/garden/world">
                    <b>Welcome To KMU!</b>
                </a>
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="${pageContext.request.contextPath}/layui/images/0.jpg"/>
                        <span>${username}(${role})</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true"
                                   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/garden/login"><i class="fa fa-sign-out"
                                                                                         aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/garden/login"><i class="fa fa-sign-out"
                                                                                 aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
    <!-----head end----->
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
</div>
<br><br><br>
<blockquote class="layui-elem-quote">
    <span><p><b>${seller.sellerName}</b></p></span>
    <span><p><b>起送价：￥${seller.startPrice}</b></p></span>
    <span><p><b>送达时间：${seller.sendTime}</b></p></span>
    <span><p><b>配送费：￥${seller.sendPrice}</b></p></span>
</blockquote>

<fieldset class="layui-elem-field">
    <legend>选餐</legend>
    <div class="layui-field-box">
        <div class="mycenter">
            <div class="layui-form-mid">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" required  lay-verify="required" placeholder="您的名字" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="phone" lay-verify="phone" autocomplete="off" maxlength="11" placeholder="您的手机" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择宿舍区域</label>
                        <div class="layui-input-block">
                            <select name="city" lay-verify="required">
                                <option value=""></option>
                                <option value="0">A</option>
                                <option value="1">B</option>
                                <option value="2">C</option>
                                <option value="3">D</option>
                            </select>
                        </div>
                    </div>
                    <div id="foodlist">
                    <div class="layui-form-item">
                        <label class="layui-form-label">肉菜</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="checkIem" value="牛肉" title="牛肉">
                            <input type="checkbox" name="checkIem" value="鸡肉" title="鸡肉" >
                            <input type="checkbox" name="checkIem" value="鸭肉" title="鸭肉">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">素菜</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="checkIem" value="白菜" title="白菜">
                            <input type="checkbox" name="checkIem" value="黄瓜" title="黄瓜" >
                            <input type="checkbox" name="checkIem" value="萝卜" title="萝卜">
                        </div>
                    </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">开关</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="switch" lay-skin="switch">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单选框</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男" checked>
                            <input type="radio" name="sex" value="女" title="女">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">文本域</label>
                        <div class="layui-input-block">
                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div style="background-color: #5bc0de ;float:right ;width:320px;height: 400px;position:relative;right:0;bottom:0">
        <div style="margin-left: auto;padding: 50px">
            <h2>起送：￥${seller.startPrice}</h2>
        </div>
    </div>
</fieldset>

<div class="layui-footer footer footer-demo" id="admin-footer">
<div class="layui-main">
<p>
<a href="#">开发中</a> 。。。
</p>
</div>
</div>
<!---------js----------->
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/plugins/layui/layui.js"></script>
<script>
    //Demo
    layui.use('form', function(){

        var $ = layui.jquery;

        var form = layui.form();

        //监听提交
        form.on('submit(formDemo)', function(data){
            var str ="";
            $('input:checkbox[name=checkIem]:checked').each(function () {
                str+=$(this).val()
            });
            layer.msg(JSON.stringify(data.field)+"  "+str);
            console.log(data.field);
            return false;
        });
    });
</script>
</body>

</html>
