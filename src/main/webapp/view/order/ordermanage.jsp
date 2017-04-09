<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fieldset class="layui-elem-field layui-field-title">
    <legend>订单管理</legend>
</fieldset>

<div style="text-align: right"></div>
<div class="layui-form">
        <div class="" style="width: 800px">
            <div class="layui-form-pane">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <input class="layui-input" placeholder="自定义日期格式" id="LAY_demorange_s" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                    </div>
                    <div class="layui-inline">
                        <input class="layui-input" placeholder="自定义日期格式" id="LAY_demorange_e" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                    </div>
                </div>
            </div>
        </div>

    <table class="layui-table">
        <colgroup>
            <col width="10">
            <col width="10">
            <col width="150">
            <col width="20">
            <col width="150">
            <col width="100">
            <col width="50">
            <col width="150">
            <col width="150">
            <col width="50">
            <col width="10">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>订单号</th>
            <th>商家ID</th>
            <th>商铺名</th>
            <th>用户ID</th>
            <th>姓名</th>
            <th>电话</th>
            <th>地址</th>
            <th>详细留言</th>
            <th>详情</th>
            <th>价格</th>
            <th>订单状态</th>
            <th>成交时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="user_list">


        </tbody>
    </table>
</div>
<div id="demo8" style="text-align:center"></div>
<script>
    layui.use(['laydate','layer', 'form','laypage'] ,function () {
        var laypage = layui.laypage;
        var $ = layui.jquery,
            form = layui.form()
            ,layer = layui.layer;

        //获得年月日      得到日期oTime
        function getMyDate(str){
            var oDate = new Date(str),
                oYear = oDate.getFullYear(),
                oMonth = oDate.getMonth()+1,
                oDay = oDate.getDate(),
                oHour = oDate.getHours(),
                oMin = oDate.getMinutes(),
                oSen = oDate.getSeconds(),
                oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间
            return oTime;
        };
        //补0操作
        function getzf(num){
            if(parseInt(num) < 10){
                num = '0'+num;
            }
            return num;
        }

        //调用分页
        //渲染
        var render = function(curr,startTime,endTime,sellerId,userId){
            if(startTime==''||startTime==null){
                startTime=getMyDate(new Date(new Date().getTime() -24*60*60*1000)).replace('%',' ');
            }
            if(endTime==''||endTime==null){
                endTime=getMyDate(new Date()).replace('%',' ');
            }
            if(sellerId==''||sellerId==null){
                sellerId==0;
            }
            if(userId==''||userId==null){
                userId==0;
            }
            var result='';
            $.get('${pageContext.request.contextPath}/order/ordermanageMain?curr='+curr
                +'&startTime='+startTime+'&endTime='+endTime+'&sellerId='+sellerId+'&userId='+userId,function (data) {
                var size = data.size;
                for(var i = 0; i < size; i++){
                    var id = data.list[i].id;
                    var sellerId = data.list[i].sellerId;
                    var sellerName = data.list[i].sellerName;
                    var userId = data.list[i].userId;
                    var userName = data.list[i].userName;
                    var phone = data.list[i].phone;
                    var address = data.list[i].address;
                    var note = data.list[i].note;
                    var detail = data.list[i].detail;
                    var price = data.list[i].price;
                    var state = data.list[i].state;
                    var date = getMyDate(data.list[i].date);
                    result += '<tr><td>'+id+'</td>' +
                        '<td>'+sellerId+'</td>' +
                        '<td>'+sellerName+'</td>'+
                        '<td>'+userId+'</td>'+
                        '<td>'+userName+'</td>'+
                        '<td>'+phone+'</td>'+
                        '<td>'+address+'</td>'+
                        '<td>'+note+'</td>'+
                        '<td>'+detail+'</td>'+
                        '<td>'+price+ '</td>'+
                        '<td calss="state">'+state+'</td>'+
                        '<td>'+date+'</td>'+
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

        //页面加载绑定事件
        $(document).ready(function () {
            render(1,null,null,0,0);

            $('#addbtn').off('click').on('click',function () {
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
                                render(1);
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });


            $(document).off('click','#updatebtn').on("click",'#updatebtn',function(){
                console.log();
                var updateid = $(this).attr('updateid');
                //页面层-自定义
                //iframe层-禁滚动条
                layer.open({
                    type: 2,
                    title:'修改用户',
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
                                render(1);
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });
            $(document).off('click','#deletebtn').on("click",'#deletebtn',function () {
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
                            render(1);
                        })

                    }).error(function(data) {
                        swal("OMG", "删除操作失败了!", "error");
                    });

                });
            });

        });
        console.log($('.state'));
    });
</script>
