<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>helloworld</title>
    </head>
    <body>
        <?php
        require_once('../tedx-config.php');
        // Try to log
        $message = $tedx_manager->login('Penelope', 'anitakevinlove'); // Visitor
        echo '<strong>' . $message->getMessage() . '</strong><br />'; // Display message
        ?>
    </body>
</html>
