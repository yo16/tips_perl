#!/user/local/bin/perl

use XML::Simple;
use LWP::Simple;

my $content = LWP::Simple::get('.\\kiso.xml');
my $parser = XML::Simple->new;
my $users = $parser->XMLin( $content, 
                                    KeyAttr => 'user', 
                                    ForceArray => 1);

print Dumper $users;

print "name:";
print $users->{name};
print "\npass:";
print $users->{pass};

exit;

