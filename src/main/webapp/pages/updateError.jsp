<%--
  Created by IntelliJ IDEA.
  User: 12845
  Date: 2019/11/21
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center" style="background-color: red">
    <h2>信息更新失败，请重试或联系管理员</h2>
</div>
<div align="center" style="background-color: blue">
    <p id="page_div" >将在5秒后自动跳转回到首页....</p>
</div>


<script language="javascript">
    var num = 4; //倒计时的秒数
    var URL = "/customer/main.action";
    var id = window.setInterval('doUpdate()', 1000);
    function doUpdate() {
        document.getElementById('page_div').innerHTML = '将在'+num+'秒后自动跳转到首页' ;
        if(num == 0) {
            window.clearInterval(id);
            window.location = URL;
        }
        num --;
    }
</script>
</body>
</html>


