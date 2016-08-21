/**
 * metrics自定义js
 * @author jiangkunpeng
 */

/**
 * 获取radio值
 * @rname radio name
 */
$.tools.getRadioValue = function(rname){
	var es = document.getElementsByName(rname);
	if(es&&es!=null){
	    for(var i=0;i<es.length;i++){
	    	if(es[i].checked)
	    		return es[i].value;
	    }
	}
	return null;
};
/**
 * 获取checkbox值
 * @name checkbox name
 */
$.tools.getCheckboxValues = function(name){
	var es = document.getElementsByName(name);
	var values = [];
	if(es&&es!=null){
	    for(var i=0;i<es.length;i++){
	    	if(es[i].checked)
	        	values.push(es[i].value);
	    }
	}
	return values;
};
/**
 * 选中radio第一个
 * @rname radio name
 */
$.tools.checkFirst = function(rname){
	var es = document.getElementsByName(rname);
	if(es&&es!=null&&es.length>0){
		es[0].checked = 'checked';
	}
};
/**
 * 选中checkbox前N个
 * @name checkbox name
 * @n top n
 */
$.tools.checkTopN = function(name, n){
	var es = document.getElementsByName(name);
	if(es&&es!=null&&es.length>0){
		var len = es.length;
		if(n < len)
			len = n;
		for(var i=0;i<len;i++){
			es[i].checked = 'checked';
		}
	}
};
/**
 * checkbox 全选/反选
 * @param ele 全局控制checkbox
 * @param radioName
 */
$.tools.checkAll = function(ele,radioName){
	var checked = ele.checked;
	if(checked){
		$('input[name="'+radioName+'"]').attr('checked','checked');
	}else{
		$('input[name="'+radioName+'"]').removeAttr('checked');
	}
};
/**
 * 初始化
 */
$.tools.initGridCheckAll = function(eleId){
	var obj = $('#'+eleId);
	obj.on("click",function(){
		var other_ckbs = obj.closest('table').find('tbody').find('[type=checkbox]');
		if(obj.prop('checked')){
			other_ckbs.each(function(){
				if(!this.disabled){
					this.checked = true;
				}
			});
		}else{
			other_ckbs.each(function(){
				this.checked = false;
			});
		}
		$.uniform.update();
	});
};
/**
 * 展开/收缩(收缩时还是会展现一部分)
 * @param target 按钮对象 this
 * @param divId 要展开/收缩的divid
 * @param height 收缩后的高度,默认为60px
 */
$.tools.fadeToggle = function(target,divId,height){
	var tarObj = $(target);
	if(typeof(height)=="undefined"){
		height = "60px";
	}
	if(tarObj.hasClass('expand')){
		$('#'+divId).css("height", "auto");
		tarObj.removeClass('expand');
		tarObj.addClass('collapse');
	}else{
		$('#'+divId).css("height", height);
		tarObj.removeClass('collapse');
		tarObj.addClass('expand');
	}
};
/**
 * 展开/收缩(收缩时全部隐藏)
 * @param target 按钮对象 this
 * @param divId 要展开/收缩的divid
 * @param expandMsg 展开时显示的文字
 * @param collapseMsg 收缩时显示的文字
 * @param action 指定操作 expand/collapse
 */
$.tools.extraToggle = function(target,divId,expandMsg,collapseMsg,action){
	var tarObj = $(target);
	var destObj = $('#'+divId);
	var act = null;
	if(typeof(action)!='undefined'){
		act = action=='expand'?'expand':'collapse';
	}else{
		act = destObj.is(':hidden')?'expand':'collapse';
	}
	if(act=='expand'){
		destObj.show();
		tarObj.children("span").text(expandMsg);
		tarObj.find("a").removeClass('collapse').addClass('expand');
		tarObj.attr("status","expand");
	}else{
		destObj.hide();
		tarObj.children("span").text(collapseMsg);
		tarObj.find("a").removeClass('expand').addClass('collapse');
		tarObj.attr("status","collapse");
	}
	//localStorage.setItem('local_'+divId, act);
};
/**
 * 将对象所有属性名进行排序并以数组格式返回
 * @obj 要排序的对象
 */
$.tools.objectFieldSort = function(obj){
	var array = [];
	for(var n in obj){
		array.push(n);
	}
	return array.sort($.tools.ascSort);
};
/**
 * 按字母递增排序
 */
$.tools.ascSort = function(a , b){
	if(a < b)
		return -1;
	if(a > b)
		return 1;
	return 0;
};
/**
 * 将值存入数组,值唯一
 * @param arr 数值
 * @val 值
 */
$.tools.pushUnique = function(arr, val){
	if(typeof(val)=='undefined'||val==null||val=='')
		return;
	for(var i=0,len=arr.length;i<len;i++){
		if(arr[i]==val)
			return;
	}
	arr.push(val);
};
/**
 * 在字符串前后拼字符
 * @param str 目标字符串
 * @param char 要拼接的字符,默认为','
 */
$.tools.appendChar = function(str, char){
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
$.tools.trimChar = function(str, char){
	if(typeof(str)=='undefined'||str==null||str=='')
		return str;
	if(typeof(char)=='undefined'||char==null||char=='')
		char = ',';
	var len = str.length;
	if(str.substring(len-1, len)==char)
		str = str.substring(0, len-1);
	if(str.charAt(0)==char)
		str = str.substring(1);
	return str;
};
$.tools.date={
	//快速时间段变更事件
	fastTimeChange: function(element, startInput, endInput, callback){
		var val = element.value;
		if(val!=''){
			$.tools.date.fastTimeSelect(startInput, endInput, val);
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
			var stime = $.tools.date.str2long(stimeStr);
			var etime = $.tools.date.str2long(etimeStr);
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
			var nowStr = now.getFullYear()+'-'+$.tools.date.checkTime(now.getMonth()+1)+'-'+$.tools.date.checkTime(now.getDate())+' '+$.tools.date.checkTime(now.getHours())+':'+$.tools.date.checkTime(now.getMinutes())+':'+$.tools.date.checkTime(now.getSeconds());
			eleObj.val(nowStr);
		}
		if(typeof(sele)!='undefined'){
			var seleObj = $('#'+sele);
			var stimeStr = $.trim(seleObj.val());
			var stime = stimeStr.replace(/-/ig,'/');
			var sdate = new Date(stime);
			if(edate.getTime() - sdate.getTime() == 86400000){
				sdate = new Date(now.getTime() - 86400000);
				stimeStr = sdate.getFullYear()+'-'+$.tools.date.checkTime(sdate.getMonth()+1)+'-'+$.tools.date.checkTime(sdate.getDate())+' '+$.tools.date.checkTime(sdate.getHours())+':'+$.tools.date.checkTime(sdate.getMinutes())+':'+$.tools.date.checkTime(sdate.getSeconds());
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
	    var str = year + '-' + $.tools.date.checkTime(month) + '-' + $.tools.date.checkTime(date) + ' ' + $.tools.date.checkTime(h) + ':' + $.tools.date.checkTime(m) + ':' + $.tools.date.checkTime(s);
	    return str;
	}
};

$.metrics = {
	/**
	 * 获取应用信息
	 * @param params
	 * @param callback
	 */
	loadAppInfo : function(params, callback){
		$.ajax({
			url:'/info/loadAppInfo.do',
			data: params,
			type:'POST',
			success:function(data){
				if(data.code==0){
	       			if(callback){
	       				callback.call(data.object);
	    			}
				}else{
					$.alert(data.message!=null?data.message:'可能该服务元信息不存在');
				}
			},
			error:function(err){
				$.alert('获取服务元信息出错:'+err);
			}
		});
	},
	/**
	 * 获取客户端应用信息
	 * @param params
	 * @param callback
	 */
	loadClientInfo : function(params, callback){
		$.ajax({
			url:'/info/loadClientInfo.do',
			data: params,
			type:'POST',
			success:function(data){
				if(data.code==0){
	       			if(callback){
	       				callback.call(data.object);
	    			}
				}else{
					$.alert(data.message!=null?data.message:'可能该应用元信息不存在');
				}
			},
			error:function(err){
				$.alert('获取客户端应用元信息出错:'+err);
			}
		});
	},
	/**
	 * 获取客户端应用信息
	 * @param params
	 * @param callback
	 */
	loadClient2Info : function(params, callback){
		$.ajax({
			url:'/info/loadClient2Info.do',
			data: params,
			type:'POST',
			success:function(data){
				if(data.code==0){
	       			if(callback){
	       				callback.call(data.object);
	    			}
				}else{
					$.alert(data.message!=null?data.message:'可能该应用元信息不存在');
				}
			},
			error:function(err){
				$.alert('获取客户端应用元信息出错:'+err);
			}
		});
	},
	/**
	 * 获取IDC信息
	 * @param idcId
	 * @param callback	如果有callback则异步执行并回调传回结果,否则同步执行并返回结果
	 * @returns
	 */
	loadIdcInfo: function(idcId,callback){
		if(!callback){
			$.ajaxSetup({async : false});
		}
		var rs = null;
		$.ajax({
			url:"/info/loadIdcInfoById.do",
			data:{'id':idcId},
	        type:'POST',
	        success:function(data){
	        	if(data.code===0){
	        		rs = data.object;
	        	}else{
	        		console.log('获取机房信息出错:'+data.message);
	        	}
	        	if(callback){
	        		callback.call(rs);
	        	}
	        },
		    error:function(err){
		    	console.log('获取机房信息出错!');
		    }
		});
		if(!callback){
			$.ajaxSetup({async : true});
			return rs;
		}
	},
	/**
	 * 获取Host信息
	 * @param serverId
	 * @param callback	如果有callback则异步执行并回调传回结果,否则同步执行并返回结果
	 * @returns
	 */
	loadHostInfo: function(serverId,callback){
		if(!callback){
			$.ajaxSetup({async : false});
		}
		var rs = null;
		$.ajax({
			url:"/info/loadHostInfoById.do",
			data:{'id':serverId},
	        type:'POST',
	        success:function(data){
	        	if(data.code===0){
	        		rs = data.object;
	        	}else{
	        		console.log('获取主机信息出错:'+data.message);
	        	}
	        	if(callback){
	        		callback.call(rs);
	        	}
	        },
		    error:function(err){
		    	console.log('获取主机信息出错!');
		    }
		});
		if(!callback){
			$.ajaxSetup({async : true});
			return rs;
		}
	},
	/**
	 * 获取ISP信息
	 * @param isp
	 * @param callback	如果有callback则异步执行并回调传回结果,否则同步执行并返回结果
	 * @returns
	 */
	loadIspInfo: function(ispKey,callback){
		if(!callback){
			$.ajaxSetup({async : false});
		}
		var rs = null;
		$.ajax({
			url:"/info/loadIspInfoByKey.do",
			data:{'isp':ispKey},
	        type:'POST',
	        success:function(data){
	        	if(data.code===0){
	        		rs = data.object;
	        	}else{
	        		console.log('获取ISP信息出错:'+data.message);
	        	}
	        	if(callback){
	        		callback.call(rs);
	        	}
	        },
		    error:function(err){
		    	console.log('获取ISP信息出错!');
		    }
		});
		if(!callback){
			$.ajaxSetup({async : true});
			return rs;
		}
	},
	/**
	 * 获取区域信息
	 * @param isp
	 * @param callback	如果有callback则异步执行并回调传回结果,否则同步执行并返回结果
	 * @returns
	 */
	loadAreaInfo: function(areaId,callback){
		if(!callback){
			$.ajaxSetup({async : false});
		}
		var rs = null;
		$.ajax({
			url:"/info/loadAreaInfoById.do",
			data:{'id':areaId},
	        type:'POST',
	        success:function(data){
	        	if(data.code===0){
	        		rs = data.object;
	        	}else{
	        		console.log('获取区域信息出错:'+data.message);
	        	}
	        	if(callback){
	        		callback.call(rs);
	        	}
	        },
		    error:function(err){
		    	console.log('获取区域信息出错!');
		    }
		});
		if(!callback){
			$.ajaxSetup({async : true});
			return rs;
		}
	},
	/**
	 * 获取短URI信息
	 * @param appName
	 * @param serviceName
	 * @param uri
	 * @param callback	如果有callback则异步执行并回调传回结果,否则同步执行并返回结果
	 * @returns
	 */
	loadSimpleUriAlias: function(appName,serviceName,uri,callback){
		if(!callback){
			$.ajaxSetup({async : false});
		}
		var rs = null;
		$.ajax({
			url:"/info/loadSimpleUriAlias.do",
			data:{'appName':appName,'serviceName':serviceName,'uri':uri},
	        type:'POST',
	        success:function(data){
	        	if(data.code===0){
	        		rs = data.object;
	        	}else{
	        		console.log('获取短URI信息出错:'+data.message);
	        	}
	        	if(callback){
	        		callback.call(rs);
	        	}
	        },
		    error:function(err){
		    	console.log('获取短URI信息出错!');
		    }
		});
		if(!callback){
			$.ajaxSetup({async : true});
			return rs;
		}
	},
	/**
	 * 获取分页对象，采用function机制,避免全局对象
	 *  hrk
	 *  2014/05/15
	 *
	 */
	getPagination : function(){
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
				$.sysop.kit.bindEnterKey('#gotoPageValue');
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
			},
			displayNum:function(_box,num,clickCallback,n){//每页显示记录
				var n1=n||10,n2=n1*2,n3=n1*5,n4=n1*10,n5=n1*20,box=$(_box);
				box.html('<span class="tip-hover btn" tip="#displayNum_cont">每页显示...</span><span id="displayNum_cont" class="cont"><a rel="'+n1+'">'+n1+'条</a><a rel="'+n2+'">'+n2+'条</a><a rel="'+n3+'">'+n3+'条</a><a rel="'+n4+'">'+n4+'条</a><a rel="'+n5+'">'+n5+'条</a></span>');
				if(num=='0') $('a',box).eq(0).replaceWith("<span class='cur'>" + $('a',box).eq(0).text() + "</span>");
				$('a',box).each(function(){
					if($(this).attr('rel')==num) $(this).replaceWith("<span class='cur'>" + $(this).text() + "</span>");
				});
				$('a',box).click(function(){
					clickCallback.call(this);
					$('#tip-hover-cont').hide();
				});
			}
		};
	},
	getQueryCountLimit: function(){
		if( !sessionStorage.queryCountLimit){
			var queryCountLimit = 30;
			$.ajaxSetup({  
    	    	async : false //取消异步  
    		});
			$.ajax({
				url:'/info/loadSysSettingByKey.do',
				data:'key=queryCountLimit',
				type:'POST',
				success:function(data){
					if(data.code==0){
						try{
							queryCountLimit = parseInt(data.object.value);
						}catch(e){
							console.log(e);
							queryCountLimit = 30;
						}
						if(queryCountLimit < 0)
							queryCountLimit = 30;
						sessionStorage.queryCountLimit = JSON.stringify(queryCountLimit);
					}else{
						console.log('加载查询数量限制出错!' + data.message);
					}
				},
				error:function(err){
					console.log('加载查询数量限制出错!');
				}
			});
			$.ajaxSetup({  
				async : true //异步
    		});
			return queryCountLimit;
		}else{
			var queryCountLimit = 30;
			try{
				queryCountLimit = parseInt(sessionStorage['queryCountLimit']);
			}catch(e){
				console.log(e);
			}
			if(queryCountLimit < 0)
				queryCountLimit = 30;
			return $.sysop.kit.str2Obj(queryCountLimit);
		}
	},
	yAxisNumberFormatter : function(){
		var _val = this.value;
		if(_val >= 1000000000000000)
			return _val/1000000000000000 + '亿亿';
		else if(_val >= 100000000000)
			return _val/100000000000 + '万亿';
		else if(_val >= 100000000)
			return _val/100000000 + '亿';
		else if(_val >= 10000)
			return _val/10000 + '万';
		else
			return _val;
	},
	drawMultipleCharts: function(wrapper,series,titles,setting){
		$(wrapper).html('');
	    $.each(series,function(i,n){
	        var d = new Date(),
	        	id = 'chart_' + d.getTime(),
	        	div = $('<div id="' + id + '" class="chart-item-container"></div>'),
	        	titleDiv = '<span id="'+wrapper.id+'_title">' + ($.isArray(titles) ? titles[i] : titles) + '</span>';
	        $(wrapper).append(div);
	        var dsetting = {
		            chart:{
		                renderTo:id,
		                type:'line',
		                zoomType:'xy',
		                height: 350
		            },
		            tooltip: {
		                shared:true,
		                xDateFormat: '%Y-%m-%d %H:%M',
		                crosshairs: [{
		                    width: 1,
		                    color: '#f60'
		                },{
		                    width: 1,
		                    color: '#f60'
		                }]
		            },
		            plotOptions: {
		                spline:{
		        			marker:{
		        				enabled:true,	//显示点,不然断线时看不到点
		        				radius:1
		        			}
		        		},
		        		series:{				//看起来这个才生效
		                    marker:{
		                        enabled:true,	//显示点,不然断线时看不到点
		                        radius: 1
		                    }
		                }
		            },
		            title:{
		            	useHTML: true,
		                text: titleDiv
		            },
		            yAxis: {
		                title: {
		                    text: ''
		                }
		                //,floor:0	//y轴最小为0
		                ,min:0	//定义y轴最小刻度为0
		                ,labels:{
		                	formatter : $.metrics.yAxisNumberFormatter
		                }
		            },
		            series: n
		    };
	        if(typeof(setting)!='undefined'&&setting!=null){
	        	$.extend(dsetting, setting);
	        }
	        drawChart.init(dsetting);
	    });
	},
	drawColumnCharts: function(wrapper,series,titles,setting){
		$(wrapper).html('');
	    $.each(series.data,function(i,n){
	        var d = new Date(),
	            id = 'chart_' + d.getTime(),
	            div = $('<div id="' + id + '" class="chart-item-container"></div>'),
	            titleDiv = '<span id="'+wrapper.id+'_title">' + ($.isArray(titles) ? titles[i] : titles) + '</span>';
	        $(wrapper).append(div);
	        var size = series.categories.length, column_options;
	        if(size < 5){
	            column_options = {
	                pointWidth : 30
	            };
	        } else{
	            column_options = {
	                pointPadding: 0,
	                borderWidth: 0, 
	            };
	        }
	        var dsetting = {
		            chart:{
		                renderTo:id,
		                type:'column',
		                zoomType:'xy',
		                height: 350
		            },
		            xAxis: {
		                categories:series.categories,
		                labels: {
		                    rotation: -45,
		                    formatter: function(){
		                    	return this.value;
		                    }
		                },
		                title: {
		                    //text: series.unit,
		                    align: 'high'
		                }
		            },
		            yAxis:{
		                title:{
		                    text: ''
		                },
		                labels:{
		                	overflow:'justify'
		                }
		                ,labels:{
		                	formatter : $.metrics.yAxisNumberFormatter
		                }
		            },
		            tooltip: {
			            shared:false,
			            xDateFormat: '%Y-%m-%d %H:%M:%S',
			            crosshairs: null,
			            formatter: function() {
			                return '<b>延时：</b>' + this.x + ' ' + series.unit
			                + '<br><b>数量：</b>'+ this.y;
			            }
		            },
		            plotOptions: {
		            	column: column_options,
		                line: {
		                    marker: {
		                        enabled: false
		                    }
		                },
		            },
		            title:{
		            	useHTML: true,
		                text: titleDiv
		            },
		            series: n
		    };
	        if(typeof(setting)!='undefined'&&setting!=null){
	        	$.extend(dsetting, setting);
	        }
	        drawChart.init(dsetting);
	    });
	},
	drawPieCharts: function(wrapper,series,titles,setting){
		$(wrapper).css({overflow:'hidden'}).html('');
	    var length = series.length;
	    var w = Math.floor(($(wrapper).width() - 20) / length);
	    $.each(series,function(i,n){
	        var d = new Date(),
	            id = 'chart_' + d.getTime(),
	            div = $('<div id="' + id + '" class="chart-item-container" style="box-sizing: border-box; float: left; width: ' + w + 'px"></div>'),
	            titleDiv = '<span id="'+wrapper.id+'_title">' + ($.isArray(titles) ? titles[i] : titles) + '</span>';
	        $(wrapper).append(div);
	        var dsetting = {
	            chart:{
	                renderTo:id,
	                height: 350
	            },
	            plotOptions: {
	                line: {
	                    marker: {
	                        enabled: false
	                    }
	                },
	                tooltip: {
	                    pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
	                },
	                pie: {
	                    size:setting && setting.pie_size || 175,
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    showInLegend: true,
	                    dataLabels: {
	                        enabled: true,
	                        formatter: function(){
	                            // console.log(this.point)
	                        },
	                        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	                    }
	                }
	            },
	            title:{
	            	useHTML: true,
	                text: titleDiv
	            },
	            series: n
	        };
	        if(typeof(setting)!='undefined'&&setting!=null){
	        	$.extend(dsetting, setting);
	        }
	        drawChart.init(dsetting);
	    });
	},
	//告警table渲染
	initAlarmTemplated:false,
	initAlarmTemplateFunc:function(){
		if($.metrics.initAlarmTemplated)
			return;
		template.helper('alarmTagConvert',function(v){
			return $.metrics.getTagName(v);
		});
		template.helper('alarmTopicConvert',function(v){
			var topic = v.topic;
			var alias = v.topicAlias;
			if(topic==alias)
				return topic;
			else
				return alias+'['+topic+']';
		});
		template.helper('alarmDimensionsConvert',function(pvo){
			var show = '';
			var dims = pvo.dimensionsJson;
			if(dims=='[]'||dims==''){
				show = '整体';
			}else{
				var dimArray = $.parseJSON(dims);
				var idx = 0;
				var k,v,op,n;
				$.each(dimArray,function(i, vo){
					if(idx>0){
						show += '<br/>';
					}
					k = vo.KEY;
					v = vo.VAL;
					op = vo.OP;
					n = vo.name;
					if(k=='uri'){
						k = '指标';
						var vlen = v.length;
						if(vlen>1){
							if(v.substring(vlen-1,vlen)=='/'){
								k = '指标(下层聚合)';
								v = v.substring(0, vlen-1);
							}else if(v.substring(vlen-2, vlen)=='/*'){
								k = '指标(下层批量)';
								v = v.substring(0, vlen-2);
							}
						}
					}else if(k=='version'){
						k = '版本';
					}
					if(v=='*'){
						op = ' = ';
						v = '全部值(*)';
					}else{
						if(typeof(n)!='undefined'&&n!=null&&n!=''&&n!=v){
							v = n+'['+v+']';
						}
						op = op=='EQ'?' = ':' != ';
					}
					show += k+op+v;
					idx++;
				});
			}
			if(pvo.topicType=='STRING_Rcode'){
				show += '<br/>返回码';
				var rcode = $.parseJSON(pvo.retcodeDesc);
				if(rcode.OP=='EQ')
					show += '=';
				else
					show += '!=';
				show += rcode.VAL;
			}
			return show;
		});
		template.helper('alarmDescConvert',function(v){
			return $.metrics.alarmDescConvert(v);
		});
		template.helper('alarmTimeConvert',function(v){
			if(v.duration>0){
				return v.startTime.substring(0, 16) + '至' + v.endTime.substring(0, 16) + '(持续' + v.duration + '分钟)';
			}else{
				return v.startTime.substring(0, 16);
			}
		});
		template.helper('alarmStatusConvert',function(v){
			return v==1?'<span style="color:red;">告警中</span>':'已恢复';
		});
		template.helper('alarmValConvert',function(v){
			try{
				var val = v.alarmVal;
				var unit = v.thresholdUnit;
				var topicType = v.topicType;
				var policyType = v.policyType;
				if(topicType=='histogram'&&policyType==1){
					if(unit=='s'){
						val = val/1000000000;
					}else if(unit=='ms'){
						val = val/1000000;
					}else if(unit=='us'){
						val = val/1000;
					}
				}
				if(policyType==2)
					unit = '%';
				if((val+'').indexOf('.')>-1)
					val = val.toFixed(3);
				return val + unit;
			}catch(e){
				console.log(e);
			}
			return v.alarmVal;
		});
		$.metrics.initAlarmTemplated = true;
	},
	alarmDescConvert:function(v){
		var show = '';
		var val = v.threshold;
		var val2 = v.threshold2;
		var unit = '';
		//if(v.topicType=='histogram'||v.topicType=='timer')
			unit = v.thresholdUnit;
		if(typeof(unit)=='undefined'||unit==null){
			unit = '';
		}
		if(unit!='')
			unit = ' ' + unit;
		if(v.policyType==2){
			show += '近'+v.statPeriod+'分钟与';
			var ct = v.compareType;
			var wt = v.waveType;
			if(ct==1)
				show += '上周期';
			else if(ct==2)
				show += '昨天';
			else if(ct==3)
				show += '上周';
			show += '对比,';
			if(wt==1)
				show += '向上';
			else if(wt==2)
				show += '向下';
			else if(wt==3)
				show += '上下';
			show += '波动,波动率';
			unit = '%';
		}else{
			show += '阀值';
		}
		var op = v.operator;
		if(op=='LT')
			show += '<' + val + unit;
		else if(op=='LE')
			show += '<=' + val + unit;
		else if(op=='GT')
			show += '>' + val + unit;
		else if(op=='GE')
			show += '>=' + val + unit;
		else if(op=='EQ')
			show += '==' + val + unit;
		else if(op=='NEQ')
			show += '!=' + val + unit;
		else if(op=='IN')
			show += '在[' + val + ',' + val2 + ')' + unit + '范围内';
		else if(op=='OUT')
			show += '在[' + val + ',' + val2 + ')' + unit + '范围外';
		return show;
	},
	/**
	 * 获取指标分类显示名称
	 * @param _tag
	 * @returns
	 */
	getTagName:function(_tag){
		if(_tag=='')
			return '全部分类';
		else if(_tag=='s')
			return '对外服务指标';
		else if(_tag=='c')
			return '外部服务指标';
		else if(_tag=='i')
			return '内部处理指标';
		else
			return _tag;
	},
	/**
	 * 获取所有服务类别
	 * @returns
	 */
	getServiceTypeNames:function(){
		return {
			'0' : '监控类',
			'1' : '统计类'
		};
	},
	/**
	 * 获取所有服务子类别
	 * @returns
	 */
	getServiceSubTypeNames:function(){
		return {
			'0' : 'metrics',
			'1' : 'video',
			'2' : 'yymp'
		};
	},
	/**
	 * 获取服务类别显示名称
	 * @param _type
	 * @returns
	 */
	getServiceTypeName:function(_type){
		return $.metrics.getServiceTypeNames()[_type];
	},
	/**
	 * 获取服务子类别显示名称
	 * @param _type
	 * @returns
	 */
	getServiceSubTypeName:function(_type){
		return $.metrics.getServiceSubTypeNames()[_type];
	},
	/**
	 * 获取内容类别
	 */
	getContentCategories:function(){
		return {
			'MetricsWebVersion' : 'MetricsWeb版本',
			'JavaSdkVersion' : 'JAVA_SDK版本',
			'C__SdkVersion' : 'C++_SDK版本'
		};
	},
	/**
	 * 获取文件类别
	 */
	getFileCategories:function(){
		return {
			'help' : '帮助'
		};
	}
};
//清空菜单缓存
function cleanMenuSession(){
	sessionStorage.removeItem('menuData');
	$.alert('清空菜单缓存成功!');
}
//手动同步应用信息
function appInfoSync(){
	$.ajax({
		url:'/system/processTask.do',
		data:'taskClassNames=appInfoSyncTask,newAppNameManualSyncTask',
		type:'POST',
		success:function(data){
			if(data.code==0){
				sessionStorage.removeItem('menuData');
				$.alert('手动执行同步成功!');
			}else{
				$.alert('手动执行同步异常:'+data.message);
			}
		},
		error:function(err){
			$.alert('手动执行同步异常:'+err);
		}
	});
}
//刷新菜单缓存
function refreshMenu(){
    $.getJSON('/common/menu.do',function(json){
        if(!json.success) {
            console.log(json.message);
            return;
        }
        var data  = [];
        var menus = json.object;
        var mlen = menus.length;
        if(mlen<30){	//用一个傻瓜的方法判断没有获取到业务模块菜单，则本次不缓存(请求获取菜单还没响应时就刷新/跳转页面会导致该情况出现)
        	return;
        }
        var menuFilter = {};
        for(var j = 0; j < mlen; j++){
            if(menus[j].parent_id==0){
                var menu = {};
                menu["name"] = menus[j].name;
                menu["icon"] = '';
                menu["url"] = menus[j].url;
                menu["children"] = [];
                menuFilter[menus[j].menu_id] = menu;
                data.push(menu);
            } else{
                var menu = {}, children;
                menu["name"] = menus[j].name;
                menu["icon"] = '';
                menu["url"] = menus[j].url;
                menu["children"] = [];
                menuFilter[menus[j].menu_id] = menu;
                children = menuFilter[menus[j].parent_id].children;
                children.push(menu);
            }
        }
        sessionStorage.menuData = $.sysop.kit.obj2Str(data);
        //menuHighlight.save('#menu-container');
        
        createMultyMenu.init('#menu-container',data);
        menuHighlight.save('#menu-container');
        menuHighlight.init();
	});
}
//加载帮助列表
function loadHelpList(){
	$.ajax({
		url:"/file/load.do",
        type:'POST',
        data:'category=help',
        success:function(json){
        	if (!json.success) {
    			console.log('获取文件列表出错:'+json.message);
    		    return;
    		}
    		var html = template('helpListTmpl', {
    			list : json.object
    		});
    		$.tools.handleHTML($('#helpBody'), html);
        },
	    error:function(err){
	    	console.log('获取文件列表出错:'+err);
	    }
	});
}
$(function(){
	if($(window).width()<1200){
		$('body').addClass('page-sidebar-closed');	//收起侧边栏菜单
	}
	//让饼图不影响其他图的颜色
	var _color0 = Highcharts.getOptions().colors[0];
	Highcharts.getOptions().colors = [_color0, "#8bbc21", '#FF9655', "#910000", "#2f7ed8", "#0d233a", "#1aadce", "#492970", "#f28f43", "#c42525",'#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FFF263', '#6AF9C4', "#a6c96a"];
	Highcharts.setOptions({
        lang:{
        	//不缩短高数轴标签,默认:k,M,G,T,P,E等,null时则显示原始值
        	//['千','百万','十亿','万亿','千万亿']
            numericSymbols:null
        }
	});
	loadHelpList();
	//更新一次菜单,业务模块菜单可能会有更新
	if( !!sessionStorage.menuData){
		refreshMenu();
	}
});