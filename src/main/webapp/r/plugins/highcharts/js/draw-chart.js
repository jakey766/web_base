/**
* 绘画图表 by zenglican 2013-12-10
*/
// 格式化日期
Date.prototype.format = function(format){
var o = {
"M+" : this.getMonth()+1, //month
"d+" : this.getDate(), //day
"H+" : this.getHours(), //hour
"h+" : this.getHours(), //hour
"m+" : this.getMinutes(), //minute
"s+" : this.getSeconds(), //second
"q+" : Math.floor((this.getMonth()+3)/3), //quarter
"S" : this.getMilliseconds() //millisecond
}
if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
(this.getFullYear()+"").substr(4 - RegExp.$1.length));
for(var k in o)if(new RegExp("("+ k +")").test(format))
format = format.replace(RegExp.$1,
RegExp.$1.length==1 ? o[k] :
("00"+ o[k]).substr((""+ o[k]).length));
return format;
};

Highcharts.setOptions({
	global: {
		useUTC: false
	}
});
// trace 画双Y轴折线图 2014-05-21 14:53:25 

function drawDoubleYChart(wrapper,series,titles,click_event){
    $(wrapper).html('');
    // console.log(series)
    $.each(series,function(i,n){
        var d = new Date(),
            id = 'chart_' + d.getTime(),
            div = $('<div id="' + id + '" class="chart-item-container"></div>');
        $(wrapper).append(div);

        drawChart.init({
            chart:{
                renderTo:id,
                type:'line',
                zoomType:'xy'
            },
            plotOptions: {
                line: {
                    marker: {
                        enabled: false
                    }
                },
                series:{
                     events: {
                        click:function(e){
                            if(click_event){
                                click_event(e)
                            }
                        }
                     }
                }
            },
            yAxis: [
                { // Primary yAxis
                    title: {
                        text: '调用次数',
                        style: {
                            color: '#2F7ED8'
                        }
                    }
                }, 
                { // Secondary yAxis
                    title: {
                        text: '延迟',
                        style: {
                            color: '#0D233A'
                        }
                    },
                opposite: true
                }
            ],
            title:{
                text: $.isArray(titles) ? titles[i] : titles
            },
            series: n
        })
    })
}
// 画折线图
function drawMultipleCharts(wrapper,series,titles){
    $(wrapper).html('');
    $.each(series,function(i,n){
        var d = new Date(),
        	id = 'chart_' + d.getTime(),
        	div = $('<div id="' + id + '" class="chart-item-container"></div>');
        $(wrapper).append(div);
        drawChart.init({
            chart:{
                renderTo:id,
                type:'line',
                zoomType:'xy'
            },
            plotOptions: {
                line: {
                    marker: {
                        enabled: false
                    }
                }
            },
            title:{
                text: $.isArray(titles) ? titles[i] : titles
            },
            series: n
        })
    })
}
// 柱状图 trace 全局柱状图
function drawColumnCharts(wrapper,series,titles){
    $(wrapper).html('');
    // console.log(series)
    var size = series.categories.length, column_options;
    if(size < 10){
        column_options = {
            pointWidth : 30
        }
    } else{
        column_options = {
            pointPadding: 0,
            groupPadding: 0,
            borderWidth: 0, 
        }
    }
    // Highcharts.getOptions().colors =["#8bbc21", "#910000", "#2f7ed8", "#0d233a", "#1aadce", "#492970", "#f28f43", "#77a1e5", "#c42525", "#a6c96a"]
    var length = series.length;
    $.each(series.data,function(i,n){
        var d = new Date(),
            id = 'chart_' + d.getTime(),
            div = $('<div id="' + id + '" class="chart-item-container"></div>');
        $(wrapper).append(div);
        drawChart.init({
            chart:{
                renderTo:id,
                type:'column',
                zoomType:'xy'
            },
            xAxis: {
                categories:series.categories,
                labels: {
                    rotation: -45
                },
                title: {
                    text: '单位/' + series.unit,
                    align: 'high'
                }
            },
            yAxis:{
                title:{
                    text: '单位/个数',
                    align: 'high',
                    offset: 0,
                    rotation: 0,
                    y: -15
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
                // text: $.isArray(titles) ? titles[i] : titles
                text: series.title
            },
            series: n
        })
    })
}
// 柱状图 trace 全局 组柱状图
function drawColumnGroupCharts(wrapper,series,titles){
    $(wrapper).html('');
    // Highcharts.getOptions().colors =["#8bbc21", "#910000", "#2f7ed8", "#0d233a", "#1aadce", "#492970", "#f28f43", "#77a1e5", "#c42525", "#a6c96a"]
    var length = series.length;
    $.each(series.data,function(i,n){
        var d = new Date(),
            id = 'chart_' + d.getTime(),
            div = $('<div id="' + id + '" class="chart-item-container"></div>');
        $(wrapper).append(div);
        drawChart.init({
            chart:{
                renderTo:id,
                type:'column',
                zoomType:'xy'
            },
            xAxis: {
                categories:series.categories
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0,
                    borderWidth: 0, 
                },
                line: {
                    marker: {
                        enabled: false
                    }
                },
            },
            title:{
                text: $.isArray(titles) ? titles[i] : titles
            },
            series: n
        })
    })
}
// 区域图
function drawAreaCharts(wrapper,series,titles){
    $(wrapper).html('');
    // Highcharts.getOptions().colors =["#8bbc21", "#910000", "#2f7ed8", "#0d233a", "#1aadce", "#492970", "#f28f43", "#77a1e5", "#c42525", "#a6c96a"]
    var length = series.length;
    $.each(series.data,function(i,n){
        var d = new Date(),
            id = 'chart_' + d.getTime(),
            div = $('<div id="' + id + '" class="chart-item-container"></div>');
        $(wrapper).append(div);
        drawChart.init({
            chart:{
                renderTo:id,
                type:'area',
                zoomType:'xy'
            },
            xAxis: {
                categories:series.categories
            },
            tooltip: {
            shared:false,
            xDateFormat: '%Y-%m-%d %H:%M:%S',
            crosshairs: null
        },
            plotOptions: {
                line: {
                    marker: {
                        enabled: false
                    }
                },
            },
            title:{
                text: $.isArray(titles) ? titles[i] : titles
            },
            series: n
        })
    })
}
// 画饼图 ycs
function drawPieCharts(wrapper,series,titles,options){
    $(wrapper).css({overflow:'hidden'}).html('');
    Highcharts.getOptions().colors =["#8bbc21", "#910000", "#2f7ed8", "#0d233a", "#1aadce", "#492970", "#f28f43", "#77a1e5", "#c42525", "#a6c96a"]
    var length = series.length;
    var w = Math.floor(($(wrapper).width() - 20) / length);
    $.each(series,function(i,n){
        var d = new Date(),
            id = 'chart_' + d.getTime(),
            div = $('<div id="' + id + '" class="chart-item-container" style="box-sizing: border-box; float: left; width: ' + w + 'px"></div>');
        $(wrapper).append(div);
        drawChart.init({
            chart:{
                renderTo:id
            },
            plotOptions: {
                /*series: {
                    color: Highcharts.getOptions().colors[i]
                },*/
                line: {
                    marker: {
                        enabled: false
                    }
                },
                tooltip: {
                    pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                },
                pie: {
                    size:options && options.pie_size || 200,
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
                text: $.isArray(titles) ? titles[i] : titles
            },
            series: n
        })
    })
}
var drawChart = {
	defaults : {
	    credits:false,
		tooltip: {
            shared:true,
            xDateFormat: '%Y-%m-%d %H:%M:%S',
            /*formatter:function(){
                var date = new Date();
                date.setTime(this.x);
                var s = date.format("hh:mm:ss");
                // return date.format("hh:mm");
                $.each(this.points, function(i, point) {
                    s += '<br/>'+ "<span color=\"red\">"+ point.series.name +': '+ (point.y) + '</span>';
                });
                return s;
            },*/
            crosshairs: [{
                width: 1,
                color: '#f60'
            },{
                width: 1,
                color: '#f60'
            }]
        },
        plotOptions:{
        	line: {
	            marker: {
	                enabled: false
	            }
	        }
        },
        xAxis: {
            lineWidth:3,
            gridLineWidth:1,
            gridLineDashStyle: 'longdash',
            plotLines: [{
                value: 0,
                width: 2,
                color: '#808080'
            }],
            labels: {
                step: 1,
                formatter: function() {
                    var date = new Date();
                    date.setTime(this.value);
                    return date.format("MM-dd hh:mm");
                }
            },
            type: 'datetime',
           // dateTimeLabelFormats: {month: '%b \'%y'}
        },
        yAxis: {
            title: {
                text: ''
            },
            lineWidth:3,
            gridLineDashStyle: 'longdash',
            plotLines: [{
                value: 0,
                width: 2,
                color: '#808080'
            }]
        }

	},
	settings : function(options){
		var that = this;
		var r = $.extend({}, that.defaults, options);
		return r;
	},
	init : function(options){
		var that = this;
		var chart = new Highcharts.Chart(that.settings(options));
		// console.log(chart.series)
	}
}