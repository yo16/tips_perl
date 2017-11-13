#2003/08/12 21:32 ikeda

@myarray = ('aaa', 'bbb', 'ccc');

# 初期値はゼロ！
print $myarray[1]."\n";
# bbb

# 要素数
print "要素数:".scalar(@myarray)."\n";
# 最終index
print "最終index:".$#myarray."\n";



# 初期化
@ary = ();



# 初期化２
my @ary2 = ("0") x 10;
print(scalar(@ary2)."\n");




# ２次元配列

$a = 3;
if( $a==1 ){
	#この書き方でOK
	@ary2 = (
		['l','m','n'],
		['x','y','z']
	);
}elsif( $a==2 ){
	#この書き方もOK
	@ary2 = ();
	@ary21 = ('l','m','n');
	@ary22 = ('x','y','z');
	@{$ary2[0]} = @ary21;
	@{$ary2[1]} = @ary22;
}elsif( $a==3 ){
	#関数の戻り値も入れられる
	@ary2 = ();
	@{$ary2[0]} = ("abcxaxbcx" =~ /bc/g);
}

for( $i=0; $i<scalar(@ary2); $i++ ){
	print $i."-".scalar(@{$ary2[$i]})."\n";
	for( $j=0; $j<scalar(@{$ary2[$i]}); $j++ ){
		print "\t".$j.":".$ary2[$i][$j]."\n" ;
	}
}
