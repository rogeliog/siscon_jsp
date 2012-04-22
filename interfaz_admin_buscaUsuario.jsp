<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ADMIN</title>
<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css" media="all">
body {
   padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
}
.row-fluid{padding-top:10px; padding:5px;}
.row-fluid strong {color:#3D474C; width:100%; border-bottom:1px dotted #3D474C;}
.container-fluid{padding:8px;}
.container-fluid b{font-family:BlueHighway; color:#FF0000; font-size:18px;}
.container-fluid .arrow {font-family:Vonnes Bold Compressed;  color:#FF0000; font-size:18px;}
.navbar-inner .container {width:80%;}
.nav li {padding:5px;}
.nav li a {padding:0px; margin:0px;}
.twitter-follow-button {padding-top:5px;}
.stdspacing{padding-top:5px;}
.btn-success{font-weight:bold; background-image:none; background:#5bb75b; padding-left:10px; padding-right:10px;}
.sep{background:#ccc url(sep.png) repeat-x; border-top:1px solid #ccc; width:100%; height:15px;}
.bar, .progress{background-image:none;}
</style>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>
</head>
<body>

<div class="container-fluid">
  <form class="form-search">
  	<fieldset>
    	<div class="well">
    	<legend>Búsqueda de Usuarios por Nombre</legend>
  		<label class="control-label" for="nombreUsuario">Nombre de Usuario</label>
    	<input type="text" id="nombreUsuario" class="input-medium search-query">
    	<button type="submit" class="btn">Buscar</button>
        </div>
    </fieldset>
  </form>
  <form class="form-horizontal">
      <fieldset>
      	<div class="well">
        <legend>Búsqueda Avanzada</legend>
        <div class="control-group">
          <label class="control-label" for="input03">Buscar usuarios por Rol</label>
          <div class="controls">
            <select class="input-xlarge" id="input03">
              <option>Profesor(a)</option>
              <option>Director(a) de Carrera</option>
              <option>Directora(a) de Departamento</option>
            </select>
            <p class="help-block">&nbsp;</p>
          </div>
        </div>
        </div>
        <div class="form-actions">
          <button type="submit" class="btn btn-primary">Buscar</button>
          <button class="btn">Cancelar</button>
        </div>
      </fieldset>
</form>
</div>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap-transition.js"></script>
    <!--
    <script src="js/bootstrap-alert.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/bootstrap-scrollspy.js"></script>
    <script src="js/bootstrap-tab.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-button.js"></script>-->
    <script src="assets/js/bootstrap-collapse.js"></script><!--
    <script src="js/bootstrap-carousel.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>
    -->
</body>
</html>
