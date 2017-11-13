open(IN, "test.txt");



print "(1)\n";
$str = <IN>;
print "1:".$str;

$str = <IN>;
print "2:".$str;

;


close(IN);

