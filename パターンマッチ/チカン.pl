# 2003/08/13 22:28 ikeda

$str = "abababcxxxxabc";


#$str =~ tr/.*?abc/o/;
$str =~ tr/.*?abc//;


print $str."\n";




# 2004/05/12 ikeda append

# 置換関数s///を使う。（trとの違いは知らない。。。）
# gをつけると、全部置換

# gオプションなし
$str = "abcabc";
$str =~ s/abc/---/;

print $str."\n";

# gオプションあり
$str = "abcabc";
$str =~ s/abc/---/g;

print $str."\n";

