#!usr/local/bin/perl

# 変数に文字列を入れてみる。
$TestStr = "AbCdEfG";

#if ($TestStr =~ /abcdefg/) {
if ($TestStr =~ /abcdefg/i) {	# iがあると大文字小文字は無視
	print "マッチするよ";
} else {
	print "マッチしないよ";
};

print "\n";

# マッチの否定
if ("abc" !~ /abc/){
	print "マッチしないよ";
} else {
	print "マッチするよ";
};


print "\n";
