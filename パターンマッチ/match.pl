#!usr/local/bin/perl

# �ϐ��ɕ���������Ă݂�B
$TestStr = "AbCdEfG";

#if ($TestStr =~ /abcdefg/) {
if ($TestStr =~ /abcdefg/i) {	# i������Ƒ啶���������͖���
	print "�}�b�`�����";
} else {
	print "�}�b�`���Ȃ���";
};

print "\n";

# �}�b�`�̔ے�
if ("abc" !~ /abc/){
	print "�}�b�`���Ȃ���";
} else {
	print "�}�b�`�����";
};


print "\n";
