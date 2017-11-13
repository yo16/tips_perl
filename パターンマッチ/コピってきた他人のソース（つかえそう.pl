#2003/08/12 19:00 ikeda
#元ネタ  http://www2u.biglobe.ne.jp/~MAS/perl/ref/index.html  のリファレンス[tr]


# $aの1をaに、2をbに、3をcに変換する
# 例) 01234abcde → 0abc4abcde
$a =~ tr/123/abc/;

# $aの小文字に変換する
# 例) ABcd → abcd
$a =~ tr/A-Z/a-z/;

# $aのアルファベットの数を$countに入れる
$count = ($a =~ tr/a-zA-Z//);

# $aのアルファベット以外の数を$countに入れる
# 例) 12abc の時 2
$count = ($a =~ tr/a-zA-Z//c);

# $aの数字を削除する
# 例) a1b2c3 → abc
$a =~ tr/0-9//d;

# $aの連続した数字をそれぞれ一つにする
# 例) 122333221 → 12321
$a =~ tr/0-9//s;

# $aの連続した数字をまとめて+にする
# 例) a135b → a+b
$a =~ tr/0-9/+/s;
