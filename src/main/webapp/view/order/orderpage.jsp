<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/sweetalert.css" media="all">
    <script src="${pageContext.request.contextPath}/static/sweetalert.min.js"></script>
    <style type="text/css">
        .mycenter {
            width: 800px;
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
<blockquote class="layui-elem-quote"z>
    <span><p><b>${seller.sellerName}</b></p></span>
    <span><p><b>起送价：￥${seller.startPrice}</b></p></span>
    <span><p><b>送达时间：${seller.sendTime}</b></p></span>
    <span><p id="sendPrice"><b>配送费：￥${seller.sendPrice}</b></p></span>
</blockquote>

<fieldset class="layui-elem-field">
    <legend>选餐</legend>
    <div class="layui-field-box">
        <div class="mycenter">
            <div class="layui-form-mid">
                <form class="layui-form" action="">
                    <input type="hidden" name="sellerId" id="or_sellerId" value="${seller.sellerId}">
                    <input type="hidden" name="sellerName" id="or_sellerName" value="${seller.sellerName}">
                    <input type="hidden" name="userId" id="or_userId" value="${userId}">
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="userName" id="or_userName" required  lay-verify="required" placeholder="您的名字" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="phone" id="or_phone" lay-verify="phone" autocomplete="off" maxlength="11" placeholder="您的手机" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择宿舍区域</label>
                        <div class="layui-input-block">
                            <select name="address" id="or_address" lay-verify="required">
                                <option value=""></option>
                                <option value="怡园A">怡园A</option>
                                <option value="憬园B">憬园B</option>
                                <option value="恬园C">恬园C</option>
                            </select>
                        </div>
                    </div>
                    <div id="foodlist">
                    <c:forEach var="foodType" items="${foodTypes}" varStatus="se">
                        <div class="layui-form-item">
                            <label class="layui-form-label">${foodType.foodType}</label>
                            <div class="layui-input-block choosefood">
                        <c:forEach var="food" items="${foods}" varStatus="se">
                            <c:if test="${food.foodType==foodType.foodType}">
                                <input type="checkbox" name="checkIem" value="${food.foodName}" foodName="${food.foodName}" price="${food.foodPrice}" title="${food.foodName}￥${food.foodPrice}">
                            </c:if>
                        </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单选框</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男" checked>
                            <input type="radio" name="sex" value="女" title="女">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">详细地址及留言</label>
                        <div class="layui-input-block">
                            <textarea name="note" id="or_note" placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-disabled" id="subbtn" lay-submit lay-filter="formDemo">立即提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div style="float:right ;width:400px;height: 400px;position:relative;right:0;bottom:0">
        <div style="margin-left: auto;">

            <fieldset class="layui-elem-field">
                <legend>选择助手</legend>

                <div class="layui-field-box">
                    <span style="text-align: center;color: #1AA094">菜单点击左、右键数量操作</span>
                    <blockquote class="layui-elem-quote">
                    <h2>起送：￥${seller.startPrice}</h2>
                    </blockquote>
                    <blockquote class="layui-elem-quote">
                        <h3>价格:</h3><div id="total"></div>
                    </blockquote>
                    <h1>已经选择：</h1>
                    <div id="choosedesk" style="color: #1AA094"></div>
                </div>

            </fieldset>
        </div>
    </div>
</fieldset>

<div class="layui-footer footer footer-demo" id="admin-footer">
<div class="layui-main">
<p>
<a href="#">计科13@刘戬</a> 。。。
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
        //起送价格
        var startPrice = $('h2').text().replace('￥','');
        //配送费
        var sendPrice = $('#sendPrice').text().replace('￥','');
        console.log("起送价格"+startPrice);
        console.log("配送费"+sendPrice);


        function getDtail() {
            var str="";
            $('#choosedesk span[id="num"]').each(function () {
                var span_foodname=$(this).attr('name');
                var span_num = $(this).text();
                str+=span_foodname+"X"+span_num+"#";
            });
            return str;
        }

        //监听提交
        form.on('submit(formDemo)', function(data){

            var params = {
                sellerId:$("#or_sellerId").val(),
                sellerName:$("#or_sellerName").val(),
                userId:$("#or_userId").val(),
                userName:$("#or_userName").val(),
                phone:$("#or_phone").val(),
                address:$("#or_address").val(),
                note:$("#or_note").val(),
                detail:getDtail(),
                price:$('#total').text().replace("￥","")
            };
            console.log(params);
            swal({
                title: "您确定要提交？",
                text: "目前只支持货到付款",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "是的",
                confirmButtonColor: "#ec6c62"
            }, function() {

                $.ajax({
                    data:params,
                    url: "${pageContext.request.contextPath}/order/addOrderList",
                    type: "POST",
                }).done(function(data) {

                    swal({
                        title:"操作成功!",
                        text:"请耐心等待你的外卖！",
                        type:"success"
                    },function () {
                        location.reload();
                    })

                }).error(function(data) {
                    swal("OMG", "操作失败了!", "error");
                });

            });
            return false;

        });


        //判断是否满足起送价格
        $(document).ready(function () {
            $('#total').empty().text("￥"+0);

            var istotal = parseInt($('#total').text().replace("￥",""));
            if(istotal<parseInt(sendPrice)){
                $('#subbtn').addClass('layui-btn-disabled');
            }

            //选菜助手
            $(document).on("click", ".choosefood", function () {

                var chooseResult = "";
                var price = 0;
                $(this).find('input:checkbox[name=checkIem]:checked').each(function () {
                    layer.msg($(this).val()+"￥"+$(this).attr('price'));
                });

                $('input:checkbox[name=checkIem]:checked').each(function () {
                    var temp_price =$(this).attr('price');
                    var temp_foodName=$(this).attr('foodName');
                    var temp_num=1;

                    $('#choosedesk span[id="num"]').each(function () {
                        var span_num = $(this).text();
                        var span_price=$(this).attr('price');
                        var span_foodname=$(this).attr('name');
                        if(span_foodname==temp_foodName){
                            temp_num=span_num;
                        }
                    });

                    price+=parseInt(temp_price)*parseInt(temp_num);
                    chooseResult+="<div id='checklist'><span id='foodName'>"+$(this).val()+"</span>X<span id='num' name='"+temp_foodName+"' price='"+temp_price+"'>"+temp_num+"</span></div><br>"
                });
                $('#choosedesk').empty().append(chooseResult);
                $('#total').empty().text("￥"+price);

                if(price<parseInt(sendPrice)){
                    $('#subbtn').addClass('layui-btn-disabled');
                }else{
                    $('#subbtn').removeClass('layui-btn-disabled');
                }
            });

            $(document).on("mousedown", "#checklist", function (e) {
//                layer.msg($(this).text());
                var name = $(this).children('#num').attr('name');
                var num = $(this).children('#num').text();
                var price = $(this).children('#num').attr('price');
                var total = $('#total').text().replace("￥","");
                //右键
                if(3 == e.which&&num>1){
                    num = parseInt(num) -1;
                    $(this).children('#num').empty().text(num);
                    total=parseInt(total)-parseInt(price);
                    layer.msg(name+"X"+num);

                }else if(1 == e.which){
                    num = parseInt(num) +1;
                    $(this).children('#num').empty().text(num);
                    total=parseInt(total)+parseInt(price);
                    layer.msg(name+"X"+num);
                    //左键

                }
                $('#total').empty().text("￥"+total);
                if(parseInt(total)<parseInt(sendPrice)){
                    $('#subbtn').addClass('layui-btn-disabled');
                }else{
                    $('#subbtn').removeClass('layui-btn-disabled');
                }
            });
        })
    });
</script>
</body>

</html>
