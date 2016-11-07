//创建一个Mp3播放器
		
	
	var audioDom = document.createElement("audio");
	var index = 0;
//	var str =getCookie("playlist");
//	var playlist = eval('(' + decodeURI(str) + ')');	//	播放列表
	$(document).ready(function(){
			audioDom.addEventListener('timeupdate',updateProgress,false);	
			
			$(".playBtn").click(function(){
				if($(".playBtn").attr("isplay") == 0) {
					$(".playBtn").css("background-position","0 -30px");
					$(".playBtn").attr("isplay","1");
					window.parent.frames["music"].$(".iplay").css("background",'url(/GraduateDesign/images/T1oHFEFwGeXXXYdLba-18-18.gif) 0 0'); 
					audioDom.play();//播放
				}else {
					$(".playBtn").css("background-position","0 0px");
					$(".playBtn").attr("isplay","0");
					window.parent.frames["music"].$(".iplay").css("background", 'url(/GraduateDesign/images/T1bMh.FxNXXXb_r3IF-72-730.png) 0 -358px');
					audioDom.pause();//暂停
				}
				
			});
	
			
			//上一曲
			$(".prevBtn").click(function(){
				var str =getCookie("playlist");
				var playlist = eval('(' + decodeURI(str) + ')');
				var length = playlist.length;
				if(index == -1) {		//没有播放列表
					return;
				}else {
					if(length > 1){  //一首以上才切
						if(index != 0) {	//不是第一曲
							index = index - 1;
						}else {	//第一曲
							index = length;
						}
					}
				}
				createMp3(playlist[index].url, playlist[index].title, playlist[index].singer);
			});
	
			//下一曲
			$(".nextBtn").click(function(){
				var str =getCookie("playlist");
				var playlist = eval('(' + decodeURI(str) + ')');
				if(index == -1) {
					return; //没有播放列表
				}else {
					if(playlist.length > 1)  {	//一首以上才切
						if(index != playlist.length-1) {	//不是最后一首
							index = index + 1;
						} else {	//最后一首
							index = 0;
						}
					}
				}
				createMp3(playlist[index].url, playlist[index].title, playlist[index].singer);
			});
			
			/*底部进度条控制*/
			$( ".dian" ).draggable({ 
				containment:".pro2",
				drag: function() {
					var l=$(".dian").css("left");
					var le = parseInt(l);
					audioDom.currentTime = audioDom.duration*(le/660);
		      	}
			});
			
			/*音量控制*/
			$( ".dian2" ).draggable({ 
				containment:".volControl",
				drag: function() {
					var l=$(".dian2").css("left");
					var le = parseInt(l);
					audioDom.volume=(le/80);
		      }
			});
	});
	
			//创建一个播放器
		function createMp3(src, title, singer){
			audioDom.src = src;
			//把播放器放入div盒子中
			document.getElementById("audiobox").innerHTML= "";
			document.getElementById("audiobox").appendChild(audioDom);
			//同步播放器的文字和图片
			$("#songName").text(title);
			$("#singerName").text(singer);
			$(".playBtn").css("background-position","0 -30px");
			$(".playBtn").attr("isplay","1");
			audioDom.play();
			getMusicIndex(src);
			return audioDom;
		}
		
		
		//歌曲时间
		function updateProgress(ev){
			/*显示歌曲总长度*/
			var songTime = calcTime(Math.floor(audioDom.duration));
			$(".duration").html(songTime);
			/*显示歌曲当前时间*/
			var curTime = calcTime(Math.floor(audioDom.currentTime));
			$(".position").html(curTime);
			/*进度条*/
			var lef = document.getElementById("pro2").offsetWidth*(Math.floor(audioDom.currentTime)/Math.floor(audioDom.duration));	//678?
			var llef = Math.floor(lef).toString()+"px";
			$(".dian").css("left",llef);
		}
		
		//时间计算
		function calcTime(time){
			var hour;         	var minute;    	var second;
			hour = String ( parseInt ( time / 3600 , 10 ));
			if (hour.length ==1 )   hour='0'+hour;
			minute=String(parseInt((time%3600)/60,10));
			if(minute.length==1) minute='0'+minute;
			second=String(parseInt(time%60,10));
			if(second.length==1)second='0'+second;
			return minute+":"+second;
		}
		
		//获取当前播放 歌曲下标
		function getMusicIndex(url) {
			var str =getCookie("playlist");
			var playlist = eval('(' + decodeURI(str) + ')');
			if(str == "" || str == null) { //无播放列表
				index = -1;
			}else {	//			有播放列表
				for(var i=0; i<playlist.length; i++) {
					if(playlist[i].url == url) {
						 index =  i;
							break;
					}
				}
			}
		}
		
	/*play end*/
		