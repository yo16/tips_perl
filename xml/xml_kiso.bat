
rem チェック
perl -c xml_kiso.pl

if not %ERRORLEVEL%==0 (
	echo "エラー";
	pause;
	exit;
)

rem 実行
perl xml_kiso.pl

pause
