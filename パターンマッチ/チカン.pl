# 2003/08/13 22:28 ikeda

$str = "abababcxxxxabc";


#$str =~ tr/.*?abc/o/;
$str =~ tr/.*?abc//;


print $str."\n";




# 2004/05/12 ikeda append

# �u���֐�s///���g���B�itr�Ƃ̈Ⴂ�͒m��Ȃ��B�B�B�j
# g������ƁA�S���u��

# g�I�v�V�����Ȃ�
$str = "abcabc";
$str =~ s/abc/---/;

print $str."\n";

# g�I�v�V��������
$str = "abcabc";
$str =~ s/abc/---/g;

print $str."\n";

