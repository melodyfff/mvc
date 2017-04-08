<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
    <title></title>

    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/home.css">
</head>


<div class="inner-bg">
    <div class="rest-filter clearfix" style="border: none;">
    </div>
    <div class="divider"></div>
</div>
<div class="container">
    <div class="container-fluid">
        <div class="rest-list">
            <ul class="list clearfix" id="mainul">
            </ul>
        </div>
    </div>
</div>
</div>

</div>
</div>
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<script>
    var uul = document.getElementById('mainul');
    <c:forEach var="item" items="${seller}" varStatus="se">
    var t1='<li class="fl rest-li">';
    t1+='<div class="j-rest-outer rest-outer transition hover">';
    t1+='<div data-title="'+'${item.sellerName}'+'"data-poiid="144934982538216290" class="restaurant" data-all="1" data-minpricelevel="2">';
    t1+='<a class="rest-atag" href="${pageContext.request.contextPath}/order/main?sellerId='+'${item.sellerId}'+'" target="_blank">';
    t1+='<div class="top-content">';
    t1+='<div class="preview">';
    t1+='<img data-rid="'+'${item.id}'+'" data-index="0" class="scroll-loading" src="'+'${item.sellerLogo}'+'" data-src="'+'${item.sellerLogo}'+'" data-max-width="208" data-max-height="156">';
    t1+='<div class="rest-tags"> </div> </div> <div class="content">';
    t1+='<div class="name"> <span title="'+'${item.sellerName}'+'">'+'${item.sellerName}'+'</span></div>';
    t1+='<div class="rank clearfix"> <span class="star-ranking fl"> <span class="star-score" style="width: 68px"></span> </span> <span class="score-num fl">'+'${item.scoreNum}'+'</span>';
    t1+='</div> <div class="price"> <span class="start-price">起送:￥'+'${item.startPrice}'+'</span> <span class="send-price"> 配送费￥'+'${item.sendPrice}'+' </span>';
    t1+='<span class="send-time"><i class="icon i-poi-timer"></i>'+'${item.sendTime}'+'</span> </div></div>';
    t1+='<div class="clear"></div></div></a></div></div></li>';
    uul.innerHTML+=t1;
    </c:forEach>
    uul.innerHTML+='<li class="rest-separate j-rest-separate loading" id="loading"> <div class="isloading">点击加载更多商家</div> </li>';
</script>