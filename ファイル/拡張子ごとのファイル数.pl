# �g���q���Ƃ̃t�@�C����
# 2017/11/14 yo16




# �e�X�g�p�f�[�^�쐬
my $targetDir = "test";
&makeTestData;

# ���s
my %extNum;
&countUpFilesByExt( $targetDir, \%extNum );
foreach my $key (keys(%extNum))
{
	print "$key=$extNum{$key}\n";
}

# �e�X�g�p�f�[�^�̍폜
&cleanTestData;


sub countUpFilesByExt
{
	my $targetDir = $_[0];
	my $refNum = $_[1];
	
	my @files;
	opendir( DIR, $targetDir ) or die("dir open error:$targetDir\n$!\n");
	while( my $name = readdir(DIR) )
	{
		push(@files, $name);
	}
	closedir( DIR );
	
	foreach $name (@files)
	{
		if( ($name eq ".") || ($name eq "..") ){next;}
		
		if( -d "$targetDir\\$name" ){
			# �t�H���_�̏ꍇ�͍ċA
			&countUpFilesByExt( "$targetDir\\$name", $refNum );
		}else{
			# �g���q�𒊏o
			my $ext = substr($name, rindex($name, "."));
			if( exists( $refNum->{$ext} ) ){
				$refNum->{$ext}++;
			}else{
				$refNum->{$ext} = 1;
			}
		}
	}	
	closedir( DIR );
}





# �e�X�g�f�[�^�̍쐬
sub makeTestData
{
	my $targetDir = "test";
	mkdir "test", 0777;
	mkdir "test\\test1", 0777;
	open(OUT, "> test\\test1\\1-1.txt");
	close(OUT);
	open(OUT, "> test\\test1\\1-2.txt");
	close(OUT);
	open(OUT, "> test\\test1\\1-3.pdf");
	close(OUT);
	mkdir "test\\test2", 0777;
	open(OUT, "> test\\test2\\2-1.txt");
	close(OUT);
	open(OUT, "> test\\test2\\2-2.xml");
	close(OUT);
	open(OUT, "> test\\test2\\2-3.pdf");
	close(OUT);
}
# �e�X�g�p�f�[�^�̍폜
sub cleanTestData
{
	unlink "test\\test1\\1-1.txt";
	unlink "test\\test1\\1-2.txt";
	unlink "test\\test1\\1-3.pdf";
	unlink "test\\test2\\2-1.txt";
	unlink "test\\test2\\2-2.xml";
	unlink "test\\test2\\2-3.pdf";
	rmdir "test\\test1";
	rmdir "test\\test2";
	rmdir "test";
}
