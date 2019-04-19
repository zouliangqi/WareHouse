<?php
    header("Content-type:text/html; charset=UTF-8");
    include "conn.php";
    session_start();
    $ano = @$_SESSION['administrator_ano'];
?>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>SUPER ADMINISTRATOR</title>
    
    <link rel="stylesheet" type="text/css" href="./buyer_css/nav.css">
    <link rel="stylesheet" type="text/css" href="./buyer_css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="./buyer_css/myself.css"><link rel="stylesheet" type="text/css" href="./buyer_css/myself.css">
    <script src="./buyer_css/hm.js"></script><script type="text/javascript" src="./buyer_css/jquery.min.js"></script>
    <script type="text/javascript" src="./buyer_css/nav.js"></script>
    
</head>
<body style="">
    <div class="table_right">
      <?php
    $select_ano = "select * from {$db_name}.administrator where ano= '{$ano}' ";
    $check_query = mysqli_query($link,$select_ano) or die(mysqli_error($link));
    $row = mysqli_fetch_assoc($check_query);
      echo "<p>";
      echo"<table  border=1>";
      echo"<tr><td>管理员号</td><td>姓名</td><td>密码</td><td>ip地址</td><td>状态</td><td>备注</td><td>等级</td></tr>";
      echo"<tr >";
      echo"<td>".$row['ano']."</td>";
      echo"<td>".$row['aname']."</td>";
      echo"<td>".$row['apassword']."</td>";
      echo"<td>".$row['aip']."</td>";
      echo"<td>".$row['astatus']."</td>";
      echo"<td>".$row['aremark']."</td>";
      echo"<td>".$row['alevel']."</td>";
      echo"</tr>";
      echo"</table>";
      mysqli_close($link);
      ?>
    </div>
    <div class="nav">
        <div class="nav-top">
            <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="./buyer_css/mini.png"></div>
        </div>
        <ul>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span>管理员信息</span><i class="my-icon nav-more"></i></a>
                <ul style="display: none;">
                    <li><a href="super_administrator_1_1.php"><span>自己的信息</span></a></li>
                    <li><a href="super_administrator_1_2.php"><span>信息修改</span></a></li>
                </ul>
            </li>
            <li class="nav-item" nav-show>
                <a href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span>管理员与仓库</span><i class="my-icon nav-more"></i></a>
                <ul style="display: none;">
                    <li><a href="super_administrator_2_1.php"><span>管理员权限修改</span></a></li>
                    <li><a href="super_administrator_2_2.php"><span>供应商信息</span></a></li>
                    <li><a href="super_administrator_2_3.php"><span>仓库属性修改</span></a></li>
                </ul>
            </li>
        </ul>
    </div>



</body>
</html>