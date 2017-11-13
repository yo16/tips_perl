use strict;
use warnings;

my $fileName = 'test.txt';

# ファイルでもフォルダでも、存在を確認するときは-e
if ( -e $fileName ) {
	print "$fileNameが存在します\n";
}else{
	print "$fileNameが存在しません\n";
}


# ファイルとフォルダを区別する場合は、
# ファイルは-f
# フォルダは-d
