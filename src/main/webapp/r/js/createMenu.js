/**
* 菜单 2013-10-30 by zenglican
*/
// test data
/*var menuData = [
    { name:'home', icon:'',url:'index.html',children:[]},
    { name:'home2', icon:'icon-bookmark-empty',url:'index.html',children:[]},
    { name:'home3', icon:'icon-bookmark-empty',url:'index.html',children:[
        { name:'sub1', icon:'icon-bookmark-empty',url:'index.html',children:[]},
        { name:'sub2', icon:'icon-bookmark-empty',url:'index.html',children:[]},
        { name:'sub3', icon:'icon-bookmark-empty',url:'index.html',children:[]}
    ]},
    { name:'home4', icon:'icon-bookmark-empty',url:'index.html',children:[
        { name:'ssssub1', icon:'icon-bookmark-empty',url:'index.html',children:[]},
        { name:'sssub2', icon:'icon-bookmark-empty',url:'index.html',children:[]},
        { name:'ssssub3', icon:'icon-bookmark-empty',url:'index.html',children:[]},
    ]}
]*/
// 导航菜单高亮
var menuHighlight = {
    save:function(container){
        var trigger = $(container).find('.J_menu_item_trigger');
        $(container).on('click','.J_menu_item_trigger',function(e){
            sessionStorage.currentMenuId = $(this).attr('id');
        })
    },
    init:function(){
        var _id = sessionStorage.currentMenuId;
        if(_id !== undefined){
            var p_id = _id.slice(0,_id.lastIndexOf('_'));
            $('#' + _id).closest('li').addClass("active");
            $('#' + p_id).addClass('active open');
            $('#' + p_id).children('a').find('.arrow').addClass('open');
        } 
    }
}

function createMenu(container,menuData,callback){
    if(menuData.length !== 0){
        var root = '', submenu = '', html = '', icon = '', index = 0, sub_index = 0;
        $.each(menuData,function(i,n){
            if(n.icon === ''){
                icon = 'icon-folder-open';
            } else{
                icon = n.icon;
            }
            if(n.children === undefined || n.children.length === 0){
                html += '<li id="menu_item_' + index + '"><a class="J_menu_item_trigger" id="menu_item_' + index + '_' + sub_index + '" title="' + n.name + '" href="' + n.url + '"><i class="' + icon + '"></i><span class="title">' + n.name + '</span></a></li>';
                index++;
                sub_index++;
            } else{
                html += '<li id="menu_item_' + index + '"><a title="' + n.name + '" href="javascript:;"><i class="' + icon + '"></i><span class="title">' + n.name + '</span><span class="arrow"></span></a><ul class="sub-menu">';
                sub_index = 0;
                submenu = '';
                for(var i = 0, l = n.children.length; i < l; i++){
                    if(n.children[i].isNew){
                        submenu += '<li><a class="J_menu_item_trigger" id="menu_item_' + index + '_' + sub_index + '" title="' + n.children[i].name + '" href="' + n.children[i].url + '"><span class="badge badge-roundless badge-success">new</span>' + n.children[i].name + '</a></li>';
                    } else{
                        submenu += '<li><a class="J_menu_item_trigger" id="menu_item_' + index + '_' + sub_index + '" title="' + n.children[i].name + '" href="' + n.children[i].url + '"><span>' + n.children[i].name + '</span></a></li>';
                    }
                    sub_index++;
                }
                html += submenu + '</ul>'
                index++;
            }
        })
        $(container).html(html);
        menuHighlight.init(container);
        menuHighlight.save(container);
    }
}
