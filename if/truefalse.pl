$aa = true;
if( $aa ){
	# こっち通る
	print "true\n";
}else{
	print "false\n";
}

$aa = false;
if( $aa ){
	# こっち通る！
	# perlにはfalseという概念はない模様なので注意
	print "true\n";
}else{
	print "false\n";
}

# じゃぁどうしたらいいかというと・・
$aa = 0;
if( $aa ){
	print "true\n";
}else{
	# こっち通る！ok.
	# いちいち、$aa == 0 とか書かなくていい
	print "false\n";
}

