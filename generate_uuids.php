<?php

$options = getopt('n::a::') + [
    'n' => '1000',
    'a' => 'mt_rand.php',
];

$batchSize = (int) $options['n'];

include $options['a'];
for ($i=0; $i<$batchSize; $i++){
    echo generateUuid() . "\n";
}


?>
