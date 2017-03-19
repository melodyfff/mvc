<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/jquery.form/3.24/jquery.form.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/toastr.js/2.1.3/toastr.min.js"></script>
    <link href="http://cdn.bootcss.com/toastr.js/2.1.3/toastr.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link type="image/x-icon" rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />

    <%--分页--%>
    <%--样式--%>
    <link href="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.css" rel="stylesheet"/>
    <script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.js"></script>
    <%--国际化，表格汉化--%>
    <script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.9.0/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.9.0/extensions/editable/bootstrap-table-editable.min.js"></script>
    <script src="//cdn.bootcss.com/TableExport/3.3.7/js/tableexport.min.js"></script>
    <style>
        h1{text-align: center}
        p{color:red}
    </style>



    <script>
        //初始化警告框位置
        toastr.options.positionClass = 'toast-top-center';

        $(document).ready(function () {
            $('#sub').click(function () {
                var option = {
                    url:"${pageContext.request.contextPath}/person/postForm",
                    type:"post",
                    dataType:"JSON",
                    data:$('#myForm').serialize(),
                    success:function(result){
                        toastr.info("OK");
                       console.log(result)
                    },
                    error:function (result) {
                        toastr.error("NO");
                    }

                }
                console.log(option.data);
                console.log(option);
                $.ajax(option);
                return false;
            });

            $('#postSub').click(function () {
                $.post(
                    "${pageContext.request.contextPath}/person/postForm",
                    $('#myForm').serialize(),
                    function (data) {
                        if (data.name != null && data.name != ""){
                            toastr.info("OK"+data.name);
                            console.log(data);
                        }
                        else {toastr.error("NO");}
                    }
                );
            });

            $('#getJson').click(function () {
                $.getJSON("${pageContext.request.contextPath}/person/getJson",function (data) {
                    if (isEmptyObject(data)){
                        toastr.error("NO");

                    }else{
                        toastr.info("OK"+JSON.stringify(data));
                        console.log(data);
                    }
                });
            });

            function isEmptyObject(e) {
                var t;
                for (t in e)
                    return !1;
                return !0
            }

            $('#modeltest').click(function () {
                $.getJSON("${pageContext.request.contextPath}/person/getJson",function (data) {
                    if (isEmptyObject(data)){
                        toastr.error("NO");

                    }else{
                        toastr.info("OK"+JSON.stringify(data));
                        $('.bg-success').text(JSON.stringify(data));
                        console.log(data);
                    }
                });
            });
//            console.log(isEmptyObject());           //true
//            console.log(isEmptyObject({}));         //true
//            console.log(isEmptyObject(null));       //true
//            console.log(isEmptyObject(23));         //true
//            console.log(isEmptyObject({"te": 2}));      //false

        });
    </script>
</head>
<body>
<h1>异步传值</h1>
<div class="container">
    <div class="row">
        <form id="myForm">
            <div class="form-group">
            <label >
                姓名：
                <input type="text" name="name" id="name" class="form-control">
                <span id="span_name"></span>
            </label>
            </div>
            <div class="form-group">
            <label >
                年纪：
                <input type="text" name="age" id="age" class="form-control">
                <span id="span_age"></span>
            </label>
            </div>
        </form>
        <p>$.ajax传值</p>
        <button type="button" class="btn btn-info" id="sub" >$.ajax提交</button>
        <p>$.post传值</p>
        <button type="button" class="btn btn-info" id="postSub">post提交</button>
        <p>.getJSON(url, [data], [callback])</p>
        <button type="button" class="btn btn-info" id="getJson">getJSON取值</button>

    </div>
    <div class="row">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
            模块
        </button>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                        <h4 class="modal-title" id="myModalLabel">模块框</h4>
                    </div>
                    <div class="modal-body">
                        <p>
                            <button type="button" class="btn btn-primary btn-sm" id = "modeltest">getjson</button>
                             <p class="bg-success"></p>
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary">保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <table id="exampleToolbar" data-toggle="table">
            <thead>
            </thead>
        </table>
    </div>

    <div>
        <form class="form-inline" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/person/fileUpload" method="post">
            <h1>采用multipart提供的file.transfer方法上传文件</h1>
            <input type="file" name="fileUp">
            <input type="submit">
        </form>
    </div>

    <div>
        <form class="form-inline" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/person/fileUpload2" method="post">
            <h1>采用流的方式上传文件</h1>
            <input type="file" name="file">
            <input type="submit">
        </form>
    </div>

    <div>
        <form class="form-inline" role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/person/springUpload" method="post">
            <h1>使用spring mvc提供的类的方法上传文件</h1>
            <input type="file" name="fileUp">
            <input type="submit">
        </form>
    </div>
</div>

<%--分页--%>
<script>
    var $table = $('#exampleToolbar');
    $table.bootstrapTable({
        url: "${pageContext.request.contextPath}/person/page",//具体请求地址
        method: 'post',//请求方式
        striped: true,                      //是否显示行间隔色

        pagination:true,                  //是否显示分页（*）

        cache: false,                      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        clickToSelect: true,                //是否启用点击选中行
        cardView: true,                    //是否显示详细视图

        showPaginationSwitch:true,			// 隐藏/显示分页
        showExport: true,                     //是否显示导出
        showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
        showRefresh: true,//是否显示刷新框
        showColumns: true,//是否显示columns按钮
        showFooter:false,					//True to show the summary footer row.
        search: true,//是否开启搜索框
        sortable: true,                     //是否启用排序
        sidePagination: "server",          //分页方式：client客户端分页，server服务端分页（*）
        singleSelect :false,				//只允许选中一个


        checkboxHeader:true,				//头部选取所有数据开关
        maintainSelected:false,				//True to maintain selected rows on change page and search.

        detailView: true,                   //是否显示父子表 True to show detail view table.
        sortOrder: "asc",                   //排序方式


        exportDataType: "basic",              //basic', 'all', 'selected'.
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表

        queryParams: queryParams,//传递参数（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                      //每页的记录行数（*）
        pageList:[5,10,25],        //可供选择的每页的行数（*）

        toolbar: "#exampleToolbar",//对用的toolbar
        iconsPrefix:'glyphicon', //Defines icon set name ('glyphicon' or 'fa' for FontAwesome). By default 'glyphicon' is used.
        icons: {paginationSwitchDown: 'glyphicon-collapse-down icon-chevron-down',
            paginationSwitchUp: 'glyphicon-collapse-up icon-chevron-up',
            refresh: 'glyphicon-refresh icon-refresh',
            toggle: 'glyphicon-list-alt icon-list-alt',
            columns: 'glyphicon-th icon-th',
            detailOpen: 'glyphicon-plus icon-plus',
            detailClose: 'glyphicon-minus icon-minus',
            export: ' glyphicon-export icon-share'},//对应按钮对应的字体图标
        uniqueId: "ID",//主键id

        columns: [{
            field: 'cheick',
            title: '选择',
            checkbox: true
        },{
            field: 'id',
            title: 'ID',
            sortable: true
        },{
            field: 'name',
            title: '用户名',
            sortable: true
        },{
            field: 'age',
            title: '年纪'
        }]

    });

    //表参数传递
    function queryParams(params) {
        return {
            limit:params.limit,//每页数据条数
            offset:params.offset,//当前页偏移
            order:params.order,//排序
            ordername:params.sort,//需要排序的字段
            search:params.search//搜索的字段

        };
    }

</script>
</body>
</html>
