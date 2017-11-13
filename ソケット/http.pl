#!/usr/local/bin/perl
# @(#)http.pl Copyright (C)2001 ASH. http://ash.jp/
#
# �ȈՃu���E�W���O�X�N���v�g�iHTTP�j
#   Usage: http.pl URL�ihttp://host:port/dir/file�j
#

use strict;
use Socket;
use FileHandle;

my ($proxy_host, $proxy_port, $http);
my ($con_host, $con_port);
my ($host, $port, $url, $path, $ip, $sockaddr);
my ($arg, $buf);

($arg) = @ARGV;

# HTTP�v���g�R���̃o�[�W����
#$http = '1.1';

# �v���L�V�T�[�o�̐ݒ�
#$proxy_host = 'XXX.XXX.XXX.XXX';
#$proxy_port = 8080;

# �f�t�H���g�z�X�g�̐ݒ�
$host = 'localhost';
$port = getservbyname('http', 'tcp');
$path = '/';

# URL��͏���
$arg =~ m!(http:)?(//)?([^:/]*)?(:([0-9]+)?)?(/.*)?!;
if ($3) {$host = $3;}
if ($5) {$port = $5;}
if ($6) {$path = $6;}
#print "host=$host, port=$port, url=$url\n";

if ($proxy_host) {
  # �v���L�V�T�[�o�o�R
  $con_host = $proxy_host;
  $con_port = $proxy_port;
  $url = $arg;

} else {
  $con_host = $host;
  $con_port = $port;
  $url = $path;
}

# �\�P�b�g�̐���
$ip = inet_aton($con_host) || die "host($con_host) not found.\n";
$sockaddr = pack_sockaddr_in($con_port, $ip);
socket(SOCKET, PF_INET, SOCK_STREAM, 0) || die "socket error.\n";

# �\�P�b�g�̐ڑ�
connect(SOCKET, $sockaddr) || die "connect $con_host $con_port error.\n";
autoflush SOCKET (1);

# HTTP�v���𑗐M
if ($http eq '1.1') {
  print SOCKET "GET $url HTTP/1.1\n";
  print SOCKET "Host: $host\n";
  print SOCKET "Connection: close\n\n";

} else {
  print SOCKET "GET $url HTTP/1.0\n\n";
}

# HTTP��������M
while (chomp($buf=<SOCKET>)) {
  print "$buf\n";
}

# �I������
close(SOCKET);
