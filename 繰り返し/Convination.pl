# combination�̎���
# 2017/3/1 (c) y.ikeda
# �Q�l:http://www.programming-magic.com/20090123132035/

use strict;

require "Convination_iterator.pl";


# nCr
my $n = 6;
my $r = 3;
# [0, 1, 2, ...]�Ƃ����T�C�Yn�̔z����쐬
my @data;
for( my $i=0; $i<$n; $i++ ){
	push( @data, $i );
}

# ���ׂĂ̑g�ݍ��킹���o��
do {
	print("[ " . $data[0]);
	for( my $i=1; $i<$r; $i++ ){
		print(", " . $data[$i]);
	}
	print(" (");
	for( my $i=$r; $i<$n; $i++ ){
		print(", " . $data[$i]);
	}
	print(" )]\n");
}while( ConvinationIterator::next_conbination( \@data, $r ) );


