var App = function () {

    // IE mode
    var isRTL = false;
    var isIE8 = false;
    var isIE9 = false;
    var isIE10 = false;

    var sidebarWidth = 225;
    var sidebarCollapsedWidth = 35;

    var responsiveHandlers = [];

    // theme layout color set
    var layoutColorCodes = {
        'blue': '#4b8df8',
        'red': '#e02222',
        'green': '#35aa47',
        'purple': '#852b99',
        'grey': '#555555',
        'light-grey': '#fafafa',
        'yellow': '#ffb848'
    };

    // last popep popover
    var lastPopedPopover;

    var handleInit = function() {

        if ($('body').css('direction') === 'rtl') {
            isRTL = true;
        }

        isIE8 = !! navigator.userAgent.match(/MSIE 8.0/);
        isIE9 = !! navigator.userAgent.match(/MSIE 9.0/);
        isIE10 = !! navigator.userAgent.match(/MSIE 10.0/);
        
        if (isIE10) {
            jQuery('html').addClass('ie10'); // detect IE10 version
        }
    }

    // 切换theme
    var handleTheme = function () {
        var cookie_color = $.cookie('style_color');
        if(cookie_color !== undefined && cookie_color !== ''){
            $('#style_color').attr("href", "http://s1.yy.com/sysop_fed_lib/assets/css/themes/" + cookie_color + ".css");
        }
        var panel = $('.color-panel');

        if ($('body').hasClass('page-boxed') == false) {
            $('.layout-option', panel).val("fluid");
        }
        
        $('.sidebar-option', panel).val("default");
        $('.header-option', panel).val("fixed");
        $('.footer-option', panel).val("default"); 

        //handle theme layout
        var resetLayout = function () {
            $("body").
                removeClass("page-boxed").
                removeClass("page-footer-fixed").
                removeClass("page-sidebar-fixed").
                removeClass("page-header-fixed");

            $('.header > .navbar-inner > .container').removeClass("container").addClass("container-fluid");

            if ($('.page-container').parent(".container").size() === 1) {
                $('.page-container').insertAfter('.header');
            } 

            if ($('.footer > .container').size() === 1) {                        
                $('.footer').html($('.footer > .container').html());                        
            } else if ($('.footer').parent(".container").size() === 1) {                        
                $('.footer').insertAfter('.page-container');
            }

            $('body > .container').remove(); 
        }

        var lastSelectedLayout = '';

        var setLayout = function () {

            var layoutOption = $('.layout-option', panel).val();
            var sidebarOption = $('.sidebar-option', panel).val();
            var headerOption = $('.header-option', panel).val();
            var footerOption = $('.footer-option', panel).val(); 

            if (sidebarOption == "fixed" && headerOption == "default") {
                alert('不能同时固定边栏而不固定头部');
                $('.sidebar-option', panel).val("default");
                sidebarOption = 'default';
            }

            resetLayout(); // reset layout to default state

            if (layoutOption === "boxed") {
                $("body").addClass("page-boxed");

                // set header
                $('.header > .navbar-inner > .container-fluid').removeClass("container-fluid").addClass("container");
                var cont = $('.header').after('<div class="container"></div>');

                // set content
                $('.page-container').appendTo('body > .container');

                // set footer
                if (footerOption === 'fixed' || sidebarOption === 'default') {
                    $('.footer').html('<div class="container">'+$('.footer').html()+'</div>');
                } else {
                    $('.footer').appendTo('body > .container');
                }            
            }

            if (lastSelectedLayout != layoutOption) {
                //layout changed, run responsive handler:
                runResponsiveHandlers();
            }
            lastSelectedLayout = layoutOption;

            //header
            if (headerOption === 'fixed') {
                $("body").addClass("page-header-fixed");
                $(".header").removeClass("navbar-static-top").addClass("navbar-fixed-top");
            } else {
                $("body").removeClass("page-header-fixed");
                $(".header").removeClass("navbar-fixed-top").addClass("navbar-static-top");
            }

            //sidebar
            if (sidebarOption === 'fixed') {
                $("body").addClass("page-sidebar-fixed");
            } else {
                $("body").removeClass("page-sidebar-fixed");
            }

            //footer 
            if (footerOption === 'fixed') {
                $("body").addClass("page-footer-fixed");
            } else {
                $("body").removeClass("page-footer-fixed");
            }

            handleSidebarAndContentHeight(); // fix content height            
            handleFixedSidebar(); // reinitialize fixed sidebar
            handleFixedSidebarHoverable(); // reinitialize fixed sidebar hover effect
        }

        // handle theme colors
        var setColor = function (color) {
            $('#style_color').attr("href", "http://s1.yy.com/sysop_fed_lib/assets/css/themes/" + color + ".css");
            $.cookie('style_color', color);                
        }

        $('.icon-color', panel).click(function () {
            $('.color-mode').show();
            $('.icon-color-close').show();
        });

        $('.icon-color-close', panel).click(function () {
            $('.color-mode').hide();
            $('.icon-color-close').hide();
        });

        $('li', panel).click(function () {
            var color = $(this).attr("data-style");
            setColor(color);
            $('.inline li', panel).removeClass("current");
            $(this).addClass("current");
        });

        $('.layout-option, .header-option, .sidebar-option, .footer-option', panel).change(setLayout);
    }


    var handleDesktopTabletContents = function () {
        
        
        if ($(window).width() <= 1280 || $('body').hasClass('page-boxed')) {
            $(".responsive").each(function () {
                var forTablet = $(this).attr('data-tablet');
                var forDesktop = $(this).attr('data-desktop');
                if (forTablet) {
                    $(this).removeClass(forDesktop);
                    $(this).addClass(forTablet);
                }
            });
        }

        
        
        if ($(window).width() > 1280 && $('body').hasClass('page-boxed') === false) {
            $(".responsive").each(function () {
                var forTablet = $(this).attr('data-tablet');
                var forDesktop = $(this).attr('data-desktop');
                if (forTablet) {
                    $(this).removeClass(forTablet);
                    $(this).addClass(forDesktop);
                }
            });
        }
    }

    var handleSidebarState = function () {
        
        if ($(window).width() < 980) {
            $('body').removeClass("page-sidebar-closed");
        }
    }

    var runResponsiveHandlers = function () {
        
        for (var i in responsiveHandlers) {
            var each = responsiveHandlers[i];
            each.call();
        }
    }

    var handleResponsive = function () {
        handleTooltips();
        handleSidebarState();
        handleDesktopTabletContents();
        handleSidebarAndContentHeight();
        handleChoosenSelect();
        handleFixedSidebar();
        runResponsiveHandlers();
    }

    var handleResponsiveOnInit = function () {
        handleSidebarState();
        handleDesktopTabletContents();
        handleSidebarAndContentHeight();
    }

    var handleResponsiveOnResize = function () {
        var resize;
        if (isIE8) {
            var currheight;
            $(window).resize(function() {
                if(currheight == document.documentElement.clientHeight) {
                    return; //quite event since only body resized not window.
                }                
                if (resize) {
                    clearTimeout(resize);
                }   
                resize = setTimeout(function() {
                    handleResponsive();    
                }, 50); 
                currheight = document.documentElement.clientHeight; 
            });
        } else {
            $(window).resize(function() {
                if (resize) {
                    clearTimeout(resize);
                }   
                resize = setTimeout(function() {
                    handleResponsive();    
                }, 50); 
            });
        }   
    }

    var handleSidebarAndContentHeight = function () {
        var content = $('.page-content');
        var sidebar = $('.page-sidebar');
        var body = $('body');
        var height;
        content.removeAttr('style')
        if (body.hasClass("page-footer-fixed") === true && body.hasClass("page-sidebar-fixed") !== true) { // 固定脚部，但不固定边栏的情况下
            var available_height = $(window).height() - $('.footer').height();
            if (content.height() <  available_height) {
                content.attr('style', 'min-height:' + available_height + 'px !important');
            }
        } else {
            if (body.hasClass('page-sidebar-fixed')) {
                height = _calculateFixedSidebarViewportHeight();
            } else {
                height = sidebar.height() + 20;
            }
            if (height >= content.height() && body.hasClass("page-footer-fixed") !== true) {
                var h = _calculateFixedSidebarViewportHeight() - $('.footer').innerHeight()
                content.attr('style', 'min-height:' + h + 'px !important');
            } 
        }          
    }

    var handleSidebarMenu = function (hideOtherMenus) {
        jQuery('.page-sidebar').on('click', 'li > a', function (e) {
                if ($(this).next().hasClass('sub-menu') == false) {
                    if ($('.btn-navbar').hasClass('collapsed') == false) {
                        $('.btn-navbar').click();
                    }
                    return;
                }

                var parent = $(this).parent().parent();
                var the = $(this);
                // 箭头
                parent.children('li.open').children('a').children('.arrow').removeClass('open active');
                if(!!hideOtherMenus){ // 点击菜单不缩起其他菜单项
                    parent.children('li.open').children('.sub-menu').slideUp(200);
                }
                parent.children('li.open').removeClass('open');
                // parent.children('li.active').removeClass('active');

                var sub = jQuery(this).next();
                var slideOffeset = -200;
                var slideSpeed = 200;

                if (sub.is(":visible")) {
                    jQuery('.arrow', jQuery(this)).removeClass("open active");
                    jQuery(this).parent().removeClass("open");
                    sub.slideUp(slideSpeed, function () {
                        if ($('body').hasClass('page-sidebar-fixed') == false && $('body').hasClass('page-sidebar-closed') == false) {
                            App.scrollTo(the, slideOffeset);
                        }                       
                        handleSidebarAndContentHeight();
                    });
                } else {
                    jQuery('.arrow', jQuery(this)).addClass("open");
                    jQuery(this).parent().addClass("open");
                    sub.slideDown(slideSpeed, function () {
                        if ($('body').hasClass('page-sidebar-fixed') == false && $('body').hasClass('page-sidebar-closed') == false) {
                            App.scrollTo(the, slideOffeset);
                        }
                        handleSidebarAndContentHeight();
                    });
                }

                e.preventDefault();
            });

        
        jQuery('.page-sidebar').on('click', ' li > a.ajaxify', function (e) {
                e.preventDefault();
                App.scrollTop();

                var url = $(this).attr("href");
                var menuContainer = jQuery('.page-sidebar ul');
                var pageContent = $('.page-content');
                var pageContentBody = $('.page-content .page-content-body');

                menuContainer.children('li.active').removeClass('active');
                menuContainer.children('arrow.open').removeClass('open');

                $(this).parents('li').each(function () {
                        $(this).addClass('active');
                        $(this).children('a > span.arrow').addClass('open');
                    });
                $(this).parents('li').addClass('active');

                App.blockUI(pageContent, false);

                $.ajax({
                    type: "GET",
                    cache: false,
                    url: url,
                    dataType: "html",
                    success: function(res) 
                    {
                        App.unblockUI(pageContent);
                        pageContentBody.html(res);
                        App.fixContentHeight(); 
                        App.initUniform(); 
                    },
                    error: function(xhr, ajaxOptions, thrownError)
                    {
                        pageContentBody.html('<h4>Could not load the requested content.</h4>');
                        App.unblockUI(pageContent);
                    },
                    async: false
                });
        });
    }

    var _calculateFixedSidebarViewportHeight = function () {
        var sidebarHeight = $(window).height() - $('.header').height();
        if ($('body').hasClass("page-footer-fixed")) {
            sidebarHeight = sidebarHeight - $('.footer').height();
        }
        return sidebarHeight; 
    }

    var handleFixedSidebar = function () {
        var menu = $('.page-sidebar-menu');

        if (menu.parent('.slimScrollDiv').size() === 1) { 
            menu.slimScroll({
                destroy: true
            });
            menu.removeAttr('style');
            $('.page-sidebar').removeAttr('style');            
        }

        if ($('.page-sidebar-fixed').size() === 0) {
            handleSidebarAndContentHeight();
            return;
        }

        if ($(window).width() >= 980) {
            var sidebarHeight = _calculateFixedSidebarViewportHeight();

            menu.slimScroll({
                size: '7px',
                color: '#a1b2bd',
                opacity: .3,
                position: isRTL ? 'left' : ($('.page-sidebar-on-right').size() === 1 ? 'left' : 'right'),
                height: sidebarHeight,
                allowPageScroll: false,
                disableFadeOut: false
            });
            handleSidebarAndContentHeight();
        }
    }

    var handleFixedSidebarHoverable = function () {
        if ($('body').hasClass('page-sidebar-fixed') === false) {
            return;
        }

        $('.page-sidebar').off('mouseenter').on('mouseenter', function () {
            var body = $('body');

            if ((body.hasClass('page-sidebar-closed') === false || body.hasClass('page-sidebar-fixed') === false) || $(this).hasClass('page-sidebar-hovering')) {
                return;
            }

            body.removeClass('page-sidebar-closed').addClass('page-sidebar-hover-on');
            $(this).addClass('page-sidebar-hovering');                
            $(this).animate({
                width: sidebarWidth
            }, 300, '', function () {
                $(this).removeClass('page-sidebar-hovering');
            });
        });

        $('.page-sidebar').off('mouseleave').on('mouseleave', function () {
            var body = $('body');

            if ((body.hasClass('page-sidebar-hover-on') === false || body.hasClass('page-sidebar-fixed') === false) || $(this).hasClass('page-sidebar-hovering')) {
                return;
            }

            $(this).addClass('page-sidebar-hovering');
            $(this).animate({
                width: sidebarCollapsedWidth
            }, 300, '', function () {
                $('body').addClass('page-sidebar-closed').removeClass('page-sidebar-hover-on');
                $(this).removeClass('page-sidebar-hovering');
            });
        });
    }

    var handleSidebarToggler = function () {
        
        $('.page-sidebar').on('click', '.sidebar-toggler', function (e) {            
            var body = $('body');
            var sidebar = $('.page-sidebar');

            if ((body.hasClass("page-sidebar-hover-on") && body.hasClass('page-sidebar-fixed')) || sidebar.hasClass('page-sidebar-hovering')) {
                body.removeClass('page-sidebar-hover-on');
                sidebar.css('width', '').hide().show();
                e.stopPropagation();
                runResponsiveHandlers();
                return;
            }

            $(".sidebar-search", sidebar).removeClass("open");

            if (body.hasClass("page-sidebar-closed")) {
                body.removeClass("page-sidebar-closed");
                if (body.hasClass('page-sidebar-fixed')) {
                    sidebar.css('width', '');
                }
            } else {
                body.addClass("page-sidebar-closed");
            }
            runResponsiveHandlers();
        });

        
        $('.page-sidebar').on('click', '.sidebar-search .remove', function (e) {
            e.preventDefault();
            $('.sidebar-search').removeClass("open");
        });

        
        $('.page-sidebar').on('keypress', '.sidebar-search input', function (e) {
            if (e.which == 13) {
                window.location.href = "extra_search.html";
                return false; //<---- Add this line
            }
        });
    }

    var handleHorizontalMenu = function () {
        //handle hor menu search form toggler click
        $('.header').on('click', '.hor-menu .hor-menu-search-form-toggler', function (e) {
                if ($(this).hasClass('hide')) {
                    $(this).removeClass('hide');
                    $('.header .hor-menu .search-form').hide();
                } else {
                    $(this).addClass('hide');
                    $('.header .hor-menu .search-form').show();
                }
                e.preventDefault();
            });

        //handle hor menu search button click
        $('.header').on('click', '.hor-menu .search-form .btn', function (e) {
                window.location.href = "extra_search.html";
                e.preventDefault();
            });

        //handle hor menu search form on enter press
        $('.header').on('keypress', '.hor-menu .search-form input', function (e) {
                if (e.which == 13) {
                    window.location.href = "extra_search.html";
                    return false;
                }
            });
    }

    var handleGoTop = function () {
        /* set variables locally for increased performance */
        jQuery('.footer').on('click', '.go-top', function (e) {
            App.scrollTo();
            e.preventDefault();
        });
    }

    var handlePortletTools = function () {
        jQuery('body').on('click', '.portlet > .portlet-title > .tools > a.remove', function (e) {
            e.preventDefault();
            jQuery(this).closest(".portlet").remove();
        });

        jQuery('body').on('click', '.portlet > .portlet-title > .tools > a.reload', function (e) {
            e.preventDefault();
            var el = jQuery(this).closest(".portlet").children(".portlet-body");
            App.blockUI(el);
            window.setTimeout(function () {
                App.unblockUI(el);
            }, 1000);
        });

        jQuery('body').on('click', '.portlet > .portlet-title > .tools > .collapse, .portlet .portlet-title > .tools > .expand', function (e) {
            e.preventDefault();
            var el = jQuery(this).closest(".portlet").children(".portlet-body");
            if (jQuery(this).hasClass("collapse")) {
                jQuery(this).removeClass("collapse").addClass("expand");
                el.slideUp(200);
            } else {
                jQuery(this).removeClass("expand").addClass("collapse");
                el.slideDown(200);
            }
        });
    }

    var handleUniform = function () {
        if (!jQuery().uniform) {
            return;
        }
        var test = $("input[type=checkbox]:not(.toggle), input[type=radio]:not(.toggle, .star)");
        if (test.size() > 0) {
            test.each(function () {
                if ($(this).parents(".checker").size() == 0) {
                    $(this).show();
                    $(this).uniform();
                }
            });
        }
    }

    var handleAccordions = function () {
        $(".accordion").collapse().height('auto');
        var lastClicked;
        //add scrollable class name if you need scrollable panes
        jQuery('body').on('click', '.accordion.scrollable .accordion-toggle', function () {
            lastClicked = jQuery(this);
        }); //move to faq section

        jQuery('body').on('shown', '.accordion.scrollable', function () {
            jQuery('html,body').animate({
                scrollTop: lastClicked.offset().top - 150
            }, 'slow');
        });
    }

    var handleTabs = function () {

        
        var fixTabHeight = function(tab) {
            $(tab).each(function() {
                var content = $($($(this).attr("href")));
                var tab = $(this).parent().parent();
                if (tab.height() > content.height()) {
                    content.css('min-height', tab.height());    
                } 
            });            
        }

        
        $('body').on('shown', '.nav.nav-tabs.tabs-left a[data-toggle="tab"], .nav.nav-tabs.tabs-right a[data-toggle="tab"]', function(){
            fixTabHeight($(this)); 
        });

        $('body').on('shown', '.nav.nav-tabs', function(){
            handleSidebarAndContentHeight();
        });

        //fix tab contents for left/right tabs
        fixTabHeight('.nav.nav-tabs.tabs-left > li.active > a[data-toggle="tab"], .nav.nav-tabs.tabs-right > li.active > a[data-toggle="tab"]');

        //activate tab if tab id provided in the URL
        if(location.hash) {
            var tabid = location.hash.substr(1);
            $('a[href="#'+tabid+'"]').click();
        }
    }

    var handleScrollers = function () {
        $('.scroller').each(function () {
                var height;
                if ($(this).attr("data-height")) {
                    height = $(this).attr("data-height");
                } else {
                    height = $(this).css('height');
                }
                $(this).slimScroll({
                        size: '7px',
                        color: '#a1b2bd',
                        position: isRTL ? 'left' : 'right',
                        height:  height,
                        alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false),
                        railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false),
                        disableFadeOut: true
                    });
            });
    }

    var handleTooltips = function () {
        if (App.isTouchDevice()) { 
            jQuery('.tooltips:not(.no-tooltip-on-touch-device)').tooltip();
        } else {
            jQuery('.tooltips').tooltip();
        }
    }

    var handleDropdowns = function () {
        $('body').on('click', '.dropdown-menu.hold-on-click', function(e){
            e.stopPropagation();
        })
    }

    var handleModal = function () {
        
        if (jQuery().modalmanager) {
            return; 
        }

        $('body').on('shown', '.modal', function(e){
            $('body').addClass('modal-open');
        });

        $('body').on('hidden', '.modal', function(e){
            if ($('.modal').size() === 0) {
                $('body').removeClass('modal-open');
            }
        });
    }

    var handlePopovers = function () {
        jQuery('.popovers').popover();
        $(document).on('click.popover.data-api',function(e) {
            if(lastPopedPopover){
                lastPopedPopover.popover('hide');
            } 
        });
    }

    var handleChoosenSelect = function () {
        if (!jQuery().chosen) {
            return;
        }

        $(".chosen").each(function () {
            $(this).chosen({
                allow_single_deselect: $(this).attr("data-with-deselect") == "1" ? true : false
            });
        });
    }

    var handleFancybox = function () {
        if (!jQuery.fancybox) {
            return;
        }

        if (jQuery(".fancybox-button").size() > 0) {
            jQuery(".fancybox-button").fancybox({
                groupAttr: 'data-rel',
                prevEffect: 'none',
                nextEffect: 'none',
                closeBtn: true,
                helpers: {
                    title: {
                        type: 'inside'
                    }
                }
            });
        }
    }

    var handleFixInputPlaceholderForIE = function () {
        //fix html5 placeholder attribute for ie7 & ie8
        if (isIE8 || isIE9) { 
            
            jQuery('input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)').each(function () {

                var input = jQuery(this);

                if(input.val()=='' && input.attr("placeholder") != '') {
                    input.addClass("placeholder").val(input.attr('placeholder'));
                }

                input.focus(function () {
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                });

                input.blur(function () {                         
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.val(input.attr('placeholder'));
                    }
                });
            });
        }
    }

    var handleFullScreenMode = function() {
        function toggleFullScreen() {
          if (!document.fullscreenElement &&    
              !document.mozFullScreenElement && !document.webkitFullscreenElement) {  
            if (document.documentElement.requestFullscreen) {
              document.documentElement.requestFullscreen();
            } else if (document.documentElement.mozRequestFullScreen) {
              document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullscreen) {
              document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
            }
          } else {
            if (document.cancelFullScreen) {
              document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
              document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
              document.webkitCancelFullScreen();
            }
          }
        }

        $('#trigger_fullscreen').click(function() {
            toggleFullScreen();
        });
    }

    return {

        //main function to initiate template pages
        init: function () {
            handleTheme();
            handleInit();
            handleResponsiveOnResize(); 
            handleUniform();        
            handleScrollers(); 
            handleResponsiveOnInit(); 
            handleFixedSidebar(); 
            handleFixedSidebarHoverable(); 
            handleSidebarMenu(); 
            handleHorizontalMenu(); 
            handleSidebarToggler(); 
            handleFixInputPlaceholderForIE(); 
            handleGoTop(); 
            handlePortletTools(); 
            handleDropdowns(); 
            handleTabs(); 
            handleTooltips(); 
            handlePopovers(); 
            handleAccordions(); 
            handleChoosenSelect(); 
            handleModal();
            this.initFancybox();
            App.addResponsiveHandler(handleChoosenSelect); 
            handleFullScreenMode() 
            App.getExampleCode();
            window.prettyPrint && prettyPrint();
            App.goBack();
            App.hightlightNav();
            $.validator !== undefined && $.validator.setDefaults({
                errorElement: 'span', // 定义错误提示信息标签
                errorClass: 'help-inline', // 定义错误提示信息class
                focusInvalid: false, // do not focus the last invalid input
                highlight: function (element) { // 高亮输入框
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },
                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },
                ignore: "",
                errorPlacement: function(error,element){
                    if(element.is(':radio') || element.is(':checkbox') || element.hasClass('input-valid-block')){
                        element.closest('.controls').append(error.addClass('no-left-padding'));
                    } else{
                        error.insertAfter(element); // for other inputs, just perform default behavior
                    }
                },
                // messages: msg,
                success: function(label){
                    label.addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                        .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },
                // rules: rules,
                invalidHandler: function (event, validator) { //display error alert on form submit   
                    console.log('表单填写有误，请重新填写。')
                    // App.scrollTo($(form), -60);
                },
            });
        },

        fixContentHeight: function () {
            handleSidebarAndContentHeight();
        },

        setLastPopedPopover: function (el) {
            lastPopedPopover = el;
        },

        addResponsiveHandler: function (func) {
            responsiveHandlers.push(func);
        },

        
        setEqualHeight: function (els) {
            var tallestEl = 0;
            els = jQuery(els);
            els.each(function () {
                    var currentHeight = $(this).height();
                    if (currentHeight > tallestEl) {
                        tallestColumn = currentHeight;
                    }
                });
            els.height(tallestEl);
        },

        
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                    scrollTop: pos + (offeset ? offeset : 0)
                }, 'slow');
        },

        scrollTop: function () {
            App.scrollTo();
        },

        
        blockUI: function (el, centerY) {
            var el = jQuery(el); 
            el.block({
                    message: '<img src="./assets/img/ajax-loading.gif" align="" />',
                    centerY: centerY != undefined ? centerY : true,
                    css: {
                        top: '10%',
                        border: 'none',
                        padding: '2px',
                        backgroundColor: 'none'
                    },
                    overlayCSS: {
                        backgroundColor: '#000',
                        opacity: 0.05,
                        cursor: 'wait'
                    }
                });
        },

        
        unblockUI: function (el) {
            jQuery(el).unblock({
                    onUnblock: function () {
                        jQuery(el).removeAttr("style");
                    }
                });
        },

        
        initUniform: function (els) {

            if (els) {
                jQuery(els).each(function () {
                        if ($(this).parents(".checker").size() == 0) {
                            $(this).show();
                            $(this).uniform();
                        }
                    });
            } else {
                handleUniform();
            }

        },

        updateUniform : function(els) {
            $.uniform.update(els);
        },

        
        initChosenSelect: function (els) {
            $(els).chosen({
                    allow_single_deselect: true
                });
        },

        initFancybox: function () {
            handleFancybox();
        },

        getActualVal: function (el) {
            var el = jQuery(el);
            if (el.val() === el.attr("placeholder")) {
                return "";
            }

            return el.val();
        },

        getURLParameter: function (paramName) {
            var searchString = window.location.search.substring(1),
                i, val, params = searchString.split("&");

            for (i = 0; i < params.length; i++) {
                val = params[i].split("=");
                if (val[0] == paramName) {
                    return unescape(val[1]);
                }
            }
            return null;
        },

        
        isTouchDevice: function () {
            try {
                document.createEvent("TouchEvent");
                return true;
            } catch (e) {
                return false;
            }
        },

        isIE8: function () {
            return isIE8;
        },

        isRTL: function () {
            return isRTL;
        },

        getLayoutColorCode: function (name) {
            if (layoutColorCodes[name]) {
                return layoutColorCodes[name];
            } else {
                return '';
            }
        },
        
        escapeHtml: function(){
            var code = $('.source-code-inline');
            code.each(function(){
                var val = $(this).val();
                if(val !== ''){
                    var elem = document.createElement('div');
                    var txt = document.createTextNode(val);
                    elem.appendChild(txt);
                    $(this).hide().after('<pre class="prettyprint mt10 linenums">' + elem.innerHTML + '</pre>');
                }
            })
        }(),

        // 输出源码
        getExampleCode: function(){
            var textarea = $('.code-placeholder');
            textarea.each(function(){
                var val = $(this).val();
                if(val !== ''){
                    var html = (val.replace(/</g,'&lt;')).replace(/>/g,'&gt;');
                    $(this).hide().after('<pre class="prettyprint linenums">' + html + '</pre>');
                }
            })
        },

        // Chrome 通知
        notify: function(title,content,link){
            var _this = this;
            if(window.webkitNotifications) {
                if(window.webkitNotifications.checkPermission() === 0){
                    var notification_test = window.webkitNotifications.createNotification("assets/img/icon/icon-notify.png", title, content);
                    notification_test.display = function(){}
                    notification_test.onerror = function(){}
                    notification_test.onclose = function(){}
                    notification_test.onclick = function(){
                        link !== undefined && window.open(link,title);
                    }
                    // notification_test.replaceId = 'zenglican';
                    notification_test.show();
                }else {
                    window.webkitNotifications.requestPermission(_this.notify);
                }
            } else if(Notification){
                console.log('ff')
                Notification.requestPermission(function(perm) {
                    if(perm === 'granted'){
                        var notification = new Notification(title, {
                            dir: "auto",
                            lang: "",
                            icon: "assets/img/icon/icon-notify.png",
                            body: content,
                            tag: ""
                        })
                        notification.onclick = function(){
                            link !== undefined && window.open(link,title);
                        }
                    }
                })
                

                // notification.onclose = …
                // notification.onshow = …
                // notification.onerror = …
            }
        },
        // 表单验证 须引入
        // <script src="assets/plugins/jquery-validation/dist/jquery.validate.js"></script>
        // <script src="assets/plugins/jquery-validation/dist/additional-methods.js"></script>
        /**
        * App.validate('#form-sample',doSomethingFunction,{
            user_name: { required:true},
            email: { required:true, email:true}
        })
        */
        validate: function(form,callback,rules,msg){ // rules = 验证规则
            console.log(form)
            if(msg === undefined){
                msg === {};
            }
            var form_validate = $(form).validate({
                messages: msg,
                rules: rules,
                invalidHandler: function (event, validator) { //display error alert on form submit   
                    console.log('表单填写有误，请重新填写。')
                    App.scrollTo($(form), -60);
                },
                submitHandler: function (form) {
                    console.log('验证成功');
                    // 将表单数据提交到后台 do something
                    callback && callback();
                }
            })
            return form_validate;
        },

        // 返回上一页
        goBack: function(){
            var trigger = $('.J_goBack');
            if(trigger[0]){
                $('.J_goBack').on('click',function(){
                    window.history.back();
                    return false;
                })
            }
        },

        // 高亮展开当前导航 by zenglican 2014-01-21 11:19:04
        hightlightNav: function(){
            var pathname = location.pathname;
            // console.log(pathname);
        },
        /** * 联系人下拉提示框 by zenglican 2014-01-15 18:20:49
            * contactsComplete.init(elem,url,opts)
            * elem 需要下拉提示的元素,如select，input,'#select-box','.contacts-list'
            * url 自动提示的url
            * opts = { //默认值 opts 可传可不传
            *   placeholder : '请选择联系人',
            *   minimumInputLength : '4',
            *   multiple : true
            * }
        */
        contactsComplete : {
            format:function(item){
                return item.nick_name + ' ' + item.user_name;
            },
            init: function(elem,url,opts){
                var that = this;
                $(elem).select2({
                    placeholder: opts !== undefined && opts.placeholder !== undefined ? opts.placeholder : "选择联系人",
                    minimumInputLength: opts !== undefined && opts.minimumInputLength !== undefined ? opts.minimumInputLength : 4,
                    multiple: opts !== undefined && opts.multiple !== undefined ? opts.multiple : true,
                    allowClear: opts !== undefined && opts.allowClear !== undefined ? opts.allowClear : true,
                    id:function(item){
                        return item.user_name;
                    },
                    ajax: { 
                        url: url,
                        dataType: opts.dataType || 'jsonp',
                        data: function (term, page) {
                            return {
                                key: term,
                                fuzzy: 1 // 0 精确搜索， 1 模糊搜索
                            }
                        },
                        results: function (data, page) { 
                            return {results: data.object};
                        }
                    },
                    initSelection:function(element, callback){
                        var v = element.val();
                        if(v !== ''){
                            $.ajax({
                                url:url,
                                dataType:'jsonp',
                                data:{key:v,fuzzy:0}
                            }).done(function(data) { 
                                if(opts.multiple === false){
                                    callback(data.object[0]); 
                                } else{
                                    callback(data.object); 
                                }
                            });
                        }
                    },
                    formatResult: that.format, 
                    formatSelection: that.format,
                    escapeMarkup: function (m) { console.log(m); return m; } 
                })
            }
        },
        openNewWindow:function(url,name,param){
            return window.open(url,name,param);
        },
        // 表头checkbox过滤功能，基于datatables 1.10以上版本
        multyValueFilter:function(oTable,indexArray){
            // oTable 基于1.9以前的api
            if(!oTable.api()){
                alert('dataTables 版本需要1.10以上')
                return;
            }
            var aoColumns = []
            $.each(indexArray,function(i,n){
                aoColumns[n] = {type: "checkbox", values:oTable.api().column(n).data().unique().sort()}
            })
            console.log(oTable)
            oTable.columnFilter({
                sPlaceHolder:'head:after',
                aoColumns:aoColumns
            })
        }
    }


}();
// 控制chrome控制台功能，能够保持数组、对象等元素，方便复制数据。 2014-05-22 18:47:07
;(function(console){
console.o = function(data){
    if(typeof data === "object"){
        console.log(JSON.stringify(data, undefined, 4))
    }
}
console.save = function(data, filename){

    if(!data) {
        console.error('Console.save: No data')
        return;
    }

    if(!filename) filename = 'console.json'

    if(typeof data === "object"){
        data = JSON.stringify(data, undefined, 4)
    }

    var blob = new Blob([data], {type: 'text/json'}),
        e    = document.createEvent('MouseEvents'),
        a    = document.createElement('a')

    a.download = filename
    a.href = window.URL.createObjectURL(blob)
    a.dataset.downloadurl =  ['text/json', a.download, a.href].join(':')
    e.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null)
    a.dispatchEvent(e)
 }
})(console)
