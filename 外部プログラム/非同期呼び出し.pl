# 非同期呼び出し
# 参考
# http://takepierrot.hatenablog.jp/entry/20120408/1333869860
use 5.12.3;
use warnings;
use utf8;
use open IO => qw/:utf8 :std/;

use AnyEvent;

my $done = AnyEvent->condvar;
my $count = 0;

my $timer = AnyEvent->timer(
  after    => 5,
  interval => 2,
  cb       => sub {
    say "イベントキタ―！" if $count < 1;
    say "イベント $count 回目!";
    $count++;
    $done->send if $count > 5
  }
);

my $hima; $hima = AnyEvent->idle(
  cb => sub {
    say "ひまー";
    undef $hima;
  }
);

say "スクリプト開始！ ... 5秒待ちます";
$done->recv;

say "終わり−！";

