<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fieldset class="layui-elem-field layui-field-title">
    <legend>用户管理</legend>
</fieldset>

<div style="text-align: right"></div>

    <div style="float: right"><button class="layui-btn layui-btn-big" id="addbtn"><i class="layui-icon">&#xe654;</i>新增</button></div>
    <div class="layui-form">
        <div style="text-align: left;width: 200px">
            <div class="" style="width: 100px">
                <input id="mysearch" type="text" lay-verify="" autocomplete="off" placeholder="搜索" class="layui-input">
            </div>
        </div>

        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="150">
                <col width="20">
            </colgroup>
            <thead>
            <tr>
                <th>用户名</th>
                <th>角色</th>
                <th>姓名</th>
                <th>手机号</th>
                <th>地址</th>
                <th>邮箱</th>
                <th>性别</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="user_list">


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

        //调用分页
        //渲染
        var render = function(curr){
            var search  = $("#mysearch")[0].value
            var result='';
            $.get('${pageContext.request.contextPath}/admin/userList?curr='+curr+'&search='+search,function (data) {
                var size = data.size;
                for(var i = 0; i < size; i++){
                    var id = data.list[i].id;
                    var userName = data.list[i].userName;
                    var role = data.list[i].role;
                    var phone = data.list[i].phone;
                    var name = data.list[i].name;
                    var address = data.list[i].address;
                    var email = data.list[i].email;
                    var sexual = data.list[i].sexual;
                    var createTime = data.list[i].createTime;
                    result += '<tr><td>'+userName+'</td>' +
                        '<td>'+role+'</td>' +'<td>'+name+'</td>'+'<td>'+phone+'</td>'+'<td>'+address+'</td>'+'<td>'+email+'</td>'+'<td>'+sexual+'</td>'+'<td>'+createTime+'</td>'+
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

        //搜索分页
        $("#mysearch").on('input',function(e){
            render(1);
        });

        //页面加载绑定事件
        $(document).ready(function () {
            render(1);
            $('#addbtn').on('click',function () {
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
                                location.reload();
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });


            $(document).on("click",'#updatebtn',function(){
                console.log();
                var updateid = $(this).attr('updateid');
                //页面层-自定义
                //iframe层-禁滚动条
                layer.open({
                    type: 2,
                    title:'新增用户',
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
                                location.reload();
                            })
                        }
                        $('#updateinfo').text(1);
                    }
                });
            });
            $(document).on("click",'#deletebtn',function () {
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
                            location.reload();
                        })

                    }).error(function(data) {
                        swal("OMG", "删除操作失败了!", "error");
                    });

                });
            });

        });
    });
</script>
