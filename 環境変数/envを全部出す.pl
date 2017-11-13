#!/usr/local/bin/perl

print "Content-type: text/html\n\n";
print "<TABLE BORDER=\"1\">\n";

for $key (sort(keys(%ENV))) {
    print "<TR><TD><TT>$key</TT></TD><TD><TT>$ENV{$key}</TT></TD></TR>\n";
}

print "</TABLE>\n";
exit;
