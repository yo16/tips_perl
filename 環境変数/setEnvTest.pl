#!/usr/local/bin/perl

$ENV{'ENV_TEST'} = "Ç≈Ç´ÇÈÇ©Ç»Å`";

open(IN, "echo %ENV_TEST% |");
while (<IN>) {
    print $_;
}
close(IN);

