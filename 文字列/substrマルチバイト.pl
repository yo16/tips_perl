
$str1 = "あxいxxdあおいうえaapaaaaaa\\12345";
$str1 = substr($str1,rindex($str1, "\\"));

print $str1."\n";

print "aaa$str1bbbbb\n";

