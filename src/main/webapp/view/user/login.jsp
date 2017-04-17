<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/login.css" />
</head>

<body class="beg-login-bg">
<div class="beg-login-box">
    <p id="updateinfo" style="display: none">1</p>
    <header>
        <h1><b>KMU</b>登录</h1>
    </header>
    <div class="beg-login-main">
        <form id="formid" action="${pageContext.request.contextPath}/login/forwardMain" class="layui-form" method="post">
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input type="text" name="userName" required  lay-verify="required" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" name="passWord" required  lay-verify="required" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="text" name="test" required  lay-verify="password" autocomplete="off" placeholder="请输入验证码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="beg-pull-left beg-login-remember">
                    <img id="faker" src="http://passport.iqiyi.com/register/vcode.php?r=0.39864017472397695">
                    <label><a href="javascript:;" id="register"><p style="color: #985f0d">还没帐号？</p></a></label>
                </div>
                <div class="beg-pull-right">
                    <button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                        <i class="layui-icon">&#xe650;</i> 登录
                    </button>

                </div>

                <div class="beg-clear"></div>
            </div>
        </form>
    </div>
    <footer>
        <p>计科13级 © 刘戬 </p>
    </footer>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/plugins/layui/layui.js"></script>
<script>
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form();

        form.on('submit(login)',function(data){
//            layer.msg();
            <%--location.href='${pageContext.request.contextPath}/login/forwardMain';--%>
            <%--$.post('${pageContext.request.contextPath}/login/forwardMain',JSON.stringify(data.field));--%>
            document.getElementById("formid").submit()
            return false;
        });
        $(document).on('click','#faker',function () {
            location.reload();
        })
        $(document).on('click','#register',function () {
            //页面层-自定义
            //iframe层-禁滚动条
            layer.open({
                type: 2,
                title:'新增用户',
                area: ['80%','80%'],
                skin: 'layui-layer-rim', //加上边框
                content: ['${pageContext.request.contextPath}/admin/register'],
                cancel: function(){
                    //右上角关闭回调
                    $('#updateinfo').text(0);
                    //return false 开启该代码可禁止点击该按钮关闭
                },
                end: function () {
                    var info = $('#updateinfo').text();
                    if(info!='0'){
                    }
                    $('#updateinfo').text(1);
                }
            });
        });

    });
</script>
</body>

</html>
