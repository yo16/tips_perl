# �ċA�I�Ƀt�@�C���ꗗ
# 
# 2016/4/19 y.ikeda
# 
# opendir�̕ϐ��ɒ���
# ���̏��������Ƃ��߁I�I�I
# DIR���O���[�o���ϐ��Ȃ̂ŁAclosedir�����Ⴄ

my $dirpath = 'test2';
&listDirs( $dirpath );


sub listDirs
{
	my $targetDir = $_[0];
	print("$targetDir\n\n");
	
	opendir( DIR, $targetDir ) or die ("error:$targetDir\n$!\n");
	while( my $name = readdir( DIR ) )
	{
		if( ($name eq ".") || ($name eq "..") ) { next; }
		
		print("- $name -\n");
		if( -d $name ){
			print("dir:\n");
			&llistDirs( "$targetDir\\$name" );
		}else{
			print("file:\n");
		}
	}
	closedir( DIR );

}
