#2003/08/12 21:35 ikeda

# �z��̐����Ăǂ�����Đ�����́H

@myarray = ('aaa', 'bbb', 'ccc');



print "1>".@myarray."<\n";		# ���ꂪ���I
print "2>".$#myarray."<\n";		# ������͍Ō��index


# �Ƃقق�perl���������ƁA
# print @myarray �ŁAaaa bbb ccc �ƕ\������Ə����Ă���
# �o�[�W�������Ⴄ�Ɠ������Ⴄ�̂����B



#scalar�ł�����
#�Ȃ�ƂȂ��������̕����A�Ӑ}���͂����肵�ĂĂ����C������
print "3>".scalar(@myarray)."<\n";

