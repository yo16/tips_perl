my @ary1 = ();

my @ary2 = ('a','b');

my @ary3 = ();

my @ary4 = ('d');


push( @ary1, @ary2 );
push( @ary1, @ary3 );	# �������ƁA���������
push( @ary1, @ary4 );

# �ŏIindex
print "last index:$#ary1\n";
# �v�f��
print "�v�f��:".scalar(@ary1)."\n";

my $i = 0;
foreach my $val (@ary1)
{
	print "$i:$val\n";
	$i++;
}
print "end\n";
