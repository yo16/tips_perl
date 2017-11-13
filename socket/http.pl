use strict;
use Socket;
use FileHandle;

# 見るurl
my $host = "133.215.64.2";
my $port = getservbyname('http','tcp');
my $url = "/SEKKAN/sekkantuho/1301-1400.htm";

# proxy
my $proxy_host = "133.215.55.38";
my $proxy_port = "8080";

# http
my $http = '1.1';

my $con_host = '';
my $con_port = '';
if ($proxy_host){
	$con_host = $proxy_host;
	$con_port = $proxy_port;
	$url = "http://$host$url";
}else{
	$con_host = $host;
	$con_host = $port;
	$url = $url;
}





# ソケット作成
my $ip = inet_aton($con_host) || die "host ($con_host) not found";
my $sockaddr = pack_sockaddr_in($con_port, $ip) || die "host($ip) not found.\n";
socket(SOCKET, PF_INET, SOCK_STREAM, 0) || die "socket error.\n";
print "socket ok!\n";

# 接続
connect(SOCKET, $sockaddr) || die "connect $con_host $con_port error.\n";
autoflush SOCKET (1);
print "connect ok!\n";

# HTTP要求を送信
if( $http eq '1.1' ){
print "1.1 $url\n";
	print SOCKET "GET $url HTTP/1.1\n";
	print SOCKET "Host: $host\n";
	print SOCKET "Connection: close\n\n";
}else{
print "1.0 $url\n";
	print SOCKET "GET $url HTTP/1.0\n";
}

# HTTP応答を受信
my $buf = '';
while (chomp($buf=<SOCKET>))
{
	print "$buf\n";
}


close(SOKET);
