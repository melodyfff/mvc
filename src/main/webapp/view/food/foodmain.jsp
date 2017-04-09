<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/sweetalert.css" media="all">
    <script src="${pageContext.request.contextPath}/static/sweetalert.min.js"></script>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/plugins/layui/layui.js"
            charset="utf-8"></script>
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
                        <input type="text" name="foodType" lay-verify="required" maxlength="20" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="submitadd" id="foodTypeAdd">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">删除品种</h2>
        <div class="layui-colla-content">
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>种类</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty sellerFoodTypes}">
                    <c:forEach var="item" items="${sellerFoodTypes}">
                        <tr>
                            <td>${item.foodType}</td>
                            <td style="text-align: center">
                                <button class="layui-btn layui-btn-danger layui-btn-small" id="foodtypedeletebtn" sellerId="${item.sellerId}" foodType="${item.foodType}">
                                    删除<i class="layui-icon"></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
        </div>
    </div>
    <c:if test="${not empty sellerFoodTypes}">
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
                    <label class="layui-form-label">菜名</label>
                    <div class="layui-input-block">
                        <input type="text" name="foodName" lay-verify="required" maxlength="20" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-block">
                        <input type="text" name="foodPrice" lay-verify="numb|required" maxlength="10" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="submitadd2" id="foodAdd">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </c:if>
</div>

    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>种类</th>
            <th>菜名</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty sellerFood}">
            <c:forEach var="item" items="${sellerFood}">
                <tr>
                    <td>${item.foodType}</td>
                    <td>${item.foodName}</td>
                    <td>${item.foodPrice}</td>
                    <td style="text-align: center">
                        <button class="layui-btn layui-btn-danger layui-btn-small" id="fooddeletebtn" sellerId="${item.sellerId}" deleteid="${item.id}">
                            删除<i class="layui-icon"></i></button>
                    </td>
                </tr>
            </c:forEach>
        </c:if>

        </tbody>
    </table>

<script>
    layui.use(['form', 'element', 'layer'], function () {
        var element = layui.element();
        var layer = layui.layer;
        var $ = layui.jquery;

        var form = layui.form();
        //监听折叠
        element.on('collapse(test)', function (data) {
//            layer.msg('展开状态：'+ data.show);
        });

        //页面加载绑定事件
        $(document).ready(function () {
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

            form.on('submit(submitadd)', function (data) {
                var index = parent.layer.getFrameIndex(window.name)
                $.ajax({

                    url: "${pageContext.request.contextPath}/food/addFoodType",
//                async:false,
                    type: "GET",
                    data: $('#addFoodType').serialize(),
                    success: function (data) {
                        console.log(data);
                        console.log(data.status);

                        if (data.status == 1) {
                            swal({
                                title: "操作成功!",
                                text: "已成功添加！",
                                type: "success"
                            }, function () {
                                location.reload();
                            })
                        } else {
                            $('#errormsg').text(data.errmsg);
                            swal("OMG", "操作失败了,该种类已经存在!", "error");
                        }
                    }
                });
                return false;
            });

            form.on('submit(submitadd2)', function (data) {
                $.ajax({

                    url: "${pageContext.request.contextPath}/food/addFood",
                    type: "GET",
                    data: $('#addFood').serialize(),
                    success: function (data) {
                        console.log(data);
                        console.log(data.status);

                        if (data.status == 1) {
//                        parent.layer.close(index);
                            swal({
                                title: "操作成功!",
                                text: "已成功添加！",
                                type: "success"
                            }, function () {
                                location.reload();
                            })
                        } else {
                            $('#errormsg').text(data.errmsg);
                            swal("OMG", "操作失败了!", "error");
                        }
                    }
                });
                return false;
            });
            $(document).off('click', '#fooddeletebtn').on("click", '#fooddeletebtn', function () {
                var deleteId = $(this).attr('deleteid');
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

                        url: "${pageContext.request.contextPath}/food/deletefood?deleteid="+deleteId,

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

            $(document).off('click', '#foodtypedeletebtn').on("click", '#foodtypedeletebtn', function () {
                var sellerId = $(this).attr('sellerId');
                var foodType = $(this).attr('foodType');
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

                        url: "${pageContext.request.contextPath}/food/deletefoodtype?sellerId="+sellerId+"&foodType="+foodType,

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
            })

        });

    })
</script>
</body>
</html>
