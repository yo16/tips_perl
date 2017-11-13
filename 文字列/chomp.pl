#2003/08/12 18:17 ikeda

#chompの使い方


$str = "aaa\n";


print "chomp前\n";
print ">".$str."<\n";

chomp $str;

print "chomp後\n";
print ">".$str."<\n";



#-------------------------------------
print "こんな使い方もできる？？\n";

$str = "bbb\n";
print(">".(chomp $str)."<\n");

# chop 関数の戻り値として、OK/NGを返すから、>1<と表示されてしまう。