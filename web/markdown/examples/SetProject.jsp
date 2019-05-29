<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Set Project</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/editormd.css"/>
</head>
<body style="background-color:#F8F9FA;">
<form action="doSetProject.jsp" method="post" enctype="application/x-www-form-urlencoded">
    <div class="input-group mb-3 input-group-lg">
        <div class="input-group-prepend">
            <span class="input-group-text">项目名称</span>
        </div>
        <input type="text" class="form-control" placeholder="请输入" id="usr" name="projectname">
        <div class="input-group-prepend">
            <span class="input-group-text">班级</span>
        </div>
        <select class="form-control" name="classroom" required="required" >
            <option ></option>
            <option value="软工1班">软工1班</option>
            <option value="软工2班">软工2班</option>
            <option value="软工3班">软工3班</option>
            <option value="软工4班">软工4班</option>
            <option value="软工5班">软工5班</option>
            <option value="软工6班">软工6班</option>
            <option value="双学位">双学位</option>
        </select>
    </div>
    <h5>项目简介</h5>
    <div class="form-group ">
        <textarea class="form-control" rows="2" name="detail"></textarea>
    </div>
    <div class="input-group mb-3 input-group-lg">
        <div class="input-group-prepend">
            <span class="input-group-text">项目地址</span>
        </div>
        <input type="url" class="form-control" placeholder="请输入GitHub项目页面地址" name="link">
    </div>

    <h5>项目文档</h5>
    <div class="form-group">
        <div id="test-editormd">
            <textarea style="display:none;" placeholder="项目简介" name="document"></textarea>
        </div>
    </div>

    <button type="submit" class="btn btn-primary">确认提交</button>
</form>
<script src="js/jquery.min.js"></script>
<script src="../editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function () {
        testEditor = editormd("test-editormd", {
            width: "100%",
            height: 540,
            syncScrolling: "single",
            path: "../lib/"
        });
    });
</script>

</body>
</html>