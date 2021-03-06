#!/usr/local/bin/perl
# @(#)http.pl Copyright (C)2001 ASH. http://ash.jp/
#
# 簡易ブラウジングスクリプト（HTTP）
#   Usage: http.pl URL（http://host:port/dir/file）
#

use strict;
use Socket;
use FileHandle;

my ($proxy_host, $proxy_port, $http);
my ($con_host, $con_port);
my ($host, $port, $url, $path, $ip, $sockaddr);
my ($arg, $buf);

($arg) = @ARGV;

# HTTPプロトコルのバージョン
#$http = '1.1';

# プロキシサーバの設定
#$proxy_host = '172.16.32.7/proxy_uel.pac';
$proxy_host = '172.16.32.7';
$proxy_port = 8080;

# デフォルトホストの設定
$host = 'localhost';
$port = getservbyname('http', 'tcp');
$path = '/';

# URL解析処理
$arg =~ m!(http:)?(//)?([^:/]*)?(:([0-9]+)?)?(/.*)?!;
if ($3) {$host = $3;}
if ($5) {$port = $5;}
if ($6) {$path = $6;}

if ($proxy_host) {
  # プロキシサーバ経由
  $con_host = $proxy_host;
  $con_port = $proxy_port;
  $url = $arg;

} else {
  $con_host = $host;
  $con_port = $port;
  $url = $path;
}
print "host=$host, port=$port, url=$url\n";

# ソケットの生成
$ip = inet_aton($con_host) || die "host($con_host) not found.\n";
$sockaddr = pack_sockaddr_in($con_port, $ip);
socket(SOCKET, PF_INET, SOCK_STREAM, 0) || die "socket error.\n";

# ソケットの接続
connect(SOCKET, $sockaddr) || die "connect $con_host $con_port error.\n";
autoflush SOCKET (1);

# HTTP要求を送信
if ($http eq '1.1') {
  print SOCKET "GET $url HTTP/1.1\n";
  print SOCKET "Host: $host\n";
  print SOCKET "Connection: close\n\n";

} else {
  print SOCKET "GET $url HTTP/1.0\n\n";
}

# HTTP応答を受信
while (chomp($buf=<SOCKET>)) {
  print "$buf\n";
}

# 終了処理
close(SOCKET);
