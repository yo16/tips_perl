#2003/08/12 21:32 ikeda

@myarray = ('aaa', 'bbb', 'ccc');

# �����l�̓[���I
print $myarray[1]."\n";
# bbb

# �v�f��
print "�v�f��:".scalar(@myarray)."\n";
# �ŏIindex
print "�ŏIindex:".$#myarray."\n";



# ������
@ary = ();



# �������Q
my @ary2 = ("0") x 10;
print(scalar(@ary2)."\n");




# �Q�����z��

$a = 3;
if( $a==1 ){
	#���̏�������OK
	@ary2 = (
		['l','m','n'],
		['x','y','z']
	);
}elsif( $a==2 ){
	#���̏�������OK
	@ary2 = ();
	@ary21 = ('l','m','n');
	@ary22 = ('x','y','z');
	@{$ary2[0]} = @ary21;
	@{$ary2[1]} = @ary22;
}elsif( $a==3 ){
	#�֐��̖߂�l���������
	@ary2 = ();
	@{$ary2[0]} = ("abcxaxbcx" =~ /bc/g);
}

for( $i=0; $i<scalar(@ary2); $i++ ){
	print $i."-".scalar(@{$ary2[$i]})."\n";
	for( $j=0; $j<scalar(@{$ary2[$i]}); $j++ ){
		print "\t".$j.":".$ary2[$i][$j]."\n" ;
	}
}
