#2003/08/12 18:17 ikeda

#chomp�̎g����


$str = "aaa\n";


print "chomp�O\n";
print ">".$str."<\n";

chomp $str;

print "chomp��\n";
print ">".$str."<\n";



#-------------------------------------
print "����Ȏg�������ł���H�H\n";

$str = "bbb\n";
print(">".(chomp $str)."<\n");

# chop �֐��̖߂�l�Ƃ��āAOK/NG��Ԃ�����A>1<�ƕ\������Ă��܂��B