#2005/12/01 17:49 ikeda 

opendir(DIR, ".");
while ( $file = readdir(DIR) )
{
	if ( $file =~ /\.txt$/ ) {
		print "text����[" . $file . "]\n";
		
		# �t�@�C�����J��
		open(IN, $file);
		
		# �P�s�ǂ�
		$str = <IN>;
		
		# �t�@�C�������
		close(IN);
		
		# �o��
		print $str;
	}
}
closedir(DIR);
