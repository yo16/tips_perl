#2003/08/12 22:05 ikeda

# push pop �̎g����

@myArray = ('aaa', 'bbb');

push( @myArray, 'ccc');

print $myArray[2]."\n";


$elements = pop( @myArray );
print $elements."\n";

# �󂯂Ȃ��Ă��悢�H
pop( @myArray );

print "���́B�B�B".@myArray."\n";




@myArray = ();

push( @myArray, 'ccc');

print $myArray[0]."\n";


# �z��ɔz���ǉ�
my @ary1 = ('a','b');
my @ary2 = ('c','d');
push(@ary1, @ary2);
foreach $elm (@ary1){
	print $elm."\n";
}