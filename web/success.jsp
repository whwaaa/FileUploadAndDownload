<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background-color: #fff;
            z-index: 0;
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
        .upbutton{
            user-select: none;
            position: relative;
            margin-top: 10px;
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
        .upbuttonNoImg{
            margin-top: 50px;
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
            position: relative;
            margin: 25px auto 0 auto;
            width: 90%;
            height: 60px;
            background-color: #f0f0f0;
            -webkit-box-shadow: inset 0 1px 2px rgb(0 0 0 / 10%);
        }
        .disfileNoImg{
            margin: 80px auto 0 auto;
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
        .disimg{
            width: 90%;
            height: 180px;
            margin: 0 auto;
        }
        .fileimg{
            height: 180px;
            width: 100%;
            background-repeat: repeat;
        }
        #inputfile{
            width: 90%;
            height: 40px;
            margin-top: 60px;
            margin-left: 22px;
        }
    </style>
    <script src="js/jquery-1.11.0.js"></script>
    <script>
        $(function(){
            $("#disbut").on("click", function (){
                $("#form").submit();
            })
            $(".close2").on("click", function (){
                $("#inputfile").css("display","block");
                $(".disfile").css("display","none");
                $(".disimg").css("display","none");
                $(".upbutton ").css("margin-top","70px");
            })
            $(".close").on("click",function (){
                $(".content2").css("display","block");
                $(".content").css("display","none");
            })
        })
    </script>
</head>
<body>
<div class="content">
    <div class="close"></div>
    <div class="cont2">
        <form id="form" action="DownloadServlet" method="post">
            <input id="inputfile" name="fileName" type="text" style="display: none;" value="${fileName}" placeholder="输入需要下载的文件名称" />
        </form>
        <c:choose>
            <c:when test="${fileType eq 'image'}">    <!--如果 -->
                <div class="disfile">
                    <p class="title">
                        <img src="http://pc.woozooo.com/images/filetype/zip.gif" align="absmiddle">&nbsp;${fileName}
                    </p>
                    <p class="fsize">${fileSize}</p>
                    <div class="close2"></div>
                </div>
                <div class="disimg">
                    <img class="fileimg" src="uploadfiles/${fileName}" alt="" >
                </div>
                <div class="upbutton" id="disbut">点击下载</div>
            </c:when>

            <c:otherwise>  <!--否则 -->
                <div class="disfile disfileNoImg">
                    <p class="title">
                        <img src="http://pc.woozooo.com/images/filetype/zip.gif" align="absmiddle">
                        &nbsp;${fileName}
                    </p>
                    <p class="fsize">${fileSize}</p>
                    <div class="close2"></div>
                </div>
                <div class="upbutton upbuttonNoImg" id="disbut">点击下载</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="content2">
    <img src="https://img9.doubanio.com/view/richtext/large/public/p34622266.jpg" alt="">
</div>

</body>
</html>

