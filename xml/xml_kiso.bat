
rem �`�F�b�N
perl -c xml_kiso.pl

if not %ERRORLEVEL%==0 (
	echo "�G���[";
	pause;
	exit;
)

rem ���s
perl xml_kiso.pl

pause
