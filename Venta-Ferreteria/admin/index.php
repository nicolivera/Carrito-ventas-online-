<?php
include "../configs/config.php";
include "../configs/funciones.php";

if(isset($logear)){
  $username = clear($username);
  $password = clear($password);

  $q = $mysqli->query("SELECT * FROM admins WHERE username = '$username' AND password = '$password'");

  if(mysqli_num_rows($q)>0){
    $r = mysqli_fetch_array($q);
    $_SESSION['id'] = $r['id'];
    redir("./");
  }else{
    alert("Los datos no son validos");
    redir("./");
  }


}


if(!isset($_SESSION['id'])){
  ?>
  <!DOCTYPE html>
  <html>
  <head>
    <title>Admin Panel</title>
  </head>
  <body style="background: #08f;color:#fff">
     <center>
        <form style="padding-top:10%;" method="post" action="">
          <div class="centrar_login">
            <label><h2><i class="fa fa-key"></i> Iniciar Sesión Como Administrador</h2></label>
            <div class="form-group">
              <input style="padding:10px;color:#333;width:40%" type="text" class="form-control" placeholder="Usuario" name="username"/>
            </div>

            <div class="form-group">
              <input style="padding:10px;color:#333;width:40%" type="password" class="form-control" placeholder="Contraseña" name="password"/>
            </div>
            <br><br>

            <div class="form-group">
              <button name="logear" type="submit"><i class="fa fa-sign-in"></i> Ingresar</button>
            </div>
          </div>
        </form>
      </center>
  </body>
  </html>
  <?php
  die();
}
?>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="avatars/avatar.jpg" style="width:35px;height:35px;" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?=admin_name_connected()?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MENU</li>
        
        <li>
          <a href="./">
            <i class="fa fa-th"></i> <span>Principal</span>
          </a>
        </li>

        
        <li>
          <a href="./?p=agregar_producto">
            <i class="fa fa-th"></i> <span>Agregar Productos</span>
          </a>
        </li>
        
        <li>
          <a href="./?p=agregar_categoria">
            <i class="fa fa-th"></i> <span>Agregar Categoria</span>
          </a>
        </li>
        
        <li>
          <a href="./?p=manejar_tracking">
            <i class="fa fa-th"></i> <span>Manejar Tracking</span>
          </a>
        </li>
        
        <li>
          <a href="./?p=pagos">
            <i class="fa fa-th"></i> <span>Pagos</span>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

