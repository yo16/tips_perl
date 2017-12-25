# rtrim
# 2016/12/14 yo16

# そんな関数はない！

# なので自作
sub ltrim {
	my $val = shift;
	$val =~ s/^\s*//;
	return $val;
}
sub rtrim {
	my $val = shift;
	$val =~ s/\s*$//;
	return $val;
}



# substrでマイナス
my $str = "012345";
print(substr($str, -1, 1));
