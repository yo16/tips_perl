

#$str = "aaa/*bbb--* /ccc/*--ddd*/eee/ *hh*/--fff/*ggg*/";
#$str = "aabbccddee";
#$str = "/*-----------aa";
#$str = "aaa  -- bbb";
$str = "END proc_A;	-- proc_A";
$nowCommentFG = 0;


&CommentCut(
	$str			,
	$nowCommentFG
);


print "str:$str\n";
print "FG :$nowCommentFG\n";

exit;


###########################################

sub CommentCut{
	# �f�o�b�O�R�[�h���o�͂���
	local($dbg) = 1;
	
	
	# �p�����[�^���󂯎��
	# ������
	local($v_str) = $_[0];
	# �R�����g���t���O
	#	���̑O�̍s�ŁA�����s�R�����g�͈͓̔����ۂ� [1:�R�����g�� | 0:�R�����g�O]
	local($v_commentFG) = $_[1];
	
	# �ă`�F�b�N�t���O
	#	�܂��R�����g������\��������ꍇ�A�t���O�𗧂Ă�
	local($reCheckFG) = 0;
	
	
$dbg && print "dbg:0\n";
		
	# �����s�R�����g�͈͓̔��̏ꍇ
	if ( $v_commentFG ) {
		
$dbg && print "dbg:1\n";
		
		# �����s�R�����g�̏I�����������ꍇ
		if ( $v_str =~ /.*\*\// ) {
$dbg && print "dbg:2\n";
		
			# �u*/�v�܂ł̕�������ŒZ��v�����A�폜����
			$v_str =~ s/.*?\*\///;
			
			# �ă`�F�b�N�t���O�𗧂Ă�
			$reCheckFG = 1;
			
			# �R�����g���t���O��|��
			$v_commentFG = 0;
			
		# �����s�R�����g�̏I���������Ȃ��ꍇ
		} else {
$dbg && print "dbg:3\n";
		
			# �S�s���폜����
			$v_str = "";
			
		}
	
	# �����s�R�����g�͈̔͊O�̏ꍇ
	} else {
$dbg && print "dbg:4\n";
		
		
		# �����s�R�����g�̊J�n���������ꍇ
		if ( $v_str =~ /.*\/\*/ ) {
$dbg && print "dbg:5\n";
		
			
			# �J�n��ɁA�����s�R�����g�̏I�����������ꍇ
			if ( $v_str =~ /.*?\/\*.*?\*\// ) {
$dbg && print "dbg:6\n";
		
				# �u/*�v����u*/�v�̕�������폜����
				$v_str =~ s/\/\*.*?\*\///;
				
				# �ă`�F�b�N�t���O�𗧂Ă�
				$reCheckFG = 1;
				
			# �J�n�͂��邪�A�I���͂Ȃ��ꍇ
			} else {
$dbg && print "dbg:7\n";
				
				# �J�n����s���܂ō폜����
				$v_str =~ s/\/\*.*//;
				
				# �R�����g���t���O�𗧂Ă�
				$v_commentFG = 1;
				
			}
		
		# �����s�R�����g�͑��݂����A�P��s�R�����g���������ꍇ
		} elsif ( $v_str =~ /--/ ) {
$dbg && print "dbg:8\n";
			
			# �R�����g�s���폜����
			$v_str =~ s/--.*//;
			
		}
	
	}
	
	
	# �ă`�F�b�N�t���O�������Ă���ꍇ�A�ă`�F�b�N������i�ċA�j
	if ( $reCheckFG ) {
$dbg && print "dbg:9\n";
		
		&CommentCut(
			$v_str			,
			$v_commentFG	
		);
	
	}
	
	
	# �p�����[�^�֏����߂�
	$_[0] = $v_str;
	$_[1] = $v_commentFG;
	
}

