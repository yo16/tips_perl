#2003/08/12 22:05 ikeda

# push pop の使い方

@myArray = ('aaa', 'bbb');

push( @myArray, 'ccc');

print $myArray[2]."\n";


$elements = pop( @myArray );
print $elements."\n";

# 受けなくてもよい？
pop( @myArray );

print "数は。。。".@myArray."\n";




@myArray = ();

push( @myArray, 'ccc');

print $myArray[0]."\n";


# 配列に配列を追加
my @ary1 = ('a','b');
my @ary2 = ('c','d');
push(@ary1, @ary2);
foreach $elm (@ary1){
	print $elm."\n";
}