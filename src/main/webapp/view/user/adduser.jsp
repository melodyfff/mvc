<%--
  Created by IntelliJ IDEA.
  User: wow
  Date: 2017/4/2
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/plugins/layui/css/layui.css" media="all"/>
    <style>
        #myuseradd{
            width: 100%;

        }
    </style>
</head>
<body>
<div id="myuseradd">
<form id ="addUser" class="layui-form" action="${pageContext.request.contextPath}/admin/adduser">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="用户名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="required|pass" placeholder="密码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="tel" name="name" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" lay-verify="phone" maxlength="11" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <select name="roleId" lay-filter="aihao">
                <option value=""></option>
                <option value="2">普通用户</option>
                <option value="3">商家</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sexual" value="男" title="男" checked="">
            <input type="radio" name="sexual" value="女" title="女">
            <input type="radio" name="sexual" value="未知" title="未知">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            <button class="layui-btn" lay-submit="" lay-filter="submitadd">立即提交</button>
        </div>
    </div>
</form>
</div>
<p id="callmsg">${msg}</p>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form()
            ,layer = layui.layer
             $ = layui.jquery
            ,layedit = layui.layedit
            ,laydate = layui.laydate;


        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '用户名得5个字符啊';
                }
                if(value != null){
                    var temp = 'ok';
                    $.ajax({
                        type: "POST",
                        dataType:'text',
                        url: "${pageContext.request.contextPath}/admin/isUserExist",
                        data: "username="+value,
                        async: false,//异步处理关闭，可以给外部赋值
                        success: function(data){
                            console.log('判断'+data);
                            console.log('var'+value);
                            if(data!=0){
                                temp = 'no';
                            }
                        }
                    });
                    console.log(temp);
                    if(temp=='no')return '用户已经在~';
                }

            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });


        form.on('submit(submitadd)', function(data){
            var index = parent.layer.getFrameIndex(window.name)
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            <%--$.post('${pageContext.request.contextPath}/admin/adduser',$('#addUser').serialize(),function (data) {--%>
                <%--console.log(data);--%>
                <%--layer.msg("${sdsdsd}");--%>
            <%--});--%>

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/adduser",
                data: $('#addUser').serialize(),
                success: function(data){
                    console.log(data);
                    console.log(data.status);
                    layer.msg(""+data.status);
                    if(data.status==1){
                        parent.layer.close(index);
                    }else {
                        layer.msg('新增失败！！！');
                    }
                }
            });
//            $('#addUser').submit();
//            parent.layer.close(index); //执行关闭

            return false;
        });

    });
</script>
</body>
</html>
