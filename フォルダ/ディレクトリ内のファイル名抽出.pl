#2003/08/12 19:28 ikeda

opendir(DIR, ".");
while ( $file = readdir(DIR) )
{
	print "$file\n";
}
closedir(DIR);
