<%--
  Created by IntelliJ IDEA.
  User: wow
  Date: 2017/4/2
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <form id ="updateUser" class="layui-form">
        <input name="id" value="${seller.id}" hidden>
        <input name="sellerId" value="${seller.sellerId}" hidden>
        <div class="layui-form-item">
            <label class="layui-form-label">商家用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username"   readonly="true" value="${user.username}"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商铺名</label>
            <div class="layui-input-block">
                <input type="text" name="sellerName" lay-verify="required" maxlength="20" value="${seller.sellerName}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商家LOGO地址URL</label>
            <div class="layui-input-block">
                <input type="text" name="sellerLogo" lay-verify="url|required" value="${seller.sellerLogo}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商家评分</label>
            <div class="layui-input-inline">
                <input type="text" name="scoreNum" lay-verify="scroe|required" maxlength="1" value="${seller.scoreNum}" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">送达时间</label>
            <div class="layui-input-inline">
                <input type="text" name="sendTime" lay-verify="numb|required" maxlength="3" autocomplete="off" value="${seller.sendTime}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">起送价格</label>
            <div class="layui-input-inline">
                <input type="text" name="startPrice" lay-verify="numb|required" maxlength="3" autocomplete="off" value="${seller.startPrice}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">配送费</label>
            <div class="layui-input-inline">
                <input type="text" name="sendPrice" lay-verify="numb|required" maxlength="3" autocomplete="off" value="${seller.sendPrice}" class="layui-input">
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
            ,layer = layui.layer,
        $ = layui.jquery
            ,layedit = layui.layedit
            ,laydate = layui.laydate;


        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '用户名得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
            ,scroe:[/[0-5]/,'评分在0-5之间']
            ,numb:[/^[0-9]*$/,'请输入数字']
        });


        form.on('submit(submitadd)', function(data){
            var index = parent.layer.getFrameIndex(window.name)
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/updateseller",
                data: $('#updateUser').serialize(),
                success: function(data){
                    console.log(data);
                    console.log(data.status);
                    if(data.status==1){
                        parent.layer.close(index);
                    }else {
                        layer.msg('更新失败！！！');
                    }
                }
            });

            return false;
        });

    });
</script>
</body>
</html>
