/**
* 菜单数据 2013-10-30 by zenglican
*/
// test data
var menuData = [
    { name:'home', icon:'icon-home',url:'index.html',children:[]},
    { name:'布局', icon:'icon-cogs',url:'javascript:;',children:[
        { name:'盒子模型', icon:'',url:'layout_block.html',children:[]},
        { name:'左边栏+水平下拉菜单', icon:'',url:'layout_sidebar_horizontal_menu.html',children:[]},
        { name:'只有水平下拉菜单', icon:'',url:'layout_nosidebar_horizontal_menu.html',children:[]},
        { name:'边栏收起', icon:'',url:'layout_sidebar_closed.html',children:[]},
        { name:'固定边栏', icon:'',url:'layout_sidebar_fixed.html',children:[]},
        { name:'固定页面宽度', icon:'',url:'layout_boxed_page.html',children:[]},
        { name:'空白页，可做模板', icon:'',url:'layout_blank_page.html',children:[]},
        { name:'运维研发的include文件', icon:'',url:'layout_include_page.html',children:[]}
    ]},
    { name:'UI元素', icon:'icon-bookmark-empty',url:'#',children:[
        { name:'通用(提示层、告警)', icon:'',url:'ui_general.html',children:[]},
        { name:'按钮', icon:'',url:'ui_button.html',children:[]},
        { name:'Tab标签页', icon:'',url:'ui_tab.html',children:[]},
        { name:'桌面通知', icon:'',url:'ui_notify.html',children:[]},
        { name:'小图标', icon:'',url:'ui_icon.html',children:[]}
    ]},
    {
        name:'widge',icon:'icon-bookmark-empty',url:'#',children:[
            { name:'日历控件', icon:'',url:'widge-calendar.html',children:[]},
            { name:'弹窗控件', icon:'',url:'widge-dialog.html',children:[]},
            { name:'select2', icon:'',url:'forms_select2.html',children:[],isNew:true}
        ]
    },
    { name:'表单', icon:'icon-table',url:'#',children:[
        { name:'表单布局', icon:'',url:'forms_layout.html',children:[]},
        { name:'表单元素', icon:'',url:'forms_module.html',children:[]},
        { name:'表单模板代码', icon:'',url:'forms_module.html',children:[]},
        
        { name:'表单验证', icon:'',url:'forms_validate.html',children:[]}
    ]},
    { name:'表格', icon:'icon-th',url:'#',children:[
        { name:'简单表格', icon:'',url:'table_1.html',children:[]},
        { name:'简单表格 - 复选框', icon:'',url:'table_checkbox.html',children:[]},
        { name:'增强表格', icon:'',url:'table_2.html',children:[]},
        { name:'增强表格代码', icon:'',url:'table_3.html',children:[]}
    ]},
    { name:'数据可视化', icon:'icon-bar-chart',url:'#',children:[
        { name:'连线', icon:'',url:'line_5.html',children:[]},
        { name:'时序图', icon:'',url:'sequence_chart.html',children:[],isNew:false},
        { name:'span时间开销图', icon:'',url:'span_chart.html',children:[],isNew:false},
        { name:'树', icon:'',url:'demo-trace-global-tree.html',children:[],isNew:true},
        // { name:'树', icon:'',url:'v_tree.html',children:[],isNew:true}
    ]},
    { name:'图表', icon:'icon-bar-chart',url:'#',children:[
        { name:'折线图', icon:'',url:'chart_1.html',children:[]},
        { name:'饼图', icon:'',url:'chart_pie.html',children:[],isNew:true},
        { name:'柱状图', icon:'',url:'chart_column.html',children:[],isNew:true},
        { name:'多图', icon:'',url:'chart_2.html',children:[]}
    ]},
    { name:'ECharts', icon:'icon-bar-chart',url:'#',children:[
        { name:'demo', icon:'',url:'echarts-demo-1.html',children:[]}
    ]},
    { name:'系统demo页面', icon:'icon-bar-chart',url:'#',children:[
        { name:'trace全局页面', icon:'',url:'demo-trace-global.html',children:[]},
        { name:'YCS - 云主机demo', icon:'',url:'demo-yunzhuji.html',children:[]},
        { name:'YCS - 租户管理demo', icon:'',url:'demo-yunzhuji2.html',children:[]}
    ]},
    { name:'插件依赖查询', icon:'icon-table',url:'plugins.html'},
    { name:'前端模板引擎', icon:'icon-table',url:'template.html'},
    { name:'更新日志', icon:'icon-table',url:'changelog.html'}
]
