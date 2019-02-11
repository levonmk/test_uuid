<?php

$options = getopt('n::a::b::') + [
    'n' => '1000',
    'a' => 'mt_rand.php',
    'b' => '1',
];

$batchSize = (int) $options['n'];
$batchNum = (int) $options['b'];

include $options['a'];
for ($i=0; $i<$batchSize; $i++){
    echo generateUuid() . " " . time() . " " . $batchNum . " " . $i . "\n";
}


?>
