<%--
  Created by IntelliJ IDEA.
  User: WHW
  Date: 2021/4/10
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="{CHARSET}">
  <title>index</title>
  <style>
    body{
      font: 13px Arial,\5FAE\8F6F\96C5\9ED1,\5B8B\4F53,\65B0\5B8B\4F53,sans-serif;
    }
    .content{
      position: relative;
      margin: 100px auto;
      padding-top: 22px;
      padding-left: 20px;
      width: 520px;
      height: 370px;
      border-radius: 7px;
      background-color: #fff;
      box-shadow: 9px 9px 15px rgb(0 0 0 / 20%);
      box-sizing: border-box;
    }
    .content2{
      text-align: center;
      position: relative;
      margin: 100px auto;
      padding-top: 22px;
      padding-left: 20px;
      width: 520px;
      display: none;
    }
    .close{
      position: absolute;
      top: 8px;
      right: 7px;
      height: 14px;
      width: 14px;
      background-image: url("http://pc.woozooo.com/images/upload_cancel.gif");
      cursor: pointer;
    }
    .cont2{
      position: relative;
      width: 480px;
      height: 330px;
      border: 3px dashed #e6e6e6;
      box-sizing: border-box;
      text-align: center;
      background-color: #F7F7F7;
      z-index: 0;
    }
    .upbutton{
      user-select: none;
      position: absolute;
      top: 138px;
      left: 50%;
      transform: translateX(-50%);
      width: 118px;
      height: 38px;
      background: #209EFF;
      color: #fff;
      border-radius: 3px;
      font-size: 14px;
      line-height: 38px;
      cursor: pointer;
    }
    .upbutton2{
      display: none;
      user-select: none;
      position: absolute;
      top: 228px;
      left: 50%;
      transform: translateX(-50%);
      width: 118px;
      height: 38px;
      background: #209EFF;
      color: #fff;
      border-radius: 3px;
      font-size: 14px;
      line-height: 38px;
      cursor: pointer;
    }
    .upbutton:hover{
      background: #62BCFF;
      box-shadow: 2px 2px 1px rgb(0 0 0 / 5%);
    }
    .upbutton:active{
      background: #197CC8;
      box-shadow: 2px 2px 1px rgb(0 0 0 / 5%);
    }
    .disfile{
      display: none;
      position: relative;
      margin: 70px auto;
      width: 90%;
      height: 60px;
      background-color: #f0f0f0;
      -webkit-box-shadow: inset 0 1px 2px rgb(0 0 0 / 10%);
    }
    .title{
      position: absolute;
      margin: 0;
      padding-top: 10px;
      padding-left: 10px;
      overflow: hidden;
    }
    .fsize{
      position: absolute;
      color: #95C5A9;
      padding-left: 35px;
      overflow: hidden;
      top: 20px;
    }
    .close2{
      position: absolute;
      top: 24px;
      right: 15px;
      height: 14px;
      width: 14px;
      background-image: url("http://pc.woozooo.com/images/upload_cancel.gif");
      cursor: pointer;
    }
  </style>
  <script src="js/jquery-1.11.0.js"></script>
  <script>
    $(function(){
      $(".cont2").mouseenter(function(){
        $(this).css("background","#fff");
      });
      $(".cont2").mouseleave(function(){
        $(this).css("background","#F7F7F7");
      });
      $("#disbut").on("click", function(){
        $("#hidebut").click();
      })
      $("#hidebut").change(function() {
        $("#disbut").css("display","none");
        var file = $(this).val();
        var fileName = file.split('\\')[file.split('\\').length - 1];
        var fileSize = ($(this).prop('files')[0].size/1024/1024).toFixed(2);
        $(".title").html("<img src=\"http://pc.woozooo.com/images/filetype/zip.gif\" class=\"f_img\" align=\"absmiddle\">"+"&nbsp;"+fileName);
        $(".fsize").html(fileSize+"M");
        $("#disbut2").css("display","block");
        $(".cont2").css("background-color","#fff");
        $(".cont2").off("mouseleave");
        $(".disfile").css("display","block");
      })
      $(".close2").on("click", function (){
        $("#disbut2").css("display","none");
        $("#disbut").css("display","block");
        $(".cont2").css("background-color","#F7F7F7");
        $(".disfile").css("display","none");
        $(".cont2").mouseleave(function(){
          $(this).css("background","#F7F7F7");
        });
      })
      $("#disbut2").on("click", function (){
        $("#form").submit();
      })
      $(".close").on("click",function (){
        $(".content").css("display","none")
        $(".content2").css("display","block")
      })
    })
  </script>
</head>
<body>
<div class="content">
  <div class="close"></div>
  <div class="cont2">
    <form id="form" action="UploadServlet" enctype="multipart/form-data" method="post">
      <input id="hidebut" name="file" type="file" style="display: none;" />
    </form>
    <div class="disfile">
      <p class="title"></p>
      <p class="fsize"></p>
      <div class="close2"></div>
    </div>
    <div class="upbutton" id="disbut">点击选择文件</div>
    <div class="upbutton2" id="disbut2">点击上传</div>
  </div>
</div>
<div class="content2">
  <h3>是你自己关闭的,我没设置打开按钮,要打开自己刷新吧🙄</h3>
  <h3>Curiosity Kills the cat. To open your own refresh.(¬_¬)</h3>
</div>

</body>
</html>

