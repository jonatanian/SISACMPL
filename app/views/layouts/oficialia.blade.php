<!DOCTYPE html>
<html>

<head>
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <title>SISA-CMPL | Instituto Politécnico Nacional</title>
  <meta name="keywords" content="SISA-CMPL-IPN" />
  <meta name="description" content="Sistema de Admininistración del Centro Mexicano para la Producción más Limpia del IPN">
  <meta name="author" content="Oscar Alcántara Carrillo, Jonatan Ian Castañeda Chavero">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
   {{HTML::style("avalon/css/styles.css")}}
   {{HTML::style("http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css")}}

  <!-- Font CSS (Via CDN) -->
  {{HTML::style("http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700")}}
  <!-- FullCalendar Plugin CSS -->
  {{HTML::style("vendor/plugins/fullcalendar/fullcalendar.min.css")}}
  <!-- Theme CSS -->
  {{HTML::style("assets/skin/default_skin/css/theme.css")}}
  <!-- Admin Forms CSS -->
  {{HTML::style("assets/admin-tools/admin-forms/css/admin-forms.min.css")}}
  <!-- Favicon -->
  {{HTML::style("assets/img/favicon.ico")}}
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  
  <![endif]-->

</head>

<body class="dashboard-page">

<!-------------------------------------------------------------+ 
  <body> Helper Classes: 
---------------------------------------------------------------+ 
  '.sb-l-o' - Sets Left Sidebar to "open"
  '.sb-l-m' - Sets Left Sidebar to "minified"
  '.sb-l-c' - Sets Left Sidebar to "closed"

  '.sb-r-o' - Sets Right Sidebar to "open"
  '.sb-r-c' - Sets Right Sidebar to "closed"
---------------------------------------------------------------+
 Example: <body class="example-page sb-l-o sb-r-c">
 Results: Sidebar left Open, Sidebar right Closed
--------------------------------------------------------------->
  <!-- Start: Main -->
  <div id="main">

    <!-----------------------------------------------------------------+ 
       ".navbar" Helper Classes: 
    -------------------------------------------------------------------+ 
       * Positioning Classes: 
        '.navbar-static-top' - Static top positioned navbar
        '.navbar-static-top' - Fixed top positioned navbar

       * Available Skin Classes:
         .bg-dark    .bg-primary   .bg-success   
         .bg-info    .bg-warning   .bg-danger
         .bg-alert   .bg-system 
    -------------------------------------------------------------------+
      Example: <header class="navbar navbar-fixed-top bg-primary">
      Results: Fixed top navbar with blue background 
    ------------------------------------------------------------------->

    <!-- Start: Header -->
    <header class="navbar navbar-fixed-top bg-success">
      <div class="navbar-branding">
        <a class="navbar-brand" href="#">
          <img src="{{asset('images/LogoSISAv4.png')}}" alt="SISA CMPL" height="60px">
        </a>
        <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
      </div>
      
      <ul class="nav navbar-nav navbar-left">
        <li class="hidden-xs">
          <span class="fs26">Sistema de Administración del CMPL</span>
        </li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
	  <li class="menu-divider hidden-xs">
          <i class="fa fa-circle"></i>
        </li>
        <li class="dropdown menu-merge">
          <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
          	<img src="{{asset('images/placeholder.png')}}" alt="avatar" class="mw30 br64">
          	<span class="hidden-xs pl15">{{Auth::User()->getNombreCompleto()}}</span>
            <span class="caret caret-tp hidden-xs"></span>
          </a>
          <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-envelope"></span> Mensajes
              </a>
            </li>
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-bell"></span> Notificaciones </a>
            </li>
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-gear"></span>Configuración</a>
            </li>
            <li class="dropdown-footer">
              <a href="{{action('LoginController@logout')}}" class="">
              <span class="fa fa-power-off pr5"></span>Cerrar sesión</a>
            </li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- End: Header -->

    <!-----------------------------------------------------------------+ 
       "#sidebar_left" Helper Classes: 
    -------------------------------------------------------------------+ 
       * Positioning Classes: 
        '.affix' - Sets Sidebar Left to the fixed position 

       * Available Skin Classes:
         .sidebar-dark (default no class needed)
         .sidebar-light  
         .sidebar-light.light   
    -------------------------------------------------------------------+
       Example: <aside id="sidebar_left" class="affix sidebar-light">
       Results: Fixed Left Sidebar with light/white background
    ------------------------------------------------------------------->

    <!-- Start: Sidebar -->
    <aside id="sidebar_left" class="nano nano-light affix">

      <!-- Start: Sidebar Left Content -->
      <div class="sidebar-left-content nano-content">

        <!-- Start: Sidebar Header -->
        <header class="sidebar-header">

          <!-- Sidebar Widget - Author -->
          <div class="sidebar-widget author-widget">
            <div class="media">
              <a class="media-left" href="#">
                <img src="{{asset('images/placeholder.png')}}" alt="Usuario" class="img-responsive">
              </a>
              <div class="media-body">
                <div class="media-links">
                   <p class="sidebar-menu-toggle">Bienvenido</p>
                </div>
                <div class="media-author">{{Auth::User()->getNombreCompleto()}}</div>
              </div>
            </div>
          </div>

          <!-- Sidebar Widget - Search (hidden) -->
          <div class="sidebar-widget search-widget hidden">
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
              <input type="text" id="sidebar-search" class="form-control" placeholder="Buscar...">
            </div>
          </div>

        </header>
        <!-- End: Sidebar Header -->

        <!-- Start: Sidebar Menu -->
        <ul class="nav sidebar-menu">
          <li class="sidebar-label pt20">Men&uacute;</li>
          <li>
            <a href="http://www.sidirtel.ipn.mx" target="_blank">
              <span class="fa fa-users"></span>
              <span class="sidebar-title">Directorio IPN</span>
            </a>
          </li>
          <li>
            <a href="http://148.204.90.213/Directorio/Directorio.html" target="_blank">
              <span class="glyphicon glyphicon-book"></span>
              <span class="sidebar-title">Directorio CMPL</span>
            </a>
          </li>
          <li class="active">
            <a href="{{action('SIGController@SIG_index')}}" target="_blank">
              <span class="glyphicon glyphicon-book"></span>
              <span class="sidebar-title">SIG</span>
            </a>
          </li>
          
          <!-- sidebar resources -->
          <li class="sidebar-label pt15">Control de correspondencia</li>
          <li>
            <a class="accordion-toggle" href="#">
              <span class="fa fa-envelope"></span>
              <span class="sidebar-title">Oficios</span>
              <span class="caret"></span>
            </a>
            <ul class="nav sub-nav">
              <li>
                  <a href="{{action('OficiosController@oficialia_recibidos')}}">
                  <span class="fa fa-send-o"></span> Oficios entrantes </a>
              </li>
              <li>
                  <a href="{{action('OficiosController@oficialia_enviados')}}">
                  <span class="fa fa-send"></span> Oficios salientes </a>
              </li>
              <li>
                  <a href="{{action('OficiosController@oficialia_oficios_por_validar')}}">
                  <span class="fa fa-send"></span> Oficios por validar </a>
              </li>
            </ul>
          
          
          <li>
            <a class="accordion-toggle" href="#">
              <span class="fa fa-envelope-o"></span>
              <span class="sidebar-title">Memorándums</span>
              <span class="caret"></span>
            </a>
            <ul class="nav sub-nav">
              <li>
                <a href="{{action('MemosController@oficialia_recibidos')}}">
                  <span class="fa fa-send"></span>Memos recibidos </a>
              </li>
              <li>
                <a href="{{action('MemosController@oficialia_enviados')}}">
                  <span class="fa fa-send-o"></span>Memos enviados </a>
              </li>
              <li>
            </ul>
          </li>

          <!-- sidebar bullets -->
          <li class="sidebar-label pt20">CMPL</li>
          <li class="sidebar-proj">
            <a href="#projectOne">
              <span class="fa fa-dot-circle-o text-primary"></span>
              <span class="sidebar-title">Avisos</span>
            </a>
          </li>
          <li class="sidebar-proj">
            <a href="#projectTwo">
              <span class="fa fa-dot-circle-o text-info"></span>
              <span class="sidebar-title">Galería fotográfica</span>
            </a>
          </li>
          <li class="sidebar-proj">
            <a href="#projectTwo">
              <span class="fa fa-dot-circle-o text-danger"></span>
              <span class="sidebar-title">Cursos</span>
            </a>
          </li>
          <li class="sidebar-proj">
            <a href="#projectThree">
              <span class="fa fa-dot-circle-o text-warning"></span>
              <span class="sidebar-title">Material de apoyo</span>
            </a>
          </li>

	      <!-- Start: Sidebar Collapse Button -->
	      <div class="sidebar-toggle-mini">
	        <a href="#">
	          <span class="fa fa-sign-out"></span>
	        </a>
	      </div>
	      <!-- End: Sidebar Collapse Button -->
		</ul>
      </div>
      <!-- End: Sidebar Left Content -->

    </aside>
    <!-- End: Sidebar Left -->

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">
     
      <div class="panel-body">
            @if(Session::has('msg'))
                <div class="alert alert-system">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    {{Session::get('msg')}}
                </div>
            @endif
            @if(Session::has('msgf'))
                <div class="alert alert-warning">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    {{Session::get('msgf')}}
                </div>
            @endif
          @yield('content')
      </div>
      
      <!-- Begin: Page Footer -->
      <footer id="content-footer" class="affix">
        <div class="row">
          <div class="col-md-6">
            <span class="footer-legal">© 2015 ESCOM - IPN</span>
          </div>
        </div>
      </footer>
      <!-- End: Page Footer -->

    </section>
    <!-- End: Content-Wrapper -->

  </div>
  <!-- End: Main -->

  <!-- BEGIN: PAGE SCRIPTS -->
	

	
  <!-- jQuery -->
  
  {{HTML::script('vendor/jquery/jquery-1.11.1.min.js')}}
  
  {{HTML::script('vendor/jquery/jquery_ui/jquery-ui.min.js')}}

  <!-- HighCharts Plugin -->
  
  {{HTML::script('vendor/plugins/highcharts/highcharts.js')}}

  <!-- JvectorMap Plugin + US Map (more maps in plugin/assets folder) -->
  
  {{HTML::script('vendor/plugins/jvectormap/jquery.jvectormap.min.js')}}
  
  {{HTML::script('vendor/plugins/jvectormap/assets/jquery-jvectormap-us-lcc-en.js')}}

  <!-- FullCalendar Plugin + moment Dependency -->
  
  {{HTML::script('vendor/plugins/fullcalendar/lib/moment.min.js')}}
  
  {{HTML::script('vendor/plugins/fullcalendar/fullcalendar.min.js')}}

  <!-- Theme Javascript -->
  
  {{HTML::script('assets/js/utility/utility.js')}}
  
  {{HTML::script('assets/js/demo/demo.js')}}
 
  {{HTML::script('assets/js/main.js')}}

  <!-- Widget Javascript -->
 
  {{HTML::script('assets/js/demo/widgets.js')}}
  
  @yield('scripts')
  
  <script type="text/javascript">
 
  jQuery(document).ready(function() {

    "use strict";

    // Init Demo JS  
    //Demo.init();
 

    // Init Theme Core    
    Core.init();


    // Init Widget Demo JS
    // demoHighCharts.init();

    // Because we are using Admin Panels we use the OnFinish 
    // callback to activate the demoWidgets. It's smoother if
    // we let the panels be moved and organized before 
    // filling them with content from various plugins

    // Init plugins used on this page
    // HighCharts, JvectorMap, Admin Panels

    // Init Admin Panels on widgets inside the ".admin-panels" container
    $('.admin-panels').adminpanel({
      grid: '.admin-grid',
      draggable: true,
      preserveGrid: true,
      // mobile: true,
      onStart: function() {
        // Do something before AdminPanels runs
      },
      onFinish: function() {
        $('.admin-panels').addClass('animated fadeIn').removeClass('fade-onload');

        // Init the rest of the plugins now that the panels
        // have had a chance to be moved and organized.
        // It's less taxing to organize empty panels
        demoHighCharts.init();
        runVectorMaps(); // function below
      },
      onSave: function() {
        $(window).trigger('resize');
      }
    });


    // Init plugins for ".calendar-widget"
    // plugins: FullCalendar
    //
    $('#calendar-widget').fullCalendar({
      // contentHeight: 397,
      editable: true,
      events: [{
          title: 'Sony Meeting',
          start: '2015-05-1',
          end: '2015-05-3',
          className: 'fc-event-success',
        }, {
          title: 'Conference',
          start: '2015-05-11',
          end: '2015-05-13',
          className: 'fc-event-warning'
        }, {
          title: 'Lunch Testing',
          start: '2015-05-21',
          end: '2015-05-23',
          className: 'fc-event-primary'
        },
      ],
      eventRender: function(event, element) {
        // create event tooltip using bootstrap tooltips
        $(element).attr("data-original-title", event.title);
        $(element).tooltip({
          container: 'body',
          delay: {
            "show": 100,
            "hide": 200
          }
        });
        // create a tooltip auto close timer  
        $(element).on('show.bs.tooltip', function() {
          var autoClose = setTimeout(function() {
            $('.tooltip').fadeOut();
          }, 3500);
        });
      }
    });


    // Init plugins for ".task-widget"
    // plugins: Custom Functions + jQuery Sortable
    //
    var taskWidget = $('div.task-widget');
    var taskItems = taskWidget.find('li.task-item');
    var currentItems = taskWidget.find('ul.task-current');
    var completedItems = taskWidget.find('ul.task-completed');

    // Init jQuery Sortable on Task Widget
    taskWidget.sortable({
      items: taskItems, // only init sortable on list items (not labels)
      handle: '.task-menu',
      axis: 'y',
      connectWith: ".task-list",
      update: function( event, ui ) {
        var Item = ui.item;
        var ParentList = Item.parent();

        // If item is already checked move it to "current items list"
        if (ParentList.hasClass('task-current')) {
            Item.removeClass('item-checked').find('input[type="checkbox"]').prop('checked', false);
        }
        if (ParentList.hasClass('task-completed')) {
            Item.addClass('item-checked').find('input[type="checkbox"]').prop('checked', true);
        }

      }
    });

    // Custom Functions to handle/assign list filter behavior
    taskItems.on('click', function(e) {
      e.preventDefault();
      var This = $(this);
      var Target = $(e.target);

      if (Target.is('.task-menu') && Target.parents('.task-completed').length) {
        This.remove();
        return;
      }

      if (Target.parents('.task-handle').length) {
		      // If item is already checked move it to "current items list"
		      if (This.hasClass('item-checked')) {
		        This.removeClass('item-checked').find('input[type="checkbox"]').prop('checked', false);
		      }
		      // Otherwise move it to the "completed items list"
		      else {
		        This.addClass('item-checked').find('input[type="checkbox"]').prop('checked', true);
		      }
      }

    });


    var highColors = [bgSystem, bgSuccess, bgWarning, bgPrimary];

    // Chart data
    var seriesData = [{
      name: 'Phones',
      data: [5.0, 9, 17, 22, 19, 11.5, 5.2, 9.5, 11.3, 15.3, 19.9, 24.6]
    }, {
      name: 'Notebooks',
      data: [2.9, 3.2, 4.7, 5.5, 8.9, 12.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
    }, {
      name: 'Desktops',
      data: [15, 19, 22.7, 29.3, 22.0, 17.0, 23.8, 19.1, 22.1, 14.1, 11.6, 7.5]
    }, {
      name: 'Music Players',
      data: [11, 6, 5, 15, 17.0, 22.0, 30.8, 24.1, 14.1, 11.1, 9.6, 6.5]
    }];

    var ecomChart = $('#ecommerce_chart1');
    if (ecomChart.length) {
      ecomChart.highcharts({
        credits: false,
        colors: highColors,
        chart: {
          backgroundColor: 'transparent',
          className: '',
          type: 'line',
          zoomType: 'x',
          panning: true,
          panKey: 'shift',
          marginTop: 45,
          marginRight: 1,
        },
        title: {
          text: null
        },
        xAxis: {
          gridLineColor: '#EEE',
          lineColor: '#EEE',
          tickColor: '#EEE',
          categories: ['Jan', 'Feb', 'Mar', 'Apr',
            'May', 'Jun', 'Jul', 'Aug',
            'Sep', 'Oct', 'Nov', 'Dec'
          ]
        },
        yAxis: {
          min: 0,
          tickInterval: 5,
          gridLineColor: '#EEE',
          title: {
            text: null,
          }
        },
        plotOptions: {
          spline: {
            lineWidth: 3,
          },
          area: {
            fillOpacity: 0.2
          }
        },
        legend: {
          enabled: true,
          floating: false,
          align: 'right',
          verticalAlign: 'top',
          x: -15
        },
        series: seriesData
      });
    }

    // Widget VectorMap
    function runVectorMaps() {

      // Jvector Map Plugin
      var runJvectorMap = function() {
        // Data set
        var mapData = [900, 700, 350, 500];
        // Init Jvector Map
        $('#WidgetMap').vectorMap({
          map: 'us_lcc_en',
          //regionsSelectable: true,
          backgroundColor: 'transparent',
          series: {
            markers: [{
              attribute: 'r',
              scale: [3, 7],
              values: mapData
            }]
          },
          regionStyle: {
            initial: {
              fill: '#E8E8E8'
            },
            hover: {
              "fill-opacity": 0.3
            }
          },
          markers: [{
            latLng: [37.78, -122.41],
            name: 'San Francisco,CA'
          }, {
            latLng: [36.73, -103.98],
            name: 'Texas,TX'
          }, {
            latLng: [38.62, -90.19],
            name: 'St. Louis,MO'
          }, {
            latLng: [40.67, -73.94],
            name: 'New York City,NY'
          }],
          markerStyle: {
            initial: {
              fill: '#a288d5',
              stroke: '#b49ae0',
              "fill-opacity": 1,
              "stroke-width": 10,
              "stroke-opacity": 0.3,
              r: 3
            },
            hover: {
              stroke: 'black',
              "stroke-width": 2
            },
            selected: {
              fill: 'blue'
            },
            selectedHover: {}
          },
        });
        // Manual code to alter the Vector map plugin to 
        // allow for individual coloring of countries
        var states = ['US-CA', 'US-TX', 'US-MO',
          'US-NY'
        ];
        var colors = [bgInfo, bgPrimaryLr, bgSuccessLr, bgWarningLr];
        var colors2 = [bgInfo, bgPrimary, bgSuccess, bgWarning];
        $.each(states, function(i, e) {
          $("#WidgetMap path[data-code=" + e + "]").css({
            fill: colors[i]
          });
        });
        $('#WidgetMap').find('.jvectormap-marker')
          .each(function(i, e) {
            $(e).css({
              fill: colors2[i],
              stroke: colors2[i]
            });
          });
      }

      if ($('#WidgetMap').length) {
        runJvectorMap();
      }
    }

  });
  </script>
  <!-- END: PAGE SCRIPTS -->

</body>

</html>
