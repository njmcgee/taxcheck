<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="Content-Language" content="en" />		
	
	<title>Taxcheck</title>
</head>

<body class="home">
	<div>

    <?php     

      $tax = $_POST['tax'];

      $defence = array(
      	'title'	=> 'Defence',
      	'factor'	=> '.30',
      );
      
      $social_security = array(
      	'title'	=> 'Social Security',
      	'factor'	=> '.60',
      );
      
      $other = array(
      	'title'	=> 'Other',
      	'factor'	=> '.1',
      );
      
      $def = $tax * $defence['factor'];      
      echo "<p>You spend $def on Social Security";     
     
      $ss = $tax * $social_security['factor'];      
      echo "<p>You spend $ss on Defence";
      
      $o = $tax * $other['factor'];      
      echo "<p>You spend $o on other";
      
      
      
    ?>
    
	</div>
</body>
</html>