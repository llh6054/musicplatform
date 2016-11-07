
//cookie操作
		function setCookie(name, value) {
		    var hours = 2;
		    var exp = new Date();
		    exp.setTime(exp.getTime() + hours * 60 * 60 * 1000);
		    document.cookie = name + "=" + encodeURI(value) + ";expires=" + exp.toGMTString() + ";path=/" ;
		}
		
		function getCookie(name) {
		    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
		    if (arr = document.cookie.match(reg))
		        return (decodeURI(arr[2]));
		    else
		        return null;
		}
		
		function delCookie(name) {
		    var exp = new Date();
		    exp.setTime(exp.getTime() - 1);
		    var cval = getCookie(name);
		    if (cval != null)
		        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
		}