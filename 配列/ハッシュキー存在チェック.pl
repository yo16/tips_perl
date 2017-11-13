# ハッシュキー存在チェック
# 2017/11/14 y.ikeda

my %test;

$test{'a'} = 1;


print "a:" . exists($test{'a'}) . "\n";		# 1
print "b:" . exists($test{'b'}) . "\n";		# 空
