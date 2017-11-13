#2003/08/12 17:07	ikeda


if ( 1==2 ) {
	print "ture\n";
} elsif ( 1==1 ) {
	print "false-ture\n";
} else {
	print "false-false\n";
};


if (
	( 1==1 )  &&		# かつ
	( 1==1 )
) {
	print "ture\n";
} else {
	print "false\n";
}

if (
	( 1==1 )  ||		# または
	( 1==1 )
) {
	print "ture\n";
} else {
	print "false\n";
}

# 否定
if( !0 ){
	print ("!0\n");
}




# 文字列の比較
my $a1 = "A";
my $a2 = "B";
if( $a1 == $a2 ){	# 間違い！！注意！！
	print("same!\n");
}else{
	print("differrent!\n");
}
if( $a1 eq $a2 ){
	print("same!\n");
}else{
	print("differrent!\n");
}
# 文字列の場合は、eqを使う。
# ==を使うと、違っててもtrueになる。
if( "A" ne "B"){
	print "違う場合はne\n";
}
