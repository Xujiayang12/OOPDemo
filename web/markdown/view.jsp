<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>md</title>
    <link rel="stylesheet" href="css/editormd.preview.css" />
    <script src="src/jquery.min.js"></script>
    <script src="lib/marked.min.js"></script>
    <script src="lib/prettify.min.js"></script>
    <script src="lib/raphael.min.js"></script>
    <script src="lib/underscore.min.js"></script>
    <script src="lib/sequence-diagram.min.js"></script>
    <script src="lib/flowchart.min.js"></script>
    <script src="lib/jquery.flowchart.min.js"></script>
    <script src="editormd.min.js"></script>
</head>
<body>
<div id="doc-content">
    <textarea style="display:none;" placeholder="markdown语言"># 1<br/># 22
</textarea>
</div>

<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tocm: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true
        });});
</script>
</body>
</html>

