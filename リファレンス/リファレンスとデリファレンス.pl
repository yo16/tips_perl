# ���t�@�����X�ƃf���t�@�����X
# 2011/10/19 y.ikeda
# http://www.tohoho-web.com/lng/199912/99120147.htm

@a[0] = "aa";
@a[1] = "bb";

# ���t�@�����X
$pa = \@a;

# �f���t�@�����X
@a2 = @{$pa};



for( $i=0; $i<@a2; $i++ ){
	print "$i:@a2[$i]\n";
}

