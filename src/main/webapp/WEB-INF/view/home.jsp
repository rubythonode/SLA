<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>YOG.IO!</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${pageContext.request.contextPath}/script/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/script/js.js"></script>
		<style>
			#wrapper {
				margin: auto;
				width: 600px;
				padding-top: 30px;
			}
			.layer {
				height: 150px;
			}
			.layer h3 {
				margin: 0;
				padding: 0;
				font-size: 16px;
				font-weight: bold;
				color: #fff;
				text-shadow: #000 0px 1px 2px;
			}
			.layer p {
				margin: 4px 0 10px 0;
				padding: 0;
				font-size: 16px;
				color: #fff;
				text-shadow: #000 0px 1px 2px;
			}
			.layer-inner {
				padding: 10px;
			}
			.layer-inner .button {
				display: inline-block;
				outline: none;
				cursor: pointer;
				text-align: center;
				text-decoration: none;
				font: 14px/100% Arial, Helvetica, sans-serif;
				padding: .5em 2em .55em;
				text-shadow: 0 1px 1px rgba(0,0,0,.3);
				-webkit-border-radius: .5em;
				-moz-border-radius: .5em;
				border-radius: .5em;
				-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
				-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
				box-shadow: 0 1px 2px rgba(0,0,0,.2);
			}
			.layer-inner .button:hover {
				text-decoration: none;
			}
			.layer-inner .button:active {
				position: relative;
				top: 1px;
			}
			.button.orange {
				color: #fef4e9;
				border: solid 1px #da7c0c;
				background: #f78d1d;
				background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
				background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
				filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
			}
			.button.orange:hover {
				background: #f47c20;
				background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
				background: -moz-linear-gradient(top,  #f88e11,  #f06015);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
			}
			.button.orange:active {
				color: #fcd3a5;
				background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
				background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
			}
			#header {
				height: 32px;
			}
			#logo {
				float: left;
			}
			#logo img {
				border: none;
			}
			#go-intro {
				font-size: 12px;
				color: blue;
			}
			#share-form {
				clear: both;
				border-radius: .5em;
				background-color: #33BCEF;
				background-image: -webkit-linear-gradient(top, #18AAE0, #33BCEF);
				background-repeat: repeat-x;
				margin-top: 4px;
				margin-bottom: 8px;
			}
			#share-form p {
				margin: 0;
				padding: 10px 10px 0 10px;
				font-size: 12px;
				color: #FFF;
			}
			#share-form form {
				padding: 10px;
				overflow: auto;
			}
			#share-form .url {
				float: left;
				margin: 0;
				border: solid 1px #EEE;
				border-radius: .3em;
				background-color: #FFF;
				padding: 5px;
				width: 470px;
				font-size: 15px;
				font-weight: bold;
			}
			#share-form .submit {
				float: right;
				margin: 0;
				cursor: pointer;
				border-radius: .3em;
				background-color: #FFF;
				padding: 5px;
				font-size: 15px;
				font-weight: bold;
				width: 80px;
			}
			#share-form .submit {
				color: #fef4e9;
				border: solid 1px #da7c0c;
				background: #f78d1d;
				background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
				background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
				filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
			}
			#share-form .submit:hover {
				background: #f47c20;
				background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
				background: -moz-linear-gradient(top,  #f88e11,  #f06015);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
			}
			#share-form .submit:active {
				color: #fcd3a5;
				background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
				background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
			}
			#go-analyze-result {
				margin-top: -2px;
				float: right;
				-webkit-appearance: none;
				-webkit-border-horizontal-spacing: 0px;
				-webkit-border-image: none;
				-webkit-border-vertical-spacing: 0px;
				-webkit-box-align: center;
				-webkit-box-shadow: white 0px 1px 0px 0px;
				background-color: #019AD2;
				background-image: -webkit-linear-gradient(top, #33BCEF, #019AD2);
				background-repeat: repeat-x;
				border-bottom-color: #057ED0;
				border-radius: .5em;
				border-bottom-style: solid;
				border-bottom-width: 1px;
				border-collapse: collapse;
				border-left-color: #057ED0;
				border-left-style: solid;
				border-left-width: 1px;
				border-right-color: #057ED0;
				border-right-style: solid;
				border-right-width: 1px;
				border-top-color: #057ED0;
				border-top-style: solid;
				border-top-width: 1px;
				box-shadow: white 0px 1px 0px 0px;
				box-sizing: border-box;
				color: white;
				cursor: pointer;
				display: block;
				float: right;
				font-size: 13px;
				font-weight: bold;
				height: 30px;
				letter-spacing: normal;
				line-height: 18px;
				margin-bottom: 0px;
				margin-left: 0px;
				margin-right: 0px;
				overflow-x: visible;
				overflow-y: visible;
				padding: .45em 2em .55em;
				position: relative;
				text-align: center;
				text-decoration: none;
				font: Arial, Helvetica, sans-serif;
				text-shadow: 0 1px 1px rgba(0,0,0,.3);
			}
			#yogio-intro {
				background-image: url(${pageContext.request.contextPath}/img/intro.jpg);
				border-radius: .5em .5em 0 0;
			}
			#attach-button-intro {
				background-image: url(${pageContext.request.contextPath}/img/share.jpg);
				color: #FFF;
			}
			#attach-button-intro .code {
				margin: 0;
			}
			#create-page-intro {
				background-image: url(${pageContext.request.contextPath}/img/page.jpg);
				border-radius: 0 0 .5em .5em;
				text-align: right;
			}
			#footer {
				padding: 10px;
				font-size: 11px;
				text-align: center;
				color: #999;
				margin-bottom: 50px;
			}
			#footer .left {
				float: left;
				margin-right: 10px;
			}
			#footer .right {
				float: right;
			}
			#footer a {
				color: #999;
			}
		</style>
	</head>
	
	<body>
	
		<div id="wrapper">
			<div id="header">
				<a id="logo" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
				<a id="go-analyze-result" href="${pageContext.request.contextPath}/func/myanalyze">분석 결과 보기</a>
			</div>
			<div id="share-form">
				<p>
					내가 공유한 링크를 얼마나 많은 사람이 눌렀는지 알고싶다면?
				</p>
				<form action="${pageContext.request.contextPath}/func/share" onsubmit="OPEN_YOGIO_WIN();" target="YOGIO_WIN">
					<input class="url" name="url" placeholder="http:// 공유할 주소를 입력해주세요.">
					<input class="submit" type="submit" value="공유">
				</form>
				<p style="font-size:11pt">
					현재<b>${userCount }</b>명의 사용자가 <b>${shareCount }</b>건의 링크를 공유하고 있습니다! 지금 참여해보세요!
				</p>
			</div>
			<div id="yogio-intro" class="layer">
				<div class="layer-inner">
					<h3>환영합니다.</h3>
					<p>
						YOG.IO!는 소셜 네트워크에 쉽게 링크를 공유할 수 있고, 공유된 링크의 영향력에 대한 분석 결과를 제공하는 서비스입니다.
					</p>
					<a id="go-intro" href="${pageContext.request.contextPath}/func/intro">자세히...</a>
				</div>
			</div>
			<div id="attach-button-intro" class="layer">
				<div class="layer-inner">
					<h3>사이트에 공유버튼을 달아보세요.</h3>
					<p>
						사이트나 블로그에 YOG.IO! 공유하기 버튼을 달 수 있습니다.
					</p>
					<a href="${pageContext.request.contextPath}/func/button/intro" class="button orange">자세히 보기</a>
				</div>
			</div>
			<div id="create-page-intro" class="layer">
				<div class="layer-inner">
					<h3>사이트가 없다면 페이지를 만들어보세요.</h3>
					<p>
						이벤트 페이지나, 모임 공지등을 만들때에 유용합니다.
					</p>
					<a href="${pageContext.request.contextPath}/func/page/create" class="button orange">페이지 만들기</a>
				</div>
			</div>
			<div id="footer">
				<div class="left">
					<script>YOGIO();</script>
				</div>
				<div class="left">
					피드백은 mr@hanul.co 로 부탁드립니다~^^!
				</div>
				<div class="right">
					&copy; <a href="http://swmaestro.kr" target="_blank">SW Maestro</a> 3rd <a href="${pageContext.request.contextPath}/func/sla/intro">SLA팀</a>
				</div>
			</div>
		</div>
		
	</body>
</html>
