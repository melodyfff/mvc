<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/sweetalert.css" media="all">
    <script src="${pageContext.request.contextPath}/static/sweetalert.min.js"></script>
    <title>Title</title>
</head>
<body>
<p id="errormsg" style="display: none">1</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>${sellerName}</legend>
</fieldset>
<div class="layui-collapse" lay-filter="test">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">添加新品种</h2>
        <div class="layui-colla-content">
            <form id="addFoodType" class="layui-form">
                <input name="sellerId" value="${sellerId}" hidden>
                <div class="layui-form-item">
                    <label class="layui-form-label">种类名</label>
                    <div class="layui-input-block">
                        <input type="text" name="foodType" maxlength="20" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="foodTypeAdd">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">添加商品详情</h2>
        <div class="layui-colla-content">
            <form id="addFood" class="layui-form">
                <input name="sellerId" value="${sellerId}" hidden>
                <input name="sellerName" value="${sellerName}" hidden>
                <div class="layui-form-item">
                    <label class="layui-form-label">单行选择框</label>
                    <div class="layui-input-block">
                        <select name="foodType" id="foodtypelists" lay-filter="aihao">
                            <c:forEach var="item" items="${sellerFoodTypes}">
                                <option value="${item.foodType}">${item.foodType}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="foodAdd">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

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
            <th>人物</th>
            <th>民族</th>
            <th>出场时间</th>
            <th>格言</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox" name="" lay-skin="primary"></td>
            <td>贤心</td>
            <td>汉族</td>
            <td>1989-10-14</td>
            <td>人生似修行</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="" lay-skin="primary"></td>
            <td>张爱玲</td>
            <td>汉族</td>
            <td>1920-09-30</td>
            <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="" lay-skin="primary"></td>
            <td>Helen Keller</td>
            <td>拉丁美裔</td>
            <td>1880-06-27</td>
            <td> Life is either a daring adventure or nothing.</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="" lay-skin="primary"></td>
            <td>岳飞</td>
            <td>汉族</td>
            <td>1103-北宋崇宁二年</td>
            <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="" lay-skin="primary"></td>
            <td>孟子</td>
            <td>华夏族（汉族）</td>
            <td>公元前-372年</td>
            <td>猿强，则国强。国强，则猿更强！</td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/plugins/layui/layui.js"
        charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'element', 'layer'], function () {
        var element = layui.element();
        var layer = layui.layer;
        var $ = layui.jquery;

        var form = layui.form();
        //监听折叠
        element.on('collapse(test)', function (data) {
//            layer.msg('展开状态：'+ data.show);
            console.log("${sellerFoodTypes}")
        });
        //页面加载绑定事件
        $(document).ready(function () {
            $('#errormsg').text(1);
            <%--var result = "";--%>
            <%--<c:forEach var="item" items="${sellerFoodTypes}" varStatus="se">--%>
            <%--<option value="${item.foodType}">${item.foodType}</option> --%>
                <%--</c:forEach>--%>
            <%--$('#foodtypelists').append();--%>
        });
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '用户名得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
            , scroe: [/[0-5]/, '评分在0-5之间']
            , numb: [/^[0-9]*$/, '请输入数字']
        });


        $('#foodTypeAdd').on('click', function () {
            $.ajax({

                url: "${pageContext.request.contextPath}/food/addFoodType",
//                async:false,
                type: "GET",
                data: $('#addFoodType').serialize(),
                success: function (data) {
                    console.log(data);
                    console.log(data.status);

                    if (data.status == 1) {
//                        parent.layer.close(index);
                        swal("Good job!", "You clicked the button!", "success");
                    } else {
                        $('#errormsg').text(data.errmsg);
                        swal("OMG", "新增操作失败了!", "error");
                    }
                }
            });

        })

        if ($('#errormsg').text() != '1' || $('#errormsg').text() != 1) {
            console.log($('#errormsg').text());
            swal("OMG", "新增操作失败了!", "error");
            $('#errormsg').empty().text('1');
        }
    });
</script>
</body>
</html>
