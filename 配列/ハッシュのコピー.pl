# ハッシュのコピーのテスト

my %aa;

$aa{'a'} = 10;
$aa{'b'} = 20;


my %bb = %aa;

$bb{"a"}++;
print "aa:$aa{'a'}\n";
print "bb:$bb{'a'}\n";

# 結論：%で代入しておけばいい

