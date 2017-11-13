
@ary = ();


$ary[2] = "2";

print $ary[0]."\n";
print $ary[1]."\n";
print $ary[2]."\n";
print $ary[3]."\n";

print "---------\n";

if( $ary[0] == undef ){
	print "\$ary[0] is undef!\n";
}else{
	print "\$ary[0] is NOT undef!?\n";
}
