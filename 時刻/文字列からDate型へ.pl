use Time::Local;

my $year = 2017;
my $month = 6;
my $day = 1;
my $hour = 8;
my $min = 21;
my $sec = 28;

$year -= 1900;		# ←これやってもやらなくても、なんかうまくやってくれてるみたい。

my $epochTime = timelocal( $sec, $min, $hour, $day, $month, $year );
print("$epochTime\n");
# → 1498864888
# 秒で得られる

# 秒で加減算が可能
$epochTime -= 24 * 60 * 60 * 1;		# １日前

# 日時を取得
($sec, $min, $hour, $day, $month, $year) = localtime($epochTime);
$year += 1900;
print("$year/$month/$day $hour:$min:$sec\n");
# → 2017/5/30 8:21:28
