use strict;

print "なんか入力してください！\n";
print "=>";

my $str = <STDIN>;
chomp($str);	# chompしないと、改行が入る

print "入力した文字列は・・・・\n";
print "＞＞＞$str＜＜＜\n";

