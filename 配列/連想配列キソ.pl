#2003/08/12 20:51 ikeda

my %xx;

$xx{"Tanaka"} = "man";
$xx{"Suzuki"} = "female";


print $xx{"Tanaka"}."\n";


foreach my $key (keys(%xx))
{
	print "$key=$xx{$key}\n";
}


# ���݃`�F�b�N�́Aexists
if( exists($xx{"Tanaka"}) ){
	print "1\n";
}else{
	print "0\n";
}
if( exists($xx{"TanakaSan"}) ){
	print "1\n";
}else{
	print "0\n";
}



# �v�f��
print( "num=" . scalar(keys %xx) . "\n" );
