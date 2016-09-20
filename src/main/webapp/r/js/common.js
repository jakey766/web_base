/**
 * 通用工具/方法	jiangkunpeng
 */

/**
 * 在字符串前后拼字符
 * @param str 目标字符串
 * @param char 要拼接的字符,默认为','
 */
var appendChar = function(str, char){
	if(typeof(str)=='undefined'||str==null||str=='')
		return str;
	if(typeof(char)=='undefined'||char==null||char=='')
		char = ',';
	if(str.charAt(0)!=char)
		str = char + str;
	var len = str.length;
	if(str.substring(len-1, len)!=char)
		str += char;
	return str;
};

/**
 * 将字符串前后的字符拆除
 * @param str 目标字符串
 * @param char 要拆除的字符,默认为','
 */
var trimChar = function(str, char){
	if(typeof(str)=='undefined'||str==null||str=='')
		return '';
	if(typeof(char)=='undefined'||char==null||char=='')
		char = ',';
	var len = str.length;
	if(str.substring(len-1, len)==char)
		str = str.substring(0, len-1);
	if(str.charAt(0)==char)
		str = str.substring(1);
	return str;
};

//时间工具
var DateTools = {
	//快速时间段变更事件
	fastTimeChange: function(element, startInput, endInput, callback){
		var val = element.value;
		if(val!=''&&val!=0){
			this.fastTimeSelect(startInput, endInput, val);
			if(callback){
				callback.call();
			}
		}
	},
	//快速选择时间段
	fastTimeSelect: function(startInput, endInput, disMinute){
		startInput.val(this.getTimeStr(disMinute));
		endInput.val(this.getTimeStr());
	},
	//时间控件时间向前、向后滚动一个周期
	fastTimeScroll: function(startInput, endInput, flag){
		var stimeStr = startInput.val();
		var etimeStr = endInput.val();
		if(stimeStr!=''&&etimeStr!=''){
			var stime = this.str2long(stimeStr);
			var etime = this.str2long(etimeStr);
			var period = etime - stime;
			stime = stime + flag * period;
			etime = etime + flag * period;
			startInput.val(this.time2str(new Date(stime)));
			endInput.val(this.time2str(new Date(etime)));
		}
	},
	getTimeStr: function(disMinute){
		var D = new Date();
		if(disMinute!=undefined&&disMinute!=0)
			D = new Date(D.getTime()-disMinute*60000);
		var date = D.getDate(), month = D.getMonth()+1, year = D.getFullYear();
		var h = D.getHours(), m = D.getMinutes(), s = D.getSeconds();
		return year + '-' + this.checkTime(month) + '-' + this.checkTime(date) + ' ' + this.checkTime(h) + ':' + this.checkTime(m) + ':' + this.checkTime(s);
	},
	checkTime: function(i){
		if (i<10) i="0" + i;
		return i;
	},
	refreshTimer: function(ele, sele){
		var eleObj = $('#'+ele);
		var etimeStr = $.trim(eleObj.val());
		var etime = etimeStr.replace(/-/ig,'/');
		var edate = new Date(etime);
		var now = new Date();
		var lnow = now.getTime();
		lnow = parseInt(lnow/60000)*60000-60000;
		now = new Date(lnow);
		if(edate < now){
			var nowStr = now.getFullYear()+'-'+this.checkTime(now.getMonth()+1)+'-'+this.checkTime(now.getDate())+' '+this.checkTime(now.getHours())+':'+this.checkTime(now.getMinutes())+':'+this.checkTime(now.getSeconds());
			eleObj.val(nowStr);
		}
		if(typeof(sele)!='undefined'){
			var seleObj = $('#'+sele);
			var stimeStr = $.trim(seleObj.val());
			var stime = stimeStr.replace(/-/ig,'/');
			var sdate = new Date(stime);
			if(edate.getTime() - sdate.getTime() == 86400000){
				sdate = new Date(now.getTime() - 86400000);
				stimeStr = sdate.getFullYear()+'-'+this.checkTime(sdate.getMonth()+1)+'-'+this.checkTime(sdate.getDate())+' '+this.checkTime(sdate.getHours())+':'+this.checkTime(sdate.getMinutes())+':'+this.checkTime(sdate.getSeconds());
				seleObj.val(stimeStr);
			}
		}
	},
	str2long: function(timeVal){
		return new Date(Date.parse(timeVal.replace(/\-/g,"/"))).getTime();
	},
	time2str: function(D){
		var date = D.getDate(), month = D.getMonth()+1, year = D.getFullYear();
		var h = D.getHours(), m = D.getMinutes(), s = D.getSeconds();
		var str = year + '-' + this.checkTime(month) + '-' + this.checkTime(date) + ' ' + this.checkTime(h) + ':' + this.checkTime(m) + ':' + this.checkTime(s);
		return str;
	}
};

//模板工具
var TmpTools = {
	handleHTML:function($box, html, option) {
		//var s = html.trimHTML();
		var s = html;
		if(s == '') {
			var td = $box.parent().find('thead').find('td').size() || 0;
			var th = $box.parent().find('thead').find('th').size() || 0;
			var num = td == 0 ? th : td;
			$box.html('<tr><td colspan="' + num + '" align="center">没有相关数据！</td></tr>');
			return;
		}
		$box.html(html);
		// 实现搜索结果的高亮显示
		var opt = option || [];
		if(!(opt instanceof Array)) opt = [opt];
		for(var _i in opt) {
			var o = opt[_i];
			if(!o.className || !o.value || o.value.length == 0) return;
			var len = o.value.length, value = o.value.toLowerCase();
			$box.find('.' + o.className).each(function() {
				var tmp = this.innerHTML.toLowerCase();
				var idxs = [], idx = tmp.indexOf(value);
				while(idx != -1) {
					idxs.push(idx);
					tmp = tmp.substr(idx + len);
					idx = tmp.indexOf(value);
				}
				tmp = this.innerHTML;
				var htmls = [], pIdx = 0;
				for(var _j in idxs) {
					idx = idxs[_j];
					if(pIdx > 0) idx += pIdx + len;
					var start = pIdx == 0 ? 0 : pIdx + len;
					htmls.push(tmp.substring(start, idx));
					htmls.push('<span style="background:#f99">' + tmp.substring(idx, idx + len) + '</span>');
					pIdx = idx;
				}
				htmls.push(tmp.substr(idx + len));
				this.innerHTML = htmls.join('');
			});
		}
	},
	commonPage:function(box, fn, disR, count, p, pCount) {
		$(box).html('<div class="paginationbar" id="paginationbar"></div>'
			+ '<div class="displayNum" id="displayNum"></div>'
			+ '<div class="clear"></div>');
		// 分页
		var $pag = $(box).find('.paginationbar'), $dis = $(box).find('.displayNum');
		var pagination = this.getPagination();
		pagination.init($pag, p, pCount, 10, function(num) {
			fn(num, disR);
		});
		// 显示数目
		pagination.displayNum($dis, disR, function() {
			fn(1, this.innerHTML.slice(0, -1));
		});
		// 显示记录数
		var start = (p - 1) * disR + 1;
		var end = p * disR > count ? count : p * disR;
		var txt = '共 ' + count + ' 条记录';
		if(count > 0) {
			if(start == end) txt += ' ( 当前: ' + start + ' )';
			else txt += ' ( 当前: ' + start + '-' + end + ' )';
		}
		$('#count').css({'float':'right'}).html('<div class="pageCount">' + txt + '</div>');
	},
	getPagination:function(){
		return {
			toPage:function(n,self){
				var num=typeof n=='string'?n:this.href.substring(this.href.lastIndexOf('#')+1);
				if(num/1>self.total/1||num/1<1||isNaN(num/1)) {
					$.alert('不存在此页面！');
					return;
				}

				self.callback(num);
			},
			initHTML:function(box,num,all){
				var self=this;
				box.html('<ul><li> <a class="first" href="#">首页</a> <a class="prev" href="#">上一页</a> </li><li class="list"></li><li> <a class="next" href="#">下一页</a> <a class="last" href="#">尾页</a> </li><li class="goto">转到第 <input id="gotoPageValue" type="text" value="'+num+'" />/'+all+'页 <input id="gotoPageAction" type="button" class="btn btn-primary" value="GO" /></li></ul>');
				box.find('#gotoPageAction').click(function(){
					self.toPage($('#gotoPageValue').val(),self);
				});
				//绑定enter
				this.bindEnterKey('#gotoPageValue');
			},
			init:function(pageBox,current,total,disNum,callback){//初始化分页
				var $pageBox=$(pageBox).show(),self=this;
				if(total==0){$pageBox.css('display','none');return;}//当没有数据时退出
				this.initHTML($pageBox,current,total);//初始化html
				var cont=$pageBox.find('.list'),len=total,num=current-1,reObj=this,mid=Math.floor(disNum/2);
				this.total=total;
				this.callback=callback;//定义变量结束
				cont.html('');//清空cont的html
				if(num>mid-1) var end=len-num>mid?num+mid+1:len,start=len>disNum?end-disNum:0;
				else var end=len>disNum?disNum:len,start=0;
				for(var i=start;i<end;i++) cont.append('<a class="num" href="#'+(i+1)+'">'+(i+1)+'</a>');//生成link
				var pageList=$pageBox.find('.num'),relIndex=num-start;
				pageList.eq(relIndex).replaceWith("<span class='cur'>" + pageList.eq(relIndex).text() + "</span>");//生成link和span结束
				$pageBox.find('.prev').attr('href','#'+num);
				$pageBox.find('.next').attr('href','#'+(num+2));
				$pageBox.find('.first').attr('href','#'+1);
				$pageBox.find('.last').attr('href','#'+total);
				pageAllLink=$pageBox.find('a');
				pageAllLink.unbind('click').show();
				pageAllLink.click(function(){self.toPage.call(this,undefined,self);});//绑定点击
				if(num==0){$pageBox.find('.first,.prev').hide();}
				if(num==len-1){$pageBox.find('.last,.next').hide();}
				TmpTools.tipHover.init();
			},
			displayNum:function(_box,num,clickCallback,n){//每页显示记录
				var n1=n||10,n15=15,n2=n1*2,n3=n1*5,n4=n1*10,n5=n1*20,box=$(_box);
				box.html('<span class="tip-hover btn" tip="#displayNum_cont">每页显示...</span><span id="displayNum_cont" class="cont"><a rel="'+n1+'">'+n1+'条</a><a rel="'+n15+'">'+n15+'条</a><a rel="'+n2+'">'+n2+'条</a><a rel="'+n3+'">'+n3+'条</a><a rel="'+n4+'">'+n4+'条</a><a rel="'+n5+'">'+n5+'条</a></span>');
				if(num=='0') $('a',box).eq(0).replaceWith("<span class='cur'>" + $('a',box).eq(0).text() + "</span>");
				$('a',box).each(function(){
					if($(this).attr('rel')==num) $(this).replaceWith("<span class='cur'>" + $(this).text() + "</span>");
				});
				$('a',box).click(function(){
					clickCallback.call(this);
					$('#tip-hover-cont').hide();
				});
			},
			bindEnterKey:function(input,btn){//绑定表单元素(input/select/textarea等)enter事件(绑定默认的enter提交表单禁掉)，默认绑定同层的btn，自定义需绑定属性enterkey
				var $input=input?$(input):$('.bind-enter');
				if(!$input.length) return;
				$input.focus(function(){
					$(this).addClass('bind-enter-focus');
				}).blur(function(){
					$(this).removeClass('bind-enter-focus');
				});
				//禁用默认提交
				$input.closest('form').submit(function(){
					return false;
				});
				$input.keydown(function(e){//keyup--keydown@9.29
					if(e.keyCode=='13'){
						if($('.bind-enter-focus').length){
							if(btn) $btn=$(btn);
							else $btn=$('.bind-enter-focus').parent().find(':button');
							$btn.click();
						}
					}
				});
			}
		};
	},
	tipHover:{//悬停弹出TIP
		addTip:function(){
			$('#tip-hover-cont').remove();
			$('body').append('<div class="tip-hover-cont" id="tip-hover-cont"></div>');
		},
		addEvent:function(){
			var _this=this;
			$('#tip-hover-cont').hover(function(){
				clearTimeout(_this.timeout);
				$(this).show();
			},function(){
				var _o=this;
				_this.timeout=setTimeout(function(){
					_this.hide(_o);
				},200);
			});
		},
		show:function(o){
			this.addTip();
			this.addEvent();
			var s=$(o).attr('tip'),s1=s.slice(0,1),html,$box=$('#tip-hover-cont');
			if(s1=='#') html=$(s).clone(true);
			else html=s;
			$box.append(html);
			var boxH=$box.outerHeight(),oH=$(o).outerHeight();//tip高度、链接高度
			var os=$(o).offset(),left=os.left,top=os.top;
			var scrTop=$(document).scrollTop(),cltTop=top-scrTop;
			if(boxH<cltTop) top=os.top-boxH;
			else top=os.top+oH;
			$box.css({left:left,top:top,display:'block'});
		},
		hide:function(){
			$('#tip-hover-cont').hide();
		},
		inited:false,
		init:function(fn){
			if(this.inited)
				return;
			var _this=this;
			$('.tip-hover').live('mouseover',function(){
				var _o=this;
				clearTimeout(_this.timeout);
				_this.timeout=setTimeout(function(){
					_this.show(_o);
				},200);
			});
			$('.tip-hover').live('mouseout',function(){
				var _o=this;
				clearTimeout(_this.timeout);
				_this.timeout=setTimeout(function(){
					_this.hide(_o);
				},200);
			});
			fn&&fn();
			this.inited = true;
		}
	}
};

// loading
var Loading = {
	show: function() {
		try{
			if (!$('#loading')[0]) {
				var html = '<div id="loading" class="ajax-loading"><div class="ajax-loading-in">loading...</div></div>';
				$('body').append(html);
			}else {
				$('body').css({position:'relative'});
			}
			$('#loading').show();
		}catch(e){
			console.error(e);
		}
	},
	hide: function() {
		$('#loading').fadeOut();
	}
};

//数据存储
var DataStorage = {
	save: function(key, data){
		if(!window.sessionStorage){
			$.cookie(key, data);
		}else{
			sessionStorage[key] = data;
		}
	},
	get: function(key){
		var data;
		if(!window.sessionStorage){
			data = $.cookie(key, data, {path: '/'});
		}else{
			data = sessionStorage[key];
		}
		return data;
	},
	remove: function(key){
		if(!window.sessionStorage){
			$.cookie(key, null);
		}else{
			sessionStorage.removeItem(key);
		}
	}
};

// 多级菜单
var MultiMenu = function(){
	var menuHighlight = {
		save:function(container){
			$(container).on('click','.J_menu_item_trigger',function(e){
				DataStorage.save('curMenuId', $(this).attr('id'));
			})
		},
		init:function(){
			var _id = DataStorage.get('curMenuId');
			if(!!_id && _id!=''){
				var p_id = _id.slice(0,_id.lastIndexOf('_'));
				$('#' + _id).closest('li').addClass("active");
				$('#' + p_id).addClass('active open');
				$('#' + p_id).children('a').find('.arrow').addClass('open');
			}
		}
	}

	// json递归生成html
	function createMenu(container,menu){
		var str = "";
		var root = '', submenu = '', html = '', icon = '', index = 0, sub_index = 0, parent_index = 0, url = '', target_str = '';
		var forTree = function(o){
			for (var i = 0; i < o.length; i++) {
				var urlstr = '';
				target_str = '';
				if (!!o[i]['children'] && o[i]['children'].length !== 0) { // 有子菜单
					urlstr += '<li id="menu_item_' + index + '"><a title="' + o[i]["name"] + '" href="javascript:;"><i class="' + o[i].icon + '"></i><span class="title">' + o[i]["name"] + '</span><span class="arrow"></span></a><ul class="sub-menu">';
					str += urlstr;

					forTree(o[i]["children"]);
					str += "</ul></li>";
					parent_index = ++index;
					sub_index = 0;
					submenu = '';
				} else {
					o[i].url = o[i].url ? o[i].url : '#';
					url = o[i].url;
					if(url.indexOf('http://')==0||url.indexOf('https://')==0){
						target_str = ' target="_blank" ';
					}
					urlstr += '<li><a class="J_menu_item_trigger" id="menu_item_' + parent_index + '_' + sub_index + '" title="' + o[i]['name'] + '" href="' + o[i].url + '" ' + target_str + '><i class="' + o[i].icon + '"></i><span class="title">' + o[i]['name'] + '</span></a>';
					sub_index++;
					str += urlstr;
					str += '</li>';
				}
			}
			return str;
		}
		$(container).html(forTree(menu));
		menuHighlight.init();
		menuHighlight.save(container);
	}
	return {
		init:createMenu
	}
}();