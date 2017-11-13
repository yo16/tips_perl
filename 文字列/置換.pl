
use strict;

my $str = "This is a pen. This is my pen.";

$str =~ s/pen/book/g;
print "$str\n";


# s///g��g������ƁA�S���u��
my $gOption = "aabbaabb";
$gOption =~ s/a+/X/g;
print("g:$gOption\n");
# g:XbbXbb
$gOption = "aabbaabb";
$gOption =~ s/a+/X/;
print("non-g:$gOption\n");
# non-g:Xbbaabb


my $strPath = "aa/bb/ccc/dd/ee/";
$strPath =~ s/\//\\\//g;
print "$strPath\n";


my $str2 = "aabbbbbcc";
$str2 =~ s/(a+)b+(c+)$/\1---\2/;
print "$str2\n";
# aa---cc

# �� s/(.+)b+(c+)$�Ƃ��Ă��܂��ƁE�E�E
$str2 = "aabbbbbcc";
$str2 =~ s/(.+)b+(c+)$/\1---\2/;
print "$str2\n";
# aabbbb---cc
# �ŏ���"."�ɁAb���܂܂�Ă��܂��̂Ŏ��s�I���ӁI


my $str3 = "a   b   cc     ";
$str3 =~ s/\s*$//;
print ">$str3<\n";
#>a   b   cc<
