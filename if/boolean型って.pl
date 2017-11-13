#2003/08/12 18:02 ikeda

#boolean型ってIF文に使えるの？？の調査


$b_T = ture;
$b_F = false;

print "１つめのif\n";
if ( $b_T ) {
	print "ture\n";
} else {
	print "false\n";
}



print "２つめのif\n";
if ( $b_F ) {
	print "ture\n";
} else {
	print "false\n";
}


print "使えませんなぁ";
# perlには、boolean型は存在しない。
# 0か、そうでないかで判断されるだけ


