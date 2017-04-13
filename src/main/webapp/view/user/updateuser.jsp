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
            width: 700px;
            margin: 0 auto;
            padding-top: 20px;
            padding-right: 20px;
            padding-bottom: 20px;
        }
        .mybtn{
            width: 500px;
            margin-left: 160px;
            padding-bottom: 20px;
        }
    </style>
</head>
<body>
<div id="myuseradd">
    <form id ="updateUser" class="layui-form" action="${pageContext.request.contextPath}/admin/update">
        <input name="id" value="${user.id}" hidden>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="title"  readonly="true" value="${user.username}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" lay-verify="required|pass" placeholder="密码"  value="${user.password}" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="tel" name="name" lay-verify="required" value="${user.name}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" lay-verify="required" value="${user.address}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="phone" lay-verify="phone" maxlength="11" value="${user.phone}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">邮箱${user.id}</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" lay-verify="email" autocomplete="off" value="${user.email}" class="layui-input">
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
                <select name="roleId" lay-filter="aihao">
                    <c:if test="${user.roleId==2}">
                        <option value=""></option>
                        <option value="2" selected="">普通用户</option>
                        <option value="3">商家</option>
                    </c:if>
                    <c:if test="${user.roleId==3}">
                        <option value=""></option>
                        <option value="2" >普通用户</option>
                        <option value="3" selected="">商家</option>
                    </c:if>
                    <c:if test="${user.roleId==''||user.roleId==null}">
                        <option value=""></option>
                        <option value="2" >普通用户</option>
                        <option value="3" >商家</option>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <c:if test="${user.sexual=='男'}">
                    <input type="radio" name="sexual" value="男" title="男" checked="">
                    <input type="radio" name="sexual" value="女" title="女">
                    <input type="radio" name="sexual" value="未知" title="未知">
                </c:if>
                <c:if test="${user.sexual=='女'}">
                    <input type="radio" name="sexual" value="男" title="男" >
                    <input type="radio" name="sexual" value="女" title="女" checked="">
                    <input type="radio" name="sexual" value="未知" title="未知">
                </c:if>
                <c:if test="${user.sexual=='未知'||user.sexual==''||user.sexual==null}">
                    <input type="radio" name="sexual" value="男" title="男" >
                    <input type="radio" name="sexual" value="女" title="女" >
                    <input type="radio" name="sexual" value="未知" title="未知" checked="">
                </c:if>


            </div>
        </div>
                <button class="layui-btn mybtn" lay-submit="" lay-filter="submitadd">立即提交</button>
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

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/update",
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
