<?php
require 'vendor/autoload.php';

use Ramsey\Uuid\Uuid;

function generateUuid() {
    return Uuid::uuid4();
}

?>
