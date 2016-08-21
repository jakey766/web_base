// 多级菜单 2014-05-26 10:55:32 
var createMultyMenu = function(){

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
                console.log(p_id)
                $('#' + _id).closest('li').addClass("active");
                $('#' + p_id).addClass('active open');
                $('#' + p_id).children('a').find('.arrow').addClass('open');
            } 
        }
    }
    

    // json递归生成html
    function createMenu(container,menu){
        var str = "";
        var root = '', submenu = '', html = '', icon = '', index = 0, sub_index = 0, parent_index = 0;
        var forTree = function(o){
            for (var i = 0; i < o.length; i++) {
                var urlstr = "";
                if (o[i]['children'] !== undefined && o[i]['children'].length !== 0) { // 有子菜单
                    urlstr += '<li id="menu_item_' + index + '"><a title="' + o[i]["name"] + '" href="javascript:;"><i class="' + o[i].icon + '"></i><span class="title">' + o[i]["name"] + '</span><span class="arrow"></span></a><ul class="sub-menu">';
                    str += urlstr;
                    
                    forTree(o[i]["children"]);
                    str += "</ul></li>";
                    parent_index = ++index;
                    sub_index = 0;
                    submenu = '';
                } else {
                    o[i].url = o[i].url ? o[i].url : '#';
                    urlstr += '<li><a class="J_menu_item_trigger" id="menu_item_' + parent_index + '_' + sub_index + '" title="' + o[i]['name'] + '" href="' + o[i].url + '"><i class="' + o[i].icon + '"></i><span class="title">' + o[i]['name'] + '</span></a>';
                    sub_index++;
                    str += urlstr;
                    str += "</li>";
                }
            }
            return str;
        }
        $(container).html(forTree(menu));
        menuHighlight.init();
        menuHighlight.save(container);
    }
    // return
    return {
        init:createMenu
    }
}()
