<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fieldset class="layui-elem-field layui-field-title">
    <legend>商家管理</legend>
</fieldset>

<div style="text-align: right"></div>

<div class="layui-form">
    <div style="text-align: left;width: 200px">
        <div class="" style="width: 100px">
            <input id="sellersearch" type="text" lay-verify="" autocomplete="off" placeholder="搜索" class="layui-input">
        </div>
    </div>

    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="100">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="150">
            <col width="200">
        </colgroup>
        <thead>
        <tr>
            <th>商铺名</th>
            <th>商家图片地址</th>
            <th>送达时间</th>
            <th>起送价格</th>
            <th>配送费</th>
            <th>评分</th>
            <th>成立时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="seller_list">


        </tbody>
    </table>
</div>
<div id="demo8" style="text-align:center"></div>
<script>
    layui.use(['layer', 'form','laypage'] ,function () {
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
        var render = function(curr){
            var search  = $("#sellersearch")[0].value
            var result='';
            $.get('${pageContext.request.contextPath}/admin/sellerList?curr='+curr+'&search='+search,function (data) {
                var size = data.size;
                for(var i = 0; i < size; i++){
                    var id = data.list[i].id;
                    var sellerId = data.list[i].sellerId;
                    var sellerName = data.list[i].sellerName;
                    var sellerLogo = data.list[i].sellerLogo;
                    var sendTime = data.list[i].sendTime;
                    var startPrice = data.list[i].startPrice;
                    var sendPrice = data.list[i].sendPrice;
                    var scoreNum = data.list[i].scoreNum;
                    var createTime = getMyDate(data.list[i].createTime);
                    result += '<tr><td>'+sellerName+'</td>' +
                        '<td>'+sellerLogo+'</td>' +'<td>'+sendTime+'分钟</td>'+'<td>￥'+startPrice+'</td>'+'<td>￥'+sendPrice+'</td>'+'<td>'+scoreNum+'</td>'+'<td>'+createTime+'</td>'+
                        '<td style="text-align: center"><button class="layui-btn layui-btn-normal layui-btn-small" id="sellerupdatebtn" updateid="'+sellerId+'">修改<i class="layui-icon"></i></button>' +
                        '<button class="layui-btn layui-btn-danger layui-btn-small" id="sellerdeletebtn" deleteid="'+sellerId+'">删除<i class="layui-icon"></i></button></td></tr>';
                }
                document.getElementById('seller_list').innerHTML =result;
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

        //搜索分页
        $("#sellersearch").on('input',function(e){
            render(1);
        });

        //页面加载绑定事件
        $(document).ready(function () {
            render(1);
            $(document).off('click','#sellerupdatebtn').on("click",'#sellerupdatebtn',function(){
                console.log('进入修改');
                var updateid = $(this).attr('updateid');
                //页面层-自定义
                //iframe层-禁滚动条
                layer.open({
                    type: 2,
                    title:'修改商户',
                    area: ['800px','60%'],
                    skin: 'layui-layer-rim', //加上边框
                    content: ['${pageContext.request.contextPath}/admin/updatesellerpage?updateid='+updateid],
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
            $(document).off('click','#sellerdeletebtn').on("click",'#sellerdeletebtn',function () {
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

                        url: "${pageContext.request.contextPath}/admin/deleteseller?deleteid="+id,

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
    });
</script>
