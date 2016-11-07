

			
		$(document).ready(function(){
					bindPlayer();	
					playCSS();
		});


		//绑定播放器
		function bindPlayer()	{
			//点击播放音乐
			$(".items").click(function(){

				var title = $(this).attr("title");
				var url = $(this).data("url");
				var singer = $(this).attr("singer");
				audioDom = window.parent.frames['player'].createMp3(url, title, singer);
				audioDom.play();
				isExist(title, url, singer);
			});
			
			//添加歌曲
			$(".add").click(function(){
				var title = $(this).attr("title");
				var url = $(this).data("url");
				var singer = $(this).attr("singer");
				isExist(title, url, singer);
			});
			
			//收藏歌曲
			$(".love").click(function(){
				var userid = window.parent.parent.$("#userid").val();
				var musicid = $(this).attr("musicid");
				var islove = $(this).attr("islove");
				if( userid == null || userid == "" ) {
					window.confirm("请登录后操作");
					return false;
				}
				if(islove == 0) {	//收藏
					$(this).css("background-position", "0 -130px");
					$(this).attr("islove", "1");
					url = getRootPath_web();
					$.ajax({
						url: url +"/user/collectMusic",
						data: {"userid":userid,"musicid":musicid },
						success:function() {}						
					});
				}else {	//取消收藏 
					
					$(this).css("background-position", "-28 -130px");
					$(this).attr("islove", "0");
					url = getRootPath_web();
					$.ajax({
						url: url +"/user/cancelCollectMusic",
						data: {"userid":userid,"musicid":musicid },
						success:function() {}
					});
				}
				
			});
		}

		//获取当前项目地址
		function getRootPath_web() {
		    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		    var curWwwPath = window.document.location.href;
		    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		    var pathName = window.document.location.pathname;
		    var pos = curWwwPath.indexOf(pathName);
		    //获取主机地址，如： http://localhost:8083
		    var localhostPath = curWwwPath.substring(0, pos);
		    //获取带"/"的项目名，如：/uimcardprj
		    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		    return projectName;
		}
		
		
		//歌曲是否存在
		function isExist(title, url, singer) {
			var hs = false;	//委托是否存在
			var playlist;	//播放列表
			if(getCookie("playlist") == null) {
				playlist = [];
			}else {
				var str = getCookie("playlist");
				//转换成对象
				playlist = eval('(' + decodeURI(str) + ')');
			}
			//创建播放列表
			for(var i=0; i<playlist.length; i++) {
				if(title == playlist[i].title) {
					hs = true;
					break;
				}
			}	
			if(!hs) {
				//不存在则添加
				playlist.push({"title" : title, "url" : url, "singer": singer})
				//同时写入cookie中
				setCookie("playlist",  JSON.stringify(playlist));
				//alert(getCookie("playlist"));
				//bindPlayer();
			}
			
		}
		
		//加载播放列表
		function loadPlaylist() {
			var htm;
			//判断cookie中是否包含播放列表
			if(getCookie("playlist") != null && getCookie("playlist") != ""){	//有播放列表
				//将cookie中列表
				var str = getCookie("playlist");
				//转换成对象
				playlist = eval('(' + decodeURI(str) + ')');
				htm = "<table class=\"table\">";
				//循环添加到播放列表box
				for(var i = 0;i < playlist.length;i ++){
					htm += "<tr><td><a href=\"javascript:void(0);\" class=\"items\" title=\"" + playlist[i].title + "\" data-url=\"" + playlist[i].url + "\" singer=\"" +playlist[i].singer+ "\">" + playlist[i].title + "</a></td></tr>";	
				}
	 			htm += "<tr><td><span>共:" + playlist.length +"首歌曲</span></td></tr>";
				htm += "</table>";	
				//bindPlayer();
			}else {		//无播放列表
				htm = "播放列表没歌曲哦，赶紧去添加吧";
			}
			
		
			$(".box").html(htm);
			//绑定播放事件
			bindPlayer();
		}
		
		
		//更改播放样式
		 function playCSS() {
			 if(window.parent.frames['player'].$(".playBtn").attr("isplay") == 0) {
				$(".iplay").css("background", 'url(/GraduateDesign/images/T1bMh.FxNXXXb_r3IF-72-730.png) 0 -358px');
			 }else {
				 url = getRootPath_web();
				 //url = url + "/images/T1oHFEFwGeXXXYdLba-18-18.gif";
				 $(".iplay").css("background",'url(/GraduateDesign/images/T1oHFEFwGeXXXYdLba-18-18.gif) 0 0'); 
			 }
			
		 }
		
		