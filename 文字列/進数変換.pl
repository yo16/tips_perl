# 参考
# http://mikeneko.creator.club.ne.jp/~lab/perl/numerical_transform/

#10進数→16進数
$num16 = sprintf("%x", 59);
print "$num16\n";

#16進数→10進数
$num10 = hex($num16);
print "$num10\n";

exit 0;
