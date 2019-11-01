
window.onload = function() {
				var input = document.getElementById("upgteimg");
				var showui = document.getElementById("showui");
				var result;
				var dataArr = []; // 鍌ㄥ瓨鎵€閫夊浘鐗囩殑缁撴灉(鏂囦欢鍚嶅拰base64鏁版嵁)
				var fd; //FormData鏂瑰紡鍙戦€佽姹�
				var showinput = document.getElementById("showinput");
				var oSubmit = document.getElementById("submit");
				var dateli, dateinput;
				function randomString(len) {
					len = len || 32;
					var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'; /****榛樿鍘绘帀浜嗗鏄撴贩娣嗙殑瀛楃oOLl,9gq,Vv,Uu,I1****/
					var maxPos = $chars.length;
					var pwd = '';
					for(i = 0; i < len; i++) {
						pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
					}
					return pwd;
				}
				console.log()
				if(typeof FileReader === 'undefined') {
					alert("抱歉，你的浏览器不支持 FileReader");
					input.setAttribute('disabled', 'disabled');
				} else {
					input.addEventListener('change', readFile, false);
				}

				function readFile() {
					fd = new FormData();
					var iLen = this.files.length;
					var index = 0;
					var currentReViewImgIndex = 0;
					for(var i = 0; i < iLen; i++) {
						if(!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)) { //鍒ゆ柇涓婁紶鏂囦欢鏍煎紡
							return alert("上传的图片格式不正确，请重新选择");
						}
						var reader = new FileReader();
						reader.index = i;
						fd.append(i, this.files[i]);
						reader.readAsDataURL(this.files[i]); //杞垚base64
						reader.fileName = this.files[i].name;
						reader.files = this.files[i];
						reader.onload = function(e) {
							var imgMsg = {
								name: randomString(5), //鑾峰彇鏂囦欢鍚�
								base64: this.result, //reader.readAsDataURL鏂规硶鎵ц瀹屽悗锛宐ase64鏁版嵁鍌ㄥ瓨鍦╮eader.result閲�
							}
							dataArr.push(imgMsg);
							for(var j = 0; j < dataArr.length; j++) {
								currentReViewImgIndex = j;
							}
							result = '<div class="showdiv"><img class="left" src="images/Arrow_left.svg" /><img class="center" src="images/delete.svg" /><img class="right" src="images/Arrow_right.svg" /></div><img style="height: 100%;width: 100%" id="img' +currentReViewImgIndex+randomString(1)+randomString(2) +randomString(5) + '" class="showimg" src="' + this.result + '" />';
							var li = document.createElement('li');
							li.innerHTML = result;
							showui.appendChild(li);
							index++;
						}
					}
				}

				function onclickimg() {
					var dataArrlist = dataArr.length;
					var lilength = document.querySelectorAll('ul#showui li');
					for(var i = 0; i < lilength.length; i++) {
						lilength[i].getElementsByTagName('img')[0].onclick = function(num) {
							return function() {
								if(num == 0) {} else {
									var list = 0;
									for(var j = 0; j < dataArr.length; j++) {
										list = j;
									}
									var up = num - 1;
									dataArr.splice(up, 0, dataArr[num]);
									dataArr.splice(num + 1, 1);
									var lists = $("ul#showui li").length;
									for(var j = 0; j < lists; j++) {
										var usid = $("ul#showui li")[j].getElementsByTagName('img')[3];
										$("#" +usid.id+ "").attr("src", dataArr[j].base64);
									}
								}
							}
						}(i)
						//鍒犻櫎鍥炬爣
						lilength[i].getElementsByTagName('img')[1].onclick = function(num) {
							return function() {
								if(dataArr.length == 1) {
									dataArr = [];
									$("ul#showui").html("");
									$("#upgteimg").val("");
								} else {
									$("ul#showui li:eq(" + num + ")").remove();
									dataArr.splice(num, 1);
									
								}
								
							}
						}(i)
						//鍙崇澶村浘鏍�
						lilength[i].getElementsByTagName('img')[2].onclick = function(num) {
							return function() {
								var list = 0;
								for(var j = 0; j < dataArr.length; j++) {
									list = j;
								}
								var datalist = list + 1;
								dataArr.splice(datalist, 0, dataArr[num]);
								dataArr.splice(num, 1);
								var lists = $("ul#showui li").length;
								for(var j = 0; j < lists; j++) {
									var usid = $("ul#showui li")[j].getElementsByTagName('img')[3];
									$("#" + usid.id + "").attr("src", dataArr[j].base64);
								}

							}
						}(i);

					}
				}
				showui.addEventListener("click", function() {
					onclickimg();
				}, true)

				function send() {
					for(var j = 0; j < dataArr.length; j++) {
						console.log(dataArr[j].name);
					}
				}

				oSubmit.onclick = function() {
					if(!dataArr.length) {
						return alert('请先选择文件');
					}
					send();
				}

			}
		