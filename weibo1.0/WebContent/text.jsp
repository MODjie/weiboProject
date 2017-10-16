<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/imagediv.css" />
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script type="text/javascript">
						$(function  () {
							$("#myImg").click(function  () {
								$("#myModal").css("display","block");
								var src1 = $(this)[0].src;
								$("#img01").attr('src',src1);
								$("#caption").html($(this).alt);
							});
							$(".close").click(function  () {
								$("#myModal").css("display","none");
							})
						})
//			function onload1() {
//				// 获取弹窗
//				var modal = document.getElementById('myModal');
//
//				// 获取图片插入到弹窗 - 使用 "alt" 属性作为文本部分的内容
//				var img = document.getElementById('myImg');
//				var modalImg = document.getElementById("img01");
//				var captionText = document.getElementById("caption");
//				img.onclick = function() {
//					modal.style.display = "block";
//					modalImg.src = this.src;
//					captionText.innerHTML = this.alt;
//				}
//
//				// 获取 <span> 元素，设置关闭按钮
//				var span = document.getElementsByClassName("close")[0];
//
//				// 当点击 (x), 关闭弹窗
//				span.onclick = function() {
//					modal.style.display = "none";
//				}
//			}
		</script>
	</head>

	<body onload="">
		<!-- 触发弹窗 - 图片改为你的图片地址 -->
		<img id="myImg" src="http://127.0.0.1:8020/WeiBoProject/img/body_bg.jpg" alt="文本描述信息" width="300" height="200">

		<!-- 弹窗 -->
		<div id="myModal" class="modal">

			<!-- 关闭按钮 -->
			<span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>

			<!-- 弹窗内容 -->
			<img class="modal-content" id="img01">

			<!-- 文本描述 -->
			<div id="caption"></div>
		</div>
	</body>

</html>