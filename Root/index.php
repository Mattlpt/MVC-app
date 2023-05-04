<?php

define('ROOT', dirname(__FILE__));
define('root', dirname(ROOT));
define('DS', DIRECTORY_SEPARATOR);
define('CORE' ,root.DS.'Core');
define('BASE_URL', dirname(dirname($_SERVER['SCRIPT_NAME'])));


/*
 * Inclusion de toutes les classes nécessaires pour faire tourner l'application
 */

require '../Core/Request.php';
require '../Core/Dispatcher.php';
new Dispatcher();

?>

<pre>

</pre>
